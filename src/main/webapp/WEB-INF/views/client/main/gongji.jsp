<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 목표 -->
<!-- 1. 소개 링크 지정 -->
<!-- 2. 공지사항 데이터 값 가져오고 출력 -->
<!-- 3. 공지사항 값을 보여주는 개수를 페이징 -->
<!-- 4.  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="../css/client/gongji.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://kit.fontawesome.com/83b5abfb54.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

	<jsp:include page="../header/header2.jsp" />

	<div class="gongji-main-page">
		<!-- 메뉴페이지 -->
		<div class="menu-bar">
			<nav>
				<ul>
					<li><a href="intro_list" class="menu-cont"> <span
							class="icon-save-span"><i class="fa-solid fa-user"></i></span>
							회사소개
					</a></li>
					<li><a href="leisure_list" class="menu-cont"> <span
							class="icon-save-span"><i
								class="fa-solid fa-person-skiing"></i></span> 레저
					</a></li>
					<li><a href="#" class="menu-cont"> <span
							class="icon-save-span"><i class="fa-solid fa-thumbtack"></i></span>
							<span> 더보기 </span> <span class="icon-save-span icon-chevron"><i
								class="fa-solid fa-chevron-right"></i></span>
					</a>
						<div class="detail-menu">
							<a href="memInfo_list" class="detail-menu-choice page-selector">마이페이지</a> <a
								href="event_list" class="detail-menu-choice page-selector">이벤트</a>
						</div></li>
				</ul>
			</nav>
		</div>

		<div class="notice-board">
			<h2>공지사항</h2>
			<div class="notice-item">
				<span class="date">2023년 7월 02일</span>
				<div class="content">YGJG 개인정보처리방침 개정안내</div>
			</div>
			<div class="notice-item">
				<span class="date">2023년 7월 11일</span>
				<div class="content">YGJG 위치기반서비스 이용약관 개정안내</div>
			</div>
			<div class="notice-item">
				<span class="date">2023년 7월 13일</span>
				<div class="content">COVID-19 관련 안내</div>
			</div>
			<div class="notice-item">
				<span class="date">2023년 7월 25일</span>
				<div class="content">YGJG 멤버십 제휴 특전 종료 안내</div>
			</div>
			<div class="notice-item">
				<span class="date">2023년 8월 01일</span>
				<div class="content">YGJG 리워즈 회원 이용약관 개정 안내</div>
			</div>
		</div>

		<!-- 광고페이지 div -->
		<div class="vertical-banner">
			<img id="image1" src="img/client/banner1.png" alt="Image 1"> <img
				id="image2" src="img/client/banner2.png" alt="Image 2"> <img
				id="image3" src="img/client/banner3.png" alt="Image 3"> <img
				id="image4" src="img/client/banner4.png" alt="Image 4"> <img
				id="image5" src="img/client/banner5.png" alt="Image 5"> <img
				id="image6" src="img/client/banner6.png" alt="Image 6">
			<!-- Add more images as needed -->
			<div class="vertical-banner-content">
				<!-- Your content goes here -->
			</div>
		</div>
	</div>
	<script src="js/client/gongji.js"></script>
	<jsp:include page="../footer/footer2.jsp" />