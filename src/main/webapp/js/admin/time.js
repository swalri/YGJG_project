// 시작일(input 태그)과 종료일(input 태그) 요소를 가져옵니다.
var startDateInput = document.getElementById('cp_startdate');
var endDateInput = document.getElementById('cp_enddate');

startDateInput.addEventListener('input', function() {
	// 사용자가 날짜를 클리어한 경우
	if (startDateInput.value === '') {
		// 오늘 날짜를 가져오기
		var today = new Date();
		// 날짜를 "yyyy-mm-dd" 형식으로 변환
		var formattedDate = today.toISOString().substring(0, 10);
		// input 요소에 오늘 날짜 설정
		startDateInput.value = formattedDate;
	}
});

// 시작일의 변경을 감지하고 종료일의 최소값을 설정합니다.
startDateInput.addEventListener('change', function() {
	// 시작일의 값을 가져옵니다.
	var startDate = new Date(startDateInput.value);
	// 종료일의 최소값을 시작일로 설정합니다.
	endDateInput.min = startDateInput.value;
	// 종료일의 값을 가져옵니다.
	var endDate = new Date(endDateInput.value);
	// 종료일이 시작일보다 작으면 종료일을 시작일로 설정합니다.
	if (endDate < startDate) {
		endDateInput.value = startDateInput.value;
	}
});

//목표 초기화시 최소값을 오늘날짜로 초기화