function toggleAnswer(element) {
    const allAnswers = document.querySelectorAll('.answer'); // 모든 답변 요소 선택
    const answer = element.nextElementSibling; // 바로 다음 하위 요소 (답변 div)
    // 모든 답변을 숨김
    allAnswers.forEach((item) => {
        if (item !== answer) {
            item.style.display = "none";
        }
    });

    // 클릭된 답변만 토글, 그 이외 답변은 닫힘
    if (answer.style.display === "none" || answer.style.display === "") {
        answer.style.display = "block"; // 답변 표시
    } else {
        answer.style.display = "none"; // 답변 숨기기
    }
}