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

/* 세부 일정 데이터 전송 */
function addPlan() {
    // 폼 데이터 검증 (필요 시 추가)
    const planForm = document.getElementById('planForm');
    if (planForm.checkValidity()) {
        planForm.submit(); // 폼 제출
    } else {
        alert('모든 필수 입력란을 채워주세요.');
    }
}

/*
/!* 일정 추가 *!/
document.getElementById('planForm').addEventListener('submit', function (e) {
    e.preventDefault(); // 폼 기본 동작 막기

    // 사용자 입력값 읽기
    const planName = document.getElementById('planName').value.trim();
    const planDate = document.getElementById('planDate').value;
    const startTime = document.getElementById('planStartTime').value;
    const endTime = document.getElementById('planEndTime').value;

    if (!planName || !planDate || !startTime || !endTime) {
        alert("모든 입력값을 채워주세요.");
        return;
    }

    // 시간 변환 (am06 -> 6, pm01 -> 13)
    const convertTime = (time) => {
        const hour = parseInt(time.slice(2));
        return time.startsWith('pm') ? (hour === 12 ? 12 : hour + 12) : (hour === 12 ? 0 : hour);
    };

    const startHour = convertTime(startTime);
    const endHour = convertTime(endTime);

    if (startHour >= endHour) {
        alert("종료 시간이 시작 시간보다 늦어야 합니다.");
        return;
    }

    // 차지하는 시간 계산 (1시간당 1칸)
    const timeSlots = endHour - startHour;

    // 시작 셀 ID 찾기 (예: "2024-12-05-am06")
    const startCellId = `${planDate}-${startTime}`;
    const startCell = document.getElementById(startCellId);

    // DOM 업데이트
    if (startCell) {
        startCell.innerHTML = planName;
        startCell.style.backgroundColor = '#FFD700'; // 배경색 지정
        startCell.style.gridRow = `span ${timeSlots}`; // 차지하는 칸 설정
    } else {
        alert("선택한 시간에 대한 셀이 존재하지 않습니다.");
    }

    // 패널 닫기
    togglePanel();
});*/
