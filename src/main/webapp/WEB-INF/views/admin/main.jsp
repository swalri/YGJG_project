<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="../css/admin/content/main.css">
<link rel="stylesheet" href="../css/admin/content/table.css">
<style type="text/css">
.datatable-container {
	height: 300px; /* 원하는 높이 설정 */
	overflow-y: scroll;
}

/* 테이블 헤더 스타일링 */
.datatable-container thead th {
	position: sticky;
	top: 0; /* 헤더를 화면 위쪽에 고정합니다. */
	background-color: #eee;
}
</style>
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="header/header.jsp" />

<!-- 목록 div -->
<div class="main-tablepage main-selectoter-div">
	<div class="selector-info lodging-register-num"
		onclick="location.href='lodging_list'">
		<div>
			<div class="reg-view lodging-view">
				<span>등록된</span> <span>lodging</span> <span> ${lodging_num}개</span>
			</div>
			<div class="detail-view-link">view details</div>
		</div>
	</div>
	<div class="selector-info member-register-num"
		onclick="location.href='member_list'">
		<div>
			<div class="reg-view member-view">
				<span>등록된</span> <span>member</span> <span> ${member_num}개</span>
			</div>
			<div class="detail-view-link">view details</div>
		</div>
	</div>
	<div class="selector-info coupon-register-num"
		onclick="location.href='coupon_list'">
		<div>
			<div class="reg-view coupon-view">
				<span>등록된</span> <span>coupon</span> <span> ${coupon_num}개</span>
			</div>
			<div class="detail-view-link">view details</div>
		</div>
	</div>
	<div class="selector-info gongji-register-num"
		onclick="location.href='gongji_list'">
		<div>
			<div class="reg-view gongji-view">
				<span>등록된</span> <span>gongji</span> <span> ${gongji_num}개</span>
			</div>
			<div class="detail-view-link">view details</div>
		</div>
	</div>
</div>

<div class="main-tablepage main-selectoter-div">
	<div class="card-show-table" id="reservation-info">
		<div class="card-header">
			<h6 class="table-header-name">
				<a href="reservation_list"> RESERV-INFORMATION </a>
			</h6>
		</div>
		<div class="card-body">
			<div class="datatable-container">
				<table class="table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>숙소 아이디</th>
							<th>방 아이디</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>결제방식</th>
							<th>결제금액</th>
							<th>결제일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty reservlist}">
							<c:forEach var="reserv" items="${reservlist}"
								varStatus="reserv_no">
								<tr>
									<th>${reserv_no.count}</th>
									<!-- 번호 -->
									<th>${reserv.ordername}</th>
									<!-- 회원아이디 -->
									<th>${reserv.lodging_id}</th>
									<!-- 숙소 이름 -->
									<th>${reserv.room_id}</th>
									<!-- 방 이름 -->
									<th>${reserv.check_in}</th>
									<!-- 체크인 -->
									<th>${reserv.check_out}</th>
									<!-- 체크아웃 -->
									<th>${reserv.method}</th>
									<!-- 결제방식 -->
									<th>${reserv.totalamount}</th>
									<!-- 결제금액 -->
									<th>${reserv.payment_date}</th>
									<!-- 결제일 -->
									<th><a href="#"
										onclick="confirmAndRedirect('reserv_del?reserv_id=${reserv.record_id}')">
											삭제 </a></th>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty reservlist}">
							<tr>
								<th colspan="10">목록이 없습니다!</th>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%-- footer페이지 --%>
<jsp:include page="footer/footer.jsp" />