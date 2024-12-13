/* 찜 목록 추가 함수 */
function addWishlist() {
    // 폼 요소 가져오기
    const titleInput = document.getElementById('wishlistTitle');
    const categorySelect = document.getElementById('wishlistCategory');

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

    // FormData 객체 생성 (폼 데이터를 URLSearchParams 형식으로 처리)
    const formData = new URLSearchParams();
    formData.append('wishlist_title', titleInput.value.trim());
    formData.append('wishlist_category', categorySelect.value);

    // Fetch로 데이터 전송
    fetch('/addWishlist', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' // 서버가 form-urlencoded로 처리하도록
        },
        body: formData.toString() // 데이터 전송
    })
        .then(response => response.json()) // 응답을 JSON으로 변환
        .then(data => {
            if (data.status === "success") {
                // 찜 목록 추가 성공 시 페이지 새로고침
                location.reload();
            } else if (data.status === "not_login") {
                // 로그인되지 않은 경우 로그인 페이지로 이동
                alert("로그인이 필요합니다.");
                window.location.href = "/loginForm";
            } else {
                alert("찜 목록 추가 중 오류가 발생했습니다.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("서버와 통신 중 문제가 발생했습니다.");
        });
}

/* wishlist 삭제 */
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

/* place_seq를 form 에 전달하는 togglePanel 함수 */
function toggleWishPanel(panelId, buttonElement) {
    var panel = document.getElementById(panelId);
    panel.style.display = panel.style.display === "block" ? "none" : "block";

    // 데이터 전달
    var WishSeq = buttonElement.getAttribute('data-wish-seq');
    // 폼에 wish_seq 값 저장
    document.getElementById('wishAddForm').setAttribute('data-wish-seq', WishSeq);
}

/* wishlist 에 wish 추가하기 */
function addWish() {
    var wishlistSeq = document.getElementById('wishlistSeq').value; // 선택된 찜 목록 ID
    var wishSeq = document.getElementById('wishAddForm').getAttribute('data-wish-seq'); // 선택된 wish 데이터의 seq
    var wishCategory = document.querySelector('input[name="wish_category"]').value; // hidden 카테고리 값

    if (wishlistSeq && wishSeq) {
        fetch('/addWish', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                wishlistSeq: wishlistSeq,
                wishSeq: wishSeq,
                wishCategory: wishCategory
            }),
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
    } else {
        alert("찜 목록과 장소를 선택해주세요.");
    }
}
