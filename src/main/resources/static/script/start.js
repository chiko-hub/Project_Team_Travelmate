$(document).ready(function() {
    if (location.pathname === "/travel-start") { // travel-start 화면으로 갈 경우
        localStorage.removeItem('selectedStep');
    } else if($('.sidebar').length === 0){ // 페이지에 header가 포함되어 있는지 확인
        // sidebar가 없는 경우 localStorage 초기화
        localStorage.removeItem('selectedStep');
    }else {
        // sidebar가 있는 경우 localStorage에서 'selected' 버튼 상태 확인
        const selectedStep = localStorage.getItem('selectedStep');
        if (selectedStep && document.getElementById(selectedStep)) {
            document.getElementById(selectedStep).classList.add('selected');
        }
    }
});

// selectStep 함수 정의
function selectStep(buttonElement, page) {
    // 모든 버튼에서 'selected' 클래스를 제거
    const buttons = document.querySelectorAll('.step-button');
    buttons.forEach(btn => btn.classList.remove('selected'));

    // 클릭된 버튼에 'selected' 클래스를 추가
    buttonElement.classList.add('selected');

    // 로컬스토리지에 상태 저장 (클릭된 버튼의 ID를 저장)
    localStorage.setItem('selectedStep', buttonElement.id);

    // 페이지 이동
    location.href = page;
}