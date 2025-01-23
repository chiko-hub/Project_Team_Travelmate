# Team Travelmate 프로젝트 설명서

## 🌍 프로젝트 소개
**Team Travelmate**의 웹사이트 **GetSetGo!** 는 여행 계획 및 관리에 특화된 웹 입니다. 사용자는 여행지와 숙소를 탐색하고, 개인화된 여행 일정을 생성하며, 위시리스트를 관리할 수 있습니다. 관리자(admin)는 장소와 숙소 데이터를 효율적으로 관리할 수 있으며, 통계 데이터를 통해 인사이트를 얻을 수 있습니다. 이 플랫폼은 사용자 친화적인 UI/UX와 강력한 기능을 통해 여행 계획을 간편하게 돕습니다.

`repository 에 존재하는 Team_Travelmate.pdf 를 참고해 주세요`

---

## 주요 기능
### 사용자 기능
1. **회원 관리**
   - 일반 회원가입 및 로그인
   - 카카오 소셜 로그인 지원
   - 비밀번호 찾기 및 변경
   - 마이페이지에서 회원 정보 수정 및 탈퇴

2. **여행지 및 숙소 검색**
   - 카테고리별 검색 기능
   - 상세 정보 확인 (지도 연동 포함)
   - 인기/추천 필터 제공

3. **여행 일정 관리**
   - 최대 5일까지의 여행 일정 생성 가능
   - 세부 일정 추가, 수정, 삭제 기능 제공
   - 일정 공유 코드 생성 및 공유

4. **위시리스트**
   - 관심 있는 장소나 숙소를 위시리스트에 추가 가능
   - 카테고리별 위시리스트 관리
   - 위시리스트 상세보기 및 개별 항목 삭제

### 관리자 기능
1. **데이터 관리**
   - 장소(Place) 및 숙소(Hotel) 등록, 수정, 삭제
   - 사진 업로드를 통한 이미지 관리

2. **회원 관리**
   - 회원 목록 조회 및 관리

3. **통계**
   - 인기 장소 및 호텔 통계 확인

---

## 🛠 기술 스택
| 기술 구분         | 사용 도구                            |
|------------------|------------------------------------|
| **언어**          | Java 17                           |
| **프레임워크**    | Spring Boot 3.x                   |
| **ORM**           | MyBatis                           |
| **데이터베이스**  | MySQL                             |
| **빌드 도구**     | Gradle                            |
| **프론트엔드**    | JSP, HTML5, CSS3, JavaScript, jQuery |
| **API**           | Kakao Maps API, Kakao 소셜 로그인 API |

---

## 📂 프로젝트 구조
```
team-travelmate/
├── src/
│   ├── main/
│   │   ├── java/com/himedia/tp01/
│   │   │   ├── controller/       # 컨트롤러 계층 (MVC)
│   │   │   ├── service/          # 서비스 계층 (비즈니스 로직)
│   │   │   ├── dao/              # 데이터 접근 계층 (MyBatis 매퍼)
│   │   │   └── dto/              # 데이터 전송 객체 (DTO)
│   │   └── resources/
│   │       ├── static/           # 정적 리소스 (CSS, JS 등)
│   │       ├── templates/        # JSP 파일 경로 (뷰)
│   │       └── application.yml/properties # Spring Boot 설정 파일
└────────────────────────────────────────────────────────────────
```

---

## 📦 데이터베이스 스키마
### 주요 테이블
- `member`: 회원 정보 저장
- `plan`: 여행 계획 정보 저장
- `plan_detail`: 세부 일정 정보 저장
- `hotel`: 호텔 정보 저장
- `place`: 관광지 정보 저장
- `wishlist`: 찜 목록 저장
- `wishlist_detail`: 찜 목록 상세 정보 저장

---

## 🚀 시작하기

### 필수 요구사항
- Java 17 이상 설치 필요
- MySQL 데이터베이스 설치 필요

### 설치 및 실행 방법
1. **프로젝트 클론**
    ```bash
    git clone https://github.com/your-repo/team-travelmate.git
    cd team-travelmate
    ```

2. **데이터베이스 설정**
    - MySQL 데이터베이스 생성 후 `application.properties` 또는 `application.yml` 파일에서 DB 연결 정보를 수정합니다.
    ```properties
    spring.datasource.url=jdbc:mysql://localhost:3306/team_travelmate
    spring.datasource.username=root
    spring.datasource.password=adminuser
    ```

3. **프로젝트 빌드**
    ```bash
    ./gradlew build  # 또는 ./mvnw install (Maven 사용 시)
    ```

4. **애플리케이션 실행**
    ```bash
    ./gradlew bootRun  # 또는 ./mvnw spring-boot:run (Maven 사용 시)
    ```

5. **웹 브라우저 접속**
    ```text
    http://localhost:8070/
    ```

---

## 📝 라이선스 및 기여 방법

### 라이선스  
이 프로젝트는 MIT 라이선스 하에 배포됩니다.

### 기여 방법  
1. 이 저장소를 포크합니다.
2. 새로운 브랜치를 생성합니다:
    ```bash
    git checkout -b feature/new-feature-name
    ```
3. 변경 사항을 커밋합니다:
    ```bash
    git commit -m "Add new feature"
    ```
4. 브랜치에 푸시합니다:
    ```bash
    git push origin feature/new-feature-name
    ```
5. Pull Request를 제출합니다.

---

Team Travelmate는 사용자 친화적인 여행 플랫폼으로, 여행 계획을 보다 쉽고 효율적으로 만들어줍니다!
