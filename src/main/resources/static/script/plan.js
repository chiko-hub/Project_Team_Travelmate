/* 패널 열고 닫기 */
function togglePanel() {
    const panel = document.getElementById("planAddPanel");
    if (panel.style.display === "none" || !panel.style.display) {
        panel.style.display = "block";
    } else {
        panel.style.display = "none";
    }
}