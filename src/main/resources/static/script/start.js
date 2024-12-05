function showContent(step) {
    const results = document.getElementById("results");
    let content = "";

    switch (step) {
      //   case "step1":
      //       content = `
      //   <h2>STEP 1: 날짜 확인</h2>
      //   <label for="start-date">출발 날짜:</label>
      //   <input type="date" id="start-date" name="startDate">
      //   <label for="end-date">도착 날짜:</label>
      //   <input type="date" id="end-date" name="endDate">
      //   <button>날짜 설정</button>
      // `;
      //       break;
        case "step1":
            content = `
        <h2>STEP 1: 장소 선택</h2>
        <input type="text" placeholder="장소를 검색하세요">
        <button>장소 선택</button>
      `;
            break;
        case "step2":
            content = `
        <h2>STEP 2: 숙소 선택</h2>
        <input type="text" placeholder="숙소를 검색하세요">
        <button>숙소 선택</button>
      `;
            break;
        case "step3":
            content = `
        <h2>STEP 3: 찜꽁</h2>
        <input type="text" placeholder="찜꽁 목록을 확인하세요">
        <button>찜꽁 확인</button>
      `;
            break;
        case "step4":
            content = `
        <h2>STEP 4: 일정</h2>
        <input type="text" placeholder="일정을 확인하세요">
        <button>일정 확인</button>
      `;
            break;
        default:
            content = "<p>올바른 STEP을 선택하세요.</p>";
    }

    results.innerHTML = content;
}
