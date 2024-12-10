/* 날짜 범위 선택 캘린더 api */
$(function () {
    $('input[name="datefilter"]').daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Clear',
        },
    });

    $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
        // 날짜 차이 계산
        const startDate = picker.startDate;
        const endDate = picker.endDate;
        const dateDifference = endDate.diff(startDate, 'days'); // 날짜 차이 계산 (일 단위)

        // 5일 이하의 날짜를 선택
        if (dateDifference > 4) {
            alert('일정 생성은 최대 5일까지만 가능합니다.');
            $(this).val(''); // 입력 필드 초기화
        } else {
            $(this).val(startDate.format('YYYY-MM-DD') + ' ~ ' + endDate.format('YYYY-MM-DD'));
        }
    });

    $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });
});

/* 날짜를 지정하고 새 일정을 만들기 */
function roadNewPlan(form, event) {
    event.preventDefault(); // 기본 폼 제출 동작 방지

    // datefilter 필드의 값 가져오기
    const planDate = form.datefilter.value;

    // 날짜 데이터 입력 여부
    if (!planDate) {
        alert("날짜를 선택해주세요.");
    }else{
        // 문자열을 '-' 기준으로 나누기
        const [startDate, endDate] = planDate.split('~');
        alert(`${startDate}부터 ${endDate} 까지의 일정을 생성합니다`);

        // 날짜가 선택되었으면, 해당 값을 가진 폼을 서버로 제출
        form.submit(); // 폼을 서버로 전송
        return false; // 추가로 폼 제출 방지
    }
}