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

/* wishlist 찜 삭제 */
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.removeWishlistButton').forEach(button => {
        button.addEventListener('click', function () {
            const wishlistSeq = this.dataset.wishlistSeq;
            deleteWishlist(wishlistSeq);
        });
    });

    function deleteWishlist(wishlistSeq){
        // 사용자에게 확인 메시지 표시
        const userResponse = window.confirm("해당 찜 목록과 담긴 정보가 삭제됩니다. 계속하시겠습니까?");
        if (userResponse) { // '확인'을 클릭할 경우
            fetch('/deleteWishlist', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({wishlistSeq: wishlistSeq}),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert(data.message);
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('서버와의 연결에 문제가 발생했습니다.');
                });
        }
    }
});
