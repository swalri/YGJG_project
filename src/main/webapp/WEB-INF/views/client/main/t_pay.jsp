<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="../css/client/t_pay.css">
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
	<form action="t_buy" method="post">
		<div id="pay-info-wrap">
			<div class="reservation-info">
				<!-- style="border-right: 1.5px solid black;" -->
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
						<%-- <div id="checkprice">${rl.room_day_price}원</div> --%>
						<h4>
							<label for="PEOPLE_NUM">인원 수</label> <input type="text"
								name="PEOPLE_NUM" id="PEOPLE_NUM" value="${PEOPLE_NUM}">
						</h4>
					</div>
					<div class="reservation-visit">
						<label><h4>
								방문 수단 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
									name="visit_method">
									<option value="도보">도보</option>
									<option value="차량">차량</option>
								</select>
							</h4></label>
					</div>
				</div>
				<div class="payment-info">
					<h3>
						<input type="hidden" name="totalPrice" id="total-price"
							value="${t_pay}" />
						<div id="result-pay-list">총 결제금액: ${t_pay}원</div>
					</h3>
					<a href="api.html">
						<button>결제하기</button>
					</a>
				</div>
			</div>
		</div>
	</form>



	<script>
        const checkboxes = document.querySelectorAll("input[type='checkbox']");
        for (const checkbox of checkboxes) {

            checkbox.addEventListener("change", function () {
                const checkedTime = parseInt(checkbox.value);

                for (let i = 10; i <= 20; i++) {
                    const nextCheckbox = document.getElementById(i);
                    if (nextCheckbox) {
                        nextCheckbox.checked = false;
                    }
                }

                for (let i = checkedTime; i <= checkedTime + 4; i++) {
                    const nextCheckbox = document.getElementById(i);
                    if (nextCheckbox) {
                        nextCheckbox.checked = true;
                    }
                }
            });
        }
    </script>

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