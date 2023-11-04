<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css"
	href="../css/client/lodgingPage.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<!-- 목표 -->
	<!-- 1. 데이터베이스 연동 및 값 출력 -->
	<!-- 2. 데이터 넘기기 -->
	<!-- 3. 페이징 처리 -->
	<!-- 4.  -->
	<jsp:include page="../header/header2.jsp" />
	<!-- 전체 메뉴판 -->
	<div class="lodging-results">
		<c:if test="${!empty lodginglist}">
			<c:forEach var="ld" items="${lodginglist}">
				<!-- 숙소 div -->
				<div class="lodging-card"
					onclick=" window.location.href = 'lodgingRoom_list?lodging_id=${ld.lodging_id}';">
					<!-- 숙소 이미지 -->
					<img src="${ld.lodging_img}" alt="" class="lodging-image">
					<!-- 이름, 별점 -->
					<div class="lodging-infoCard">
						<!-- 이름 -->
						<h2 class="lodging-rename">${ld.lodging_name}</h2>
						<!-- 별점 -->
						<p class="lodging-redescription">
						<h2>★(${ld.lodging_description})</h2>
						</p>
					</div>
					<!-- 숙박, 대실 -->
					<div class="lodging-priceCard">
						<!-- 숙박 -->
						<h2 class="lodging-reprice">숙박: ${ld.min_day_price}원~</h2>
						<%-- 목록에 대실이 null이 아닐경우실행  --%>
						<c:if test="${ld.min_time_price != 0}">
							<!-- 대실 -->
							<h2 class="lodging-time">대실: ${ld.min_time_price}원~</h2>
						</c:if>
					</div>
				</div>

			</c:forEach>
		</c:if>
	</div>
	
	<jsp:include page="../footer/footer2.jsp" />