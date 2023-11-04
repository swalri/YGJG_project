const sidebar = $('#main-page');//가장큰div
const menuContent = $('#menu-bar-div');//왼쪽메뉴div
//실질적인 시작
// 메뉴바 보이게하고 닫기
$('.sub-menu-bar').click(function() {//클릭시 이벤트
	sidebar.toggleClass('open');
	if (sidebar.hasClass('open')) {
		menuContent.css('margin-left', '0px');
	} else {
		menuContent.css('margin-left', '-250px');
	}

});

// 클릭한 버튼의 아이콘 회전
$('.menu-cont').click(function() {
	if ($(this).nextAll('.detail-menu').is(':visible')) {
		$('.detail-menu').slideUp();//슬라이드
		$('.icon-chevron').removeClass('rotate-90');
	} else {
		if ($('.detail-menu').is(':visible')) {
			$('.detail-menu').slideUp();//슬라이드
			$('.icon-chevron').removeClass('rotate-90');
		}
		$(this).nextAll('.detail-menu').slideToggle();//슬라이드
		$(this).find('.icon-chevron').toggleClass('rotate-90');//오른쪽 아이콘 90도로 돌리기
	}
});

// 윈도우 크기에 따라 내부 .item 요소의 width를 조절

/*window.onload = windowSizeof();*/



$(document).ready(function windowSizeof() {
	var windowWidth = $(window).width();//윈도우 width
	if (windowWidth < 800) {
		$('.selector-info').css('width', '100%');
		$('.container-field').css('overflow-y', 'scroll');
		$('.selector-info').css('margin-bottom', '2.5%');
	} else if (windowWidth < 1345) {
		$('.selector-info').css('width', '45%');
		$('.container-field').css('overflow-y', 'hidden');
		$('.selector-info').css('margin-bottom', '2.5%');
	} else {
		$('.selector-info').css('width', '21%');
		$('.container-field').css('overflow-y', 'hidden');
		$('.selector-info').css('margin-bottom', '0%');
	}
});

$(window).on('resize', function windowSizeof() {
	var windowWidth = $(window).width();//윈도우 width
	if (windowWidth < 800) {
		$('.selector-info').css('width', '100%');
		$('.container-field').css('overflow-y', 'scroll');
		$('.selector-info').css('margin-bottom', '2.5%');
	} else if (windowWidth < 1345) {
		$('.selector-info').css('width', '45%');
		$('.container-field').css('overflow-y', 'hidden');
		$('.selector-info').css('margin-bottom', '2.5%');
	} else {
		$('.selector-info').css('width', '21%');
		$('.container-field').css('overflow-y', 'hidden');
		$('.selector-info').css('margin-bottom', '0%');
	}
});

/** 시작, 정지 or 삭제 링크 클릭시 확인하는 함수*/
function confirmAndRedirect(link) {
	var confirmation = confirm("실행하겠습니까?");
	if (confirmation) {
		// 사용자가 확인을 누른 경우 링크를 이동
		window.location.href = link;
	} else {
		alert("취소되었습니다.");
	}
}

// "/" 키를 누르면 특정 요소에 포커스를 설정하는 함수를 호출합니다.
document.addEventListener("keydown", function(event) {
	if (event.key === "/") {
		event.preventDefault(); // 이벤트 기본 동작을 중단시킵니다.
		var inputElement = document.getElementById("find_name");
		// "/" 키를 누르면 input 요소에 포커스를 설정합니다.
		inputElement.focus();
	}
});
