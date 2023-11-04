<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="../css/client/pay.css">
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
	<!-- 1. 데이터 받아오고 데이터베이스에서 값 출력 -->
	<!-- 2. 데이터 계산 및 결과 도출 -->
	<!-- 3. 데이터 값 넘기기 -->
	<!-- 4. -->
	<form action="l_buy" method="post">
		<div id="pay-info-wrap">
			<div class="reservation-info">
				<div>
					<h2>예약자 정보</h2>
					<div class="reserv-info">
						<label for="reserv-name">예약자 이름</label> <input type="text"
							id="reserv-name" name="reserv-name" value="${m.name}"> <br>
						<label for="reserv-phone">예약자 전화번호</label> <input type="text"
							id="reserv-phone" name="reserv-phone" value="${m.phone}">
					</div>
				</div>
				<div>
					<h2>이용자 정보</h2>
					<div class="user-info">
						<label for="user-name">이용자 이름</label> <input type="text"
							id="user-name"> <br> <label for="user-phone">이용자
							전화번호</label> <input type="text" id="user-phone">
						<div>
							<input type="checkbox" id="same-as-reserver"
								onchange="checkSameAsReserver(this)"> <label
								for="same-as-reserver">예약자 정보와 동일</label>
						</div>
					</div>
				</div>
			</div>
			<div class="reservation-page">
				<div>
					<h2></h2>
					<div class="check-info"
						style="padding: 50px, 0, 20px, 0; display: flex; justify-content: space-between; align-items: center;">
						<%-- <div id="checkin">체크인: ${CHECK_IN}</div>
               <div id="checkout">체크아웃: ${CHECK_OUT}</div> --%>
						<%-- <div id="checkprice">${rl.room_day_price}원</div> --%>

						<h3>티켓 장수 선택</h3>
						<select name="peopleNum" id="men" onchange="changeTotalPrice()">
							<option value="1">1장</option>
							<option value="2">2장</option>
							<option value="3">3장</option>
							<option value="4">4장</option>
							<option value="5">5장</option>
							<option value="6">6장</option>
						</select>

					</div>
					<br>

					<div class="payment-info">
						<input type="hidden" name="totalPrice" id="total-price"
							value="${leivo.leisure_price}" />
						<div>
							<h3>
								<label class="total-price-label">총 결제 금액 :
									${leivo.leisure_price}원</label>
							</h3>
							<div id="result-pay-list"></div>
						</div>
						<button type="submit">결제하기</button>

					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		const price = ${leivo.leisure_price};
		function changeTotalPrice() {
			const men = document.getElementById('men');
			const peopleNum = parseInt(men.options[men.selectedIndex].value);
			const totalPrice = peopleNum * price;
			document.querySelector('.total-price-label').textContent = `총 결제 금액 : `+ totalPrice + `원`;
			document.getElementById('total-price').value = totalPrice;
		}

		function checkSameAsReserver(checkbox) {
			// checkbox가 선택되어 있으면
			if (checkbox.checked) {
				// 예약자 정보의 값을 이용자 정보에 설정한다.
				document.getElementById("user-name").value = document
						.getElementById("reserv-name").value;
				document.getElementById("user-phone").value = document
						.getElementById("reserv-phone").value;
			} else {
				// 예약자 정보의 값을 이용자 정보에서 초기화한다.
				document.getElementById("user-name").value = "";
				document.getElementById("user-phone").value = "";
			}
		}
	</script>
	<jsp:include page="../footer/footer.jsp" />