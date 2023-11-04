
// JavaScript
var images = document.querySelectorAll('.vertical-banner img');
var currentIndex = 0;

function changeImage() {
	images[currentIndex].style.display = 'none';
	currentIndex = (currentIndex + 1) % images.length;
	images[currentIndex].style.display = 'block';
}

// Initially hide all images except the first one
for (var i = 1; i < images.length; i++) {
	images[i].style.display = 'none';
}

setInterval(changeImage, 3000);



function goToPage(pageUrl) {
	window.location.href = pageUrl;
}


$('.menu-cont').click(function() {
	$(this).find('.icon-chevron').toggleClass('rotate-90');//오른쪽 아이콘 90도로 돌리기
	$(this).nextAll('.detail-menu').slideToggle();//슬라이드
});



