/* wishlist 찜 만들기 */
function addWishlist() {
    // 폼 요소 가져오기
    const titleInput = document.getElementById('wishlistTitle');
    const categorySelect = document.getElementById('wishlistCategory');
    const form = document.getElementById('wishlistAddForm');

    // 값 확인
    if (!titleInput.value.trim()) {
        alert('이름을 입력해주세요.');
        titleInput.focus();
        return;
    }

    if (!categorySelect.value) {
        alert('종류를 선택해주세요.');
        categorySelect.focus();
        return;
    }

    // 값이 모두 유효하면 폼 제출
    form.submit();
}
