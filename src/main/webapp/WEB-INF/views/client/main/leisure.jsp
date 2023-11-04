<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css"
	href="../css/client/leisure.css">
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
		<c:if test="${!empty leisurelist}">
			<c:forEach var="lei" items="${leisurelist}">
				<!-- 숙소 div -->
				<div class="lodging-card"
					onclick=" window.location.href = 'l_pay?leisure_id=${lei.leisure_id}';">
					<!-- 숙소 이미지 -->
					<img src="${lei.leisure_img}" alt="" class="lodging-image">
					<!-- 이름, 별점 -->
					<div class="lodging-infoCard">
						<!-- 이름 -->
						<h2 class="lodging-rename">${lei.leisure_name}</h2>
						<!-- 별점 -->
						<p class="lodging-redescription"><h2>★(${lei.leisure_description})</h2></p>
					</div>
					<div class="lodging-priceCard">
						<h2 class="lodging-reprice">1장: ${lei.leisure_price}원</h2>
					</div>
				</div>

			</c:forEach>
		</c:if>
		
	</div>
	
	
	<jsp:include page="../footer/footer2.jsp" />