/* 패널 열고 닫기 */
function togglePanel() {
    const panel = document.getElementById("planAddPanel");
    panel.style.display = panel.style.display === "block" ? "none" : "block";
}

/* 선택한 날짜에 맞는 plan_seq 값 가져오기 */
function updatePlanSeq() {
    const planDateSelect = document.getElementById('planDate');
    const selectedOption = planDateSelect.options[planDateSelect.selectedIndex];
    const planSeqInput = document.getElementById('planSeq');
    planSeqInput.value = selectedOption.getAttribute('data-plan-seq');

    alert(planSeqInput.value);
}

/* starttime이 endttime보다 크거나, endtime 이 starttime 보다 작을 수 없도록 하는 이벤트 함수 */
/* starttime 선택에 따라 endtime 의 범위가 starttime + 1로 정해진다. */
document.getElementById("planStartTime").addEventListener("change", function () {
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
});

/* endtime 선택에 따라 starttime 의 범위가 endtime - 1로 정해진다. */
document.getElementById("planEndTime").addEventListener("change", function () {
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
});

/* 세부 일정 데이터 추가 */
function addPlan() {
    const planAddForm = document.getElementById('planAddForm'); // 폼 아이디
    const formData = new FormData(planAddForm); // 폼 데이터 수집

    // AJAX 요청 보내기
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
