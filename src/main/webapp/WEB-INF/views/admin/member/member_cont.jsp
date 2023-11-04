<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>member_list</title>
<link rel="stylesheet" href="../css/admin/content/info_page.css">
<style>
.member-detail-page {
	padding: 25px;
	display: flex;
	justify-content: space-between;
}

.mdp {
	display: flex;
}

.sodyd {
	margin-bottom: 50px;
}

.tjs {
	height: inherit;
	border: 1px solid #f4eded;
}

dl {
	margin-right: 25px;
}

dt *, dd * {
	font-size: 23px;
}

dd {
	margin-bottom: 30px;
}

.mem-cp-list {
	margin-top: 10px;
	margin-bottom: 5px;
}
</style>
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage member-tablepage">

	<!-- 예약정보 -->
	<div class="card-show-table" id="member-info">
		<div class="card-header">
			<h6 class="table-header-name">
				<a href="member_list"> MEMBER-DETAIL </a>
			</h6>
		</div>
		<div class="card-body member-detail-page">


			<div class="datatable-container mdp">
				<dl>
					<dt>이름</dt>
					<dd>${mem.name}</dd>
					<dt>이메일</dt>
					<dd>
						<!-- 값이 있을경우 -->
						<c:if test="${!empty mem.email}">
							${mem.email}
						</c:if>
						<c:if test="${empty mem.email}">
							등록되있는 값이 없습니다
						</c:if>
					</dd>
					<dt>전화번호</dt>
					<dd>
						<!-- 값이 있을경우 -->
						<c:if test="${!empty mem.phone}">
							${mem.phone}
						</c:if>
						<c:if test="${empty mem.phone}">
							등록되있는 값이 없습니다
						</c:if>
					</dd>
				</dl>
				<div class="tjs"></div>
				<dl style="height: 200px; overflow-y: scroll; margin-left: 25px;">
					<dt>보유쿠폰</dt>
					<!-- 값이 있을경우 -->
					<c:if test="${!empty mem_cp}">
						<c:forEach var="cp" items="${mem_cp}">
							<dd class="mem-cp-list" onclick="alert('금액 : ${cp.cp_price}원')"
								style="cursor: pointer;">이름 : ${cp.cp_name}</dd>
						</c:forEach>
					</c:if>
					<c:if test="${empty mem_cp}">
						<dd>사용가능한 쿠폰이 없습니다</dd>
					</c:if>
				</dl>
			</div>


			<div class="tjs"></div>


			<div class="datatable-container">
				<dl>
					<dt>이용내역</dt>
					<%-- <dd>숙박(예약 확정 기준) 누적 ${hist_r} 박</dd>
					<dd>쿠폰(사용 확정 기준) 누적 ${hist_c} 장</dd> --%>
				</dl>
			</div>
		</div>
	</div>
</div>
<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />