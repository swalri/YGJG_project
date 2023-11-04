<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../css/client/intro.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap"
	rel="stylesheet">
<title>Hotel Introduction</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.20/fullpage.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/3.0.9/fullpage.min.css">
<link rel="stylesheet" type="text/css"
	href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
</head>
<body>
	<div class="scrollarea" id="fullpage">
		<div class="section content" id="content1">
			<h5 class="section-title">
				<img src="../img/client/logo7.png" alt="Your Image"
					class="logo-image" />
			</h5>
			<p class="section-description">
				<br>누구나 <br>맘편히 <br>놀수있는 <br>공간을 드립니다.
			</p>
			<div class="img-box"
				style="background-image: url('img/client/intro.jpg');"></div>
		</div>

		<div class="section content2" id="content2">
			<div class="img-box"
				style="background-image: url('img/client/intro_in.jfif');"></div>
			<h1 class="section-title1">국내의 아름다움을 느낄 수 있는 색다른 숙소</h1>
			<p class="section-description1">
				<br>- 잠만 자는 공간을 넘어 숙소 자체가 여행의 목적으로!! <br>- 남들이 누리지 못한 특별한
				경험을 위한 이색 숙소
			</p>
		</div>

		<div class="section content3" id="content3">
			<div class="img-box"
				style="background-image: url('img/client/intro_p.jpg');"></div>
			<h1 class="section-title2">편리하게 즐기는 여행 기술</h1>
			<p class="section-description2">
				<br>- 몇 번의 탭으로 편리하게 도움을 받아보세요! <br>- 푸시 알림 설정 시 숙박 관련 업데이트
				정보 공유 <br>- 이동 중이나 어디서든 간편하게 예약을 관리 및 오프라인 지도
			</p>
		</div>

		<div class="section content4" id="content4">
			<div class="img-box"
				style="background-image: url('img/client/intro_c.jpg');"></div>
			<h1 class="section-title3">고객의 믿음에 안심을 더하는 서비스</h1>
			<p class="section-description3">
				<br>- 안전하고 청결한 안심되는 숙박! <br>- 정확한 평점과 댓글로 안심되는 숙박 <br>-
				몰카 안심존 서비스 <br>- 매일 소독 서비스
			</p>
		</div>

		<div class="section content5" id="content5">
			<div class="img-box"
				style="background-image: url('img/client/intro_l.jpg');"></div>
			<h1 class="section-title4">부드럽게 이어지는 다양한 서비스</h1>
			<p class="section-description4">
				<br>- 모바일 웹에서도 숙소 및 레저 쉽고 간단하게 예약 <br>- 어플리케이션 이외에도 다양한
				방법으로 서비스 이용 <br>- 숙소 근처에 있는 식당 및 레저 검색
			</p>
		</div>
	</div>

	<div class="floating-button">
		<button id="reservation-button">H O M E</button>
	</div>



	<script>
  new fullpage('#fullpage', {
    autoScrolling: true,
    scrollHorizontally: true
  });
  
  const contents = document.querySelectorAll('.content');
  let sectionIndex = 0;
  let isScrolling = false;

  function showContent(index) {
    contents.forEach(content => content.classList.remove('active'));
    contents[index].classList.add('active');
    
    const imgBoxes = contents[index].querySelectorAll('.img-box');
    imgBoxes.forEach((img, i) => {
      setTimeout(() => {
        img.style.opacity = "1";
        img.style.transform = "translateY(0)";
      }, i * 200); // 시간 간격을 조정하실 수 있습니다.
    });
  }

  document.addEventListener('scroll', () => {
    if (isScrolling) return;
    isScrolling = true;

    setTimeout(() => {
      isScrolling = false;
    }, 100);

    const currentIndex = Math.round(window.scrollY / window.innerHeight);
    if (currentIndex !== sectionIndex) {
      sectionIndex = currentIndex;
      showContent(sectionIndex);
    }
  });
  
//예약 버튼을 클릭할 때 이동할 URL 설정
  document.getElementById("reservation-button").addEventListener("click", function() {
    window.location.href = "main"; // 이동할 URL을 설정하세요.
  });

</script>
</body>
</html>