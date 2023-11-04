// ????
function toggleHintText(inputElement) {
  const hintElement = inputElement.nextElementSibling;
  hintElement.classList.toggle("active", inputElement.value === "");
}
var noticeElement = document.getElementById('notice');
var noticeContents = [
  "공지사항 및 이벤트 내용 1",
  "공지사항 및 이벤트 내용 2",
  "공지사항 및 이벤트 내용 3"
];
var currentIndex = 0;
// *******************************************************************************
/**메인이미지 전환 함수*/
  var images = [
    "url(../img/client/hotel1.jpg)",
    "url(../img/client/hotel6.jpg)",
    "url(../img/client/hotel7.jpg)",
    "url(../img/client/hotel5.jpg)"
    // 여기에 더 많은 이미지 경로를 추가할 수 있습니다.
  ];
function changeImage() {
  var bannerImg = document.querySelector('.banner_img01');
  bannerImg.style.backgroundImage = images[currentIndex];
  currentIndex = (currentIndex + 1) % images.length;
}
// 3초마다 이미지 변경 함수 호출
setInterval(changeImage, 3000);
// 초기에 이미지 설정
changeImage();
// *******************************************************************************
/** 호텔선택버튼 클릭시 필터 함수*/
function toggleHotelChoices() {
  const choice = document.getElementById("hotelChoice");
  if (choice.style.display === "none" || choice.style.display === "") {
    choice.style.display = "block";
  } else {
    choice.style.display = "none";
  }
}
/** select option값이 변경될경우 실행하는 함수*/
/** 호텔선택변경시 값이 변하는 필터 함수*/
function filterByType(type) {
  const allOptions = document.querySelectorAll(".hotel-option");
  allOptions.forEach(option => {
    if (type === "all" || option.classList.contains(type)) {
      option.style.display = "inline-block";
    } else {
      option.style.display = "none";
    }
  });
}
/** 호텔선택 필터함수*/
function selectHotel(name) {
  document.getElementById("selectBox").innerText = name;
  toggleHotelChoices();
}
// *******************************************************************************
//호텔필터
const typeSelector = document.getElementById("typeSelector");
const placeSelector = document.getElementById("placeSelector");

/*document.getElementById("searchButton").addEventListener("click", function () {
  const selectedType = typeSelector.value;
  if (!selectedType) {
    alert("타입을 선택해주세요.");
    return;
  }
  switch (selectedType) {
    case "motel":
      window.location.href = "motel.html";
      break;
    case "hotel":
      window.location.href = "hotel.html";
      break;
    case "pension":
      window.location.href = "pool.html";
      break;
    default:
      alert("잘못된 선택입니다.");
      break;
  }
});*/
// 타입 선택에 따라 장소 옵션을 변경하는 로직 (예시)
// 호텔 필터
typeSelector.addEventListener("change", function () {
  const selectedType = this.value;
  let placeOptions = '';
  switch (selectedType) {
    case "motel":
      placeOptions = '<option value="motelPlace1">모텔 장소1</option>';
      break;
    case "hotel":
      placeOptions = '<option value="hotelPlace1">호텔 장소1</option>';
      break;
    case "pension":
      placeOptions = '<option value="pensionPlace1">팬션/풀빌라 장소1</option>';
      break;
  }
  placeSelector.innerHTML = '<option value="" selected disabled hidden>장소 선택</option>' + placeOptions;
});
// *******************************************************************************
// 체크인 달력
$(function () {
  $("#Date").datepicker({
    //showOn: "both",
    //buttonImageOnly: true,
    changeMonth: true,
    changeYear: true,
    minDate: '-10y',
    nextText: '다음 달',
    prevText: '이전 달',
    numberOfMonths: [1, 1],
    stepMonths: 1,
    yearRange: 'c-100:c+10',
    showButtonPanel: true,
    currentText: '오늘 날짜',
    closeText: '닫기',
    dateFormat: "yy-mm-dd",
    showAnim: "slide",
    showMonthAfterYear: true,
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
  });

  // 체크아웃 달력
  $("#Date1").datepicker({
    //showOn: "both",
    //buttonImageOnly: true,
    changeMonth: true,
    changeYear: true,
    minDate: '-10y',
    nextText: '다음 달',
    prevText: '이전 달',
    stepMonths: 1,
    yearRange: 'c-10:c+20',
    showButtonPanel: true,
    currentText: '오늘 날짜',
    closeText: '닫기',
    dateFormat: "yy-mm-dd",
    showAnim: "slide",
    showMonthAfterYear: true,
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
  });

});
$(document).ready(function () {

  $.datepicker.setDefaults($.datepicker.regional['ko']);
  $("#startDate").datepicker({
    changeMonth: true,
    changeYear: true,
    nextText: '다음 달',
    prevText: '이전 달',
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dateFormat: "yymmdd",
    maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
    onClose: function (selectedDate) {
      //시작일(startDate) datepicker가 닫힐때
      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
      $("#endDate").datepicker("option", "minDate", selectedDate);
    }
  });

  $("#endDate").datepicker({
    changeMonth: true,
    changeYear: true,
    nextText: '다음 달',
    prevText: '이전 달',
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dateFormat: "yymmdd",
    maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
    onClose: function (selectedDate) {
      // 종료일(endDate) datepicker가 닫힐때
      // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
      $("#startDate").datepicker("option", "maxDate", selectedDate);
    }
  });
});

