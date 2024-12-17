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
                    if (data.status === "success") {
                        // 찜 목록 삭제 성공 시 페이지 새로고침
                        location.reload();
                    } else if (data.status === "not_login") {
                        // 로그인되지 않은 경우 로그인 페이지로 이동
                        alert("로그인이 필요합니다.");
                        window.location.href = "/loginForm";
                    } else {
                        alert("찜 목록 삭제 중 오류가 발생했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('서버와의 연결에 문제가 발생했습니다.');
                });
        }
    }
});

/* place_seq / hotel_seq 를 form 에 전달하는 togglePanel 함수 */
function toggleWishPanel(panelId, buttonElement) {
    var panel = document.getElementById(panelId);

    // panel이 없으면 함수 종료
    if (!panel) {
        alert("로그인 후 이용 가능합니다.");
        return;
    }
    
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

/* place / hotel 탭에서 wishDetailContainer 를 누를 시 상세 보기 창이 뜨면서 정보를 불러오는 함수 */
function showWishDetail(containerId, wishlistSeq){
    const container = document.getElementById(containerId);

    if(container.dataset.wishlistSeq === wishlistSeq){ // 찜 목록 상세보기가 현재 wishlist 의 데이터라면
        container.style.display = container.style.display === 'block' ? 'none' : 'block'; // 열고 닫기
    }else{ // 찜 목록 상세보기가 현재 wishlist 의 데이터와 다르다면
        container.style.display = 'block'; // 항상 활성화
        container.dataset.wishlistSeq = wishlistSeq; // 새로운 wishlistSeq 값 적용
        loadWishDetail(wishlistSeq); // 새로운 데이터 가져오기
    }
}

/* wishlistItem 클릭 시 해당 상세 정보를 불러오는 함수 */
function loadWishDetail(wishlistSeq) {
    // AJAX 요청 보내기
    $.ajax({
        url: '/getWishDetail', // 서버에서 상세 정보를 가져오는 URL
        method: 'GET',
        data: { wishlist_seq: wishlistSeq }, // wishlist_seq 값 전송
        success: function(response) {
            // 서버에서 받은 상세 정보로 wishDetailItem을 업데이트
            const wishDetailList = document.querySelector('.wishDetailList');
            wishDetailList.innerHTML = '';  // 기존 상세 내용 비우기

            // 받은 상세 정보(response)로 wishDetailItem을 동적으로 생성
            response.forEach(item => {
                const wishDetailItem = document.createElement('div');
                wishDetailItem.classList.add('wishDetailItem');

                const wishImage = document.createElement('div');
                wishImage.classList.add('wishImage');
                const img = document.createElement('img')
                if(item.wish_category === 'place'){ // category 가 place 라면
                    img.src = /place_images/ + item.wish_image;
                }else if(item.wish_category === 'hotel'){ // category 가 hotel 라면
                    img.src = /hotel_images/ + item.wish_image;
                }
                wishImage.appendChild(img);

                const wishText = document.createElement('div');
                wishText.classList.add('wishText');
                const title = document.createElement('div');
                title.classList.add('wishTitle');
                title.textContent = item.wish_name;  // 서버에서 받은 제목
                const location = document.createElement('div');
                location.classList.add('wishLocation');
                location.textContent = item.wish_description;  // 서버에서 받은 설명

                wishText.appendChild(title);
                wishText.appendChild(location);

                const deleteBtn = document.createElement('button');
                deleteBtn.classList.add('deleteBtn');
                deleteBtn.textContent = '×';
                deleteBtn.onclick = function() {
                    deleteWishDetail(item.wishlist_detail_seq);  // 상세 아이템을 삭제하는 함수
                };

                wishDetailItem.appendChild(wishImage);
                wishDetailItem.appendChild(wishText);
                wishDetailItem.appendChild(deleteBtn);

                wishDetailList.appendChild(wishDetailItem);
            });
        },
        error: function() {
            alert('세부 정보를 가져오는 데 실패했습니다.');
        }
    });
}

/* 찜 목록에 담아둔 wishlistDetail 삭제 */
function deleteWishDetail(wishlistDetailSeq){
    // 사용자에게 확인 메시지 표시
    const userResponse = window.confirm("찜 목록에 담긴 해당 정보가 삭제됩니다. 계속하시겠습니까?");
    if (userResponse) { // '확인'을 클릭할 경우
        fetch('/deleteWishDetail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({wishlistDetailSeq: wishlistDetailSeq}),
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