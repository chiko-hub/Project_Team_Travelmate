/* 패널 열고 닫기 */
function togglePanel(panelId) {
    const panel = document.getElementById(panelId);
    panel.style.display = panel.style.display === "block" ? "none" : "block";
}

/* 세부 일정의 정보를 가져와 수정을 패널 열고 닫기 */
function toggleUpdatePanel(planDetailSeq){
    // 수정 패널이 열려있는 상태라면
    if(document.getElementById('planUpdatePanel').style.display === "block")
        togglePanel('planUpdatePanel');
    else{ // 수정 패널이 닫혀있는 상태라면
        // 선택한 planDetail 의 정보 요청 - AJAX 요청 보내기
        fetch('/getPlanDetailForUpdate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // JSON 형식으로 보냄
            },
            body: JSON.stringify({ planDetailSeq: planDetailSeq }), // planDetailSeq를 JSON 객체로 변환
        })
            .then(response => response.json()) // 서버에서 JSON 응답 받기
            .then(data => {
                if (data.success) {
                    // 서버에서 받은 정보를 수정 폼에 자동으로 채우기
                    document.getElementById('planUpdateDetailSeq').value = planDetailSeq;

                    // 장소명 입력
                    document.getElementById('planUpdateName').value = data.planDetail.plan_name;

                    // 날짜 셀렉트 박스 선택 처리 (data-plan-seq 값 기준)
                    Array.from(document.getElementById("planUpdateDate").options).forEach(option => {
                        if (option.getAttribute('data-plan-seq') === data.planDetail.plan_seq.toString()) {
                            option.selected = true;
                            document.getElementById('planUpdateSeq').value = data.planDetail.plan_seq;
                            alert(`${document.getElementById('planUpdateSeq').value}`);
                        } else {
                            option.selected = false;
                        }
                    });

                    // starttime과 endtime이 두 자리를 넘지 않으면 0을 붙여 두 자릿수로 포맷
                    const formattedStartTime = data.planDetail.starttime.toString().padStart(2, '0');
                    const formattedEndTime = data.planDetail.endtime.toString().padStart(2, '0');

                    // 시작 시간 및 종료 시간 셀렉트 박스 선택 처리
                    Array.from(document.getElementById("planUpdateStartTime").options).forEach(option => {
                        option.selected = option.value === formattedStartTime;
                    });
                    Array.from(document.getElementById("planUpdateEndTime").options).forEach(option => {
                        option.selected = option.value === formattedEndTime;
                    });

                    // planUpdatePanel 열기
                    togglePanel('planUpdatePanel');
                } else {
                    // 실패 메시지 표시
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('서버와의 연결에 문제가 발생했습니다.');
            });
    }
}

/* planDate select 요소에 change 이벤트 리스너 추가 */
document.getElementById('planDate').addEventListener('change', function() {
    updatePlanSeq('planDate', 'planSeq');
});
document.getElementById('planUpdateDate').addEventListener('change', function() {
    updatePlanSeq('planUpdateDate', 'planUpdateSeq');
});

/* 선택한 날짜에 맞는 plan_seq 값 가져오기 */
function updatePlanSeq(planDate, planSeq) {
    const planDateSelect = document.getElementById(planDate);
    const selectedOption = planDateSelect.options[planDateSelect.selectedIndex];
    const planSeqInput = document.getElementById(planSeq);

    if (selectedOption) {
        planSeqInput.value = selectedOption.getAttribute('data-plan-seq');
    } else {
        // 선택된 옵션이 없으면 planSeq 값을 초기화
        planSeqInput.value = '';
    }

    alert(planSeqInput.value); // 선택된 plan_seq 값을 출력
}

/* planStartTime, planEndTime select 요소에 change 이벤트 리스너 추가 */
document.getElementById('planStartTime').addEventListener('change', updatePlanStartTime);
document.getElementById('planEndTime').addEventListener('change', updatePlanEndTime);
document.getElementById('planUpdateStartTime').addEventListener('change', updatePlanStartTime);
document.getElementById('planUpdateEndTime').addEventListener('change', updatePlanEndTime);

/* starttime이 endttime보다 크거나, endtime 이 starttime 보다 작을 수 없도록 하는 이벤트 함수 */
/* starttime 선택에 따라 endtime 의 범위가 starttime + 1로 정해진다. */
function updatePlanStartTime(){
    const startTime = parseInt(this.value, 10); // planStartTime의 선택된 값
    const endTimeSelect = document.getElementById("planEndTime");
    const currentEndTime = parseInt(endTimeSelect.value, 10); // 현재 선택된 종료 시간

    // 종료 시간이 아직 선택되지 않았거나 종료 시간이 시작 시간보다 작은 경우
    if (currentEndTime <= startTime) {
        // 종료 시간은 시작 시간 +1로 설정
        const nextEndTime = startTime + 1;

        // 종료 시간이 유효 범위 (1~24) 내에 있는지 확인
        if (nextEndTime <= 24) {
            // 해당 value를 가진 option을 찾아 선택
            Array.from(endTimeSelect.options).forEach(option => {
                option.selected = parseInt(option.value, 10) === nextEndTime;
            });
        }
    }
}

/* endtime 선택에 따라 starttime 의 범위가 endtime - 1로 정해진다. */
function updatePlanEndTime(){
    const endTime = parseInt(this.value, 10); // planEndTime의 선택된 값
    const startTimeSelect = document.getElementById("planStartTime");
    const currentStartTime = parseInt(startTimeSelect.value, 10); // 현재 선택된 시작 시간

    // 시작 시간이 아직 선택되지 않았거나 시작 시간이 종료 시간보다 큰 경우
    if (currentStartTime >= endTime) {
        // 시작 시간은 종료 시간 -1로 설정
        const prevStartTime = endTime - 1;

        // 시작 시간이 유효 범위 (0~23) 내에 있는지 확인
        if (prevStartTime >= 0) {
            // 해당 value를 가진 option을 찾아 선택
            Array.from(startTimeSelect.options).forEach(option => {
                option.selected = parseInt(option.value, 10) === prevStartTime;
            });
        }
    }
}

/* 세부 일정 데이터 추가 */
function addPlan() {
    const planAddForm = document.getElementById('planAddForm'); // 폼 아이디
    const formData = new FormData(planAddForm); // 폼 데이터 수집

    // 유효성 검사 - 비어 있는 필드 확인
    for (const [key, value] of formData.entries()) {
        if (!value.trim()) { // 값이 비어 있으면
            alert(`${key} 값을 입력해주세요.`); // 사용자에게 알림
            const field = planAddForm.elements[key]; // 폼 필드 가져오기
            if (field) field.focus(); // 해당 필드로 포커스 이동
            return; // 추가 요청 중단
        }
    }

    // 겹치는 일정이 있는지 확인 - AJAX 요청 보내기
    fetch('/addPlan', {
        method: 'POST',
        body: formData,
    })
        .then(response => response.json()) // 서버에서 JSON 응답 받기
        .then(data => {
            if (data.success) {
                // 성공 메시지 표시
                alert(data.message);
                location.reload(); // 페이지 새로고침
            } else {
                // 실패 메시지 표시
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('일정을 추가하는 중 문제가 발생했습니다.');
        });
}

/* 세부 일정 데이터 수정 */
function updatePlan(){
    const planAddForm = document.getElementById('planUpdateForm'); // 폼 아이디
    const formData = new FormData(planAddForm); // 폼 데이터 수집

    // plan_seq 값을 가져와 숫자로 변환
    const planSeq = parseInt(formData.get('plan_seq'), 10);
    // plan_detail_seq 값을 가져와 숫자로 변환
    const planDetailSeq = parseInt(formData.get('plan_detail_seq'), 10);

    // 변환된 값을 FormData에 다시 추가 (문자열로 전송하지 않도록 덮어쓰기)
    formData.set('plan_seq', planSeq);
    formData.set('plan_detail_seq', planDetailSeq);

    // 유효성 검사 - 비어 있는 필드 확인
    for (const [key, value] of formData.entries()) {
        if (!value.trim()) { // 값이 비어 있으면
            alert(`${key} 값을 입력해주세요.`); // 사용자에게 알림
            const field = planAddForm.elements[key]; // 폼 필드 가져오기
            if (field) field.focus(); // 해당 필드로 포커스 이동
            return; // 추가 요청 중단
        }
    }

    // 겹치는 일정이 있는지 확인 - AJAX 요청 보내기
    fetch('/updatePlan', {
        method: 'POST',
        body: formData,
    })
        .then(response => response.json()) // 서버에서 JSON 응답 받기
        .then(data => {
            if (data.success) {
                // 성공 메시지 표시
                alert(data.message);
                location.reload(); // 페이지 새로고침
            } else {
                // 실패 메시지 표시
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('일정을 수정하는 중 문제가 발생했습니다.');
        });
}

/* 코드로 새 일정 불러오기 */
function loadPlanByCode(form){
    const planCode = form.elements['loadPlanCode'].value;
    if(!planCode){
        alert("불러올 일정 코드를 입력해주세요");
    }else{
        // 사용자에게 확인 메시지 표시
        const userResponse = window.confirm("기존 일정 코드가 덮어집니다. 계속하시겠습니까?");
        if(userResponse){ // '확인'을 클릭할 경우
            // planCode 에 해당하는 plan 이 있는지 확인 - AJAX 요청
            fetch('/loadPlanByCode', {
                method: 'POST',
                headers: {
                    'Content-Type': 'text/plain', // 문자열임을 명시
                },
                body: planCode,
            })
                .then(response => response.json()) // 서버에서 JSON 응답 받기
                .then(data => {
                    if (data.success) {
                        // 성공 메시지 표시
                        alert(data.message);
                        location.href='loadPlan' // loadPlan 으로 이동
                    } else {
                        // 실패 메시지 표시
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('일정을 불러오는 중 문제가 발생했습니다.');
                });
        }
    }
}

