function showContent(step) {
    const results = document.getElementById("results");
    let content = "";

    switch (step) {

        case "step1":
            content = `
        <h2>STEP 1: 장소 선택</h2>
      `;
            break;
        case "step2":
            content = `
        <h2>STEP 2: 숙소 선택</h2>
      `;
            break;

    }

    results.innerHTML = content;
}
