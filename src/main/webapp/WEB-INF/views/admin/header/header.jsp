<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<%-- 전체페이지 --%>
	<div id="main-page">


		<%-- 왼쪽메뉴바--%>
		<jsp:include page="../menubar/menubar.jsp" />


		<%-- 오른쪽 보여주는 페이지 --%>
		<div id="main-bar-div">
			<!-- 헤더페이지 -->
			<header class="headerColor" id="header-bar">
				<!-- <a href="#" id="home-selector">main-home</a> -->
				<!-- 위치 absolute지정 -->
				<button class="sub-menu-bar">
					<i class="fa-solid fa-bars"></i>
				</button>
				<!-- <h2>header페이지입니다</h2> -->
			</header>
			<%-- article페이지 --%>
			<!-- 메인페이지 -->
			<article class="container-field" id="main-article-div">