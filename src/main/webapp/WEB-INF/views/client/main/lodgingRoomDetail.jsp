<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css"
	href="css/client/lodgingRoomDetailPage.css">
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
	<jsp:include page="../header/header2.jsp" />

	<!-- 목표 -->
	<!-- 1. 데이터 받아오고 데이터베이스에서 찾아 값 출력 -->
	<!-- 2. 데이터 넘기기 -->
	<!-- 3. 페이징 처리 -->
	<!-- 4.  -->

	<!-- 리스트div -->
	<c:if test="${!empty roomlist}">
		<c:forEach var="rl" items="${roomlist}">
			<c:if test="${rl.room_count >= men}">
				<div class="room-list-box">
					<!-- 이미지, 정보, 세부정보 -->
					<div class="room-list">
						<!-- 이미지 -->
						<div class="room-img">
							<img src="${rl.room_img}">
						</div>
						<!-- 정보 -->
						<div class="room-info">
							<h1>${rl.room_name}</h1>
							<!--  -->
							<h4>인원 : ${rl.room_count}명</h4>
							<h3>숙박 : ${rl.room_day_price}원</h3>
							<!--  -->
							<c:if test="${rl.room_time_price != 0}">
								<h3>대실(4시간) : ${rl.room_time_price}원</h3>
							</c:if>

							<!--  -->
							<div class="room-info-sendbutton">
								<!-- 모텔 : 숙박 대실 -->
								<!-- 호텔 : 숙박 -->
								<!-- 펜션 : 예약하기 -->
								<!-- 지정해 놓기 -->
								<a
									href="pay?room_id=${rl.room_id}&rp=${rl.room_day_price}&roomname=${rl.room_name}"
									class="room-list-choice"> 숙박 </a>
								<c:if test="${type eq 'motel'}">
									<a
										href="t_pay?room_id=${rl.room_id}&rtp=${rl.room_time_price}&roomname=${rl.room_name}"
										class="room-list-choice"> 대실 </a>
								</c:if>
							</div>						</div>
						<!-- 세부정보 -->
						<div class="room-info-details">
							<!--  -->
							<h2>추가 내용</h2>
							<hr>
							<div>${rl.room_detail}</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</c:if>

	<jsp:include page="../footer/footer2.jsp" />