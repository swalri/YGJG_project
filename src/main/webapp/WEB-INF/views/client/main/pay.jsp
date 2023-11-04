<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="../css/client/pay.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

</style>

</head>

<body>

   <jsp:include page="../header/header2.jsp" />

   <!-- 목표 -->
   <!-- 1. 데이터 받아오고 데이터베이스에서 값 출력 -->
   <!-- 2. 데이터 계산 및 결과 도출 -->
   <!-- 3. 데이터 값 넘기기 -->
   <!-- 4. -->

	<form action="buy" method="post">
		<div id="pay-info-wrap">
			<div class="reservation-info">
				<div>
					<h2>예약자 정보</h2>
					<div class="reserv-info">
						<label for="reserv-name">예약자 이름</label> <input type="text"
							name="reserv_name" id="reserv-name" value="${m.name}"> <br>
						<label for="reserv-phone">예약자 전화번호</label> <input type="text"
							name="reserv_phone" id="reserv-phone" value="${m.phone}">
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
					<div class="check-info">
						<label for="CHECK_IN">체크인 날짜</label> <input type="text"
							name="CHECK_IN" id="CHECK_IN" value="${CHECK_IN}" style="margin-bottom: 10px;" > <label
							for="CHECK_OUT">체크아웃 날짜</label> <input type="text"
							name="CHECK_OUT" id="CHECK_OUT" value="${CHECK_OUT}" style="margin-bottom: 10px;"> <label
							for="PEOPLE_NUM">인원 수</label> <input type="text"
							name="PEOPLE_NUM" id="PEOPLE_NUM" value="${PEOPLE_NUM}" style="margin-bottom: 10px;">
					</div>
					<div class="reservation-visit">
						<label><h4>
								방문 수단 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
									name="visit_method" id="visit-method">
									<option value="도보">도보</option>
									<option value="차량">차량</option>
								</select>
							</h4></label>
					</div>





					<div class="payment-info">
						<input type="hidden" name="totalPrice" id="total-price"
							value="${pay}" />
						<h3>
							<div id="result-pay-list">총 결제금액:${pay}</div>
						</h3>
						<button type="submit">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
      function checkSameAsReserver(checkbox) {
        // checkbox가 선택되어 있으면
        if (checkbox.checked) {
          // 예약자 정보의 값을 이용자 정보에 설정한다.
          document.getElementById("user-name").value = document.getElementById("reserv-name").value;
          document.getElementById("user-phone").value = document.getElementById("reserv-phone").value;
        } else {
          // 예약자 정보의 값을 이용자 정보에서 초기화한다.
          document.getElementById("user-name").value = "";
          document.getElementById("user-phone").value = "";
        }
      }
   </script>
   <jsp:include page="../footer/footer.jsp" />
</body>
</html>