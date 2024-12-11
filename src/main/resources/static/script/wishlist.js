function showDetails(title, mainDetail, additionalDetail, otherDetail) {
    // 왼쪽 영역 업데이트
    const detailsLeft = document.querySelector(".detailsLeft");
    detailsLeft.innerHTML = `
            <h3>${title} 요약</h3>
            <p>${mainDetail}</p>
        `;

    // 오른쪽 영역 업데이트
    const subBoxes = document.querySelectorAll(".detailsRight .subBox");
    subBoxes[0].innerHTML = `
            <h3>상세 정보</h3>
            <p>${mainDetail}</p>
        `;
    subBoxes[1].innerHTML = `
            <h3>추가 정보</h3>
            <p>${additionalDetail}</p>
        `;
}
