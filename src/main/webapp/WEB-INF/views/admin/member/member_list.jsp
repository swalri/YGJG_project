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
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage member-tablepage">

	<!-- 예약정보 -->
	<div class="card-show-table" id="member-info">
		<form action="member_list">
			<div style="padding: 10px; border-bottom: 0.01px solid #eaecf4;">
				이름: <input type="text" placeholder="Serch..." name="find_name"
					id="find_name"
					style="border: 1px solid black; border-radius: 15px; padding: 3px; padding-left: 10px;">
				<input type="submit" value="검색" style="cursor: pointer;">
			</div>
			<div class="card-header">
				<h6 class="table-header-name">
					<a href="member_list"> MEMBER-INFORMATION </a>
				</h6>
			</div>
			<div class="card-body">
				<div class="datatable-container">
					<table class="table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>생일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty mlist}">
								<c:forEach var="mem" items="${mlist}" varStatus="mem_no">
									<tr>
										<c:if test="${page == 1}">
											<th>${mem_no.count}</th>
										</c:if>
										<c:if test="${page > 1}">
											<th>${mem_no.count+(page-1)*5}</th>
										</c:if>
										<th><a href="member_cont_${mem.username}">${mem.username}</a></th>
										<th>${mem.name}</th>
										<th>${mem.phone}</th>
										<th>${mem.email}</th>
										<th>${mem.rdate}</th>
										<th><a href="#"
											onclick="confirmAndRedirect('member_del?mem_id=${mem.username}')">
												삭제 </a></th>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty mlist}">
								<tr>
									<th colspan="10">목록이 없습니다!</th>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="datatable-bottom">
					<div>
						<c:if test="${!empty find_name}">
							<input type="button" value="전체목록"
								onclick="location='member_list?page=${page}';" />
						</c:if>
					</div>
					<div>
						<span>${page}</span> / <span>${maxpage}</span>
					</div>
					<!-- ------------------------------------------------------ -->
					<%--페이징 즉 쪽나누기 추가 --%>
					<div id="MList_paging">
						<nav class="select-no-page">
							<ul>
								<%-- 검색전 페이징 --%>
								<c:if test="${empty find_name}">
									<c:if test="${page<=1}">
										<li>&lt;</li>
									</c:if>
									<c:if test="${page>1}">
										<li><a href="member_list?page=${page-1}">&lt;</a></li>
									</c:if>
									<%--현재 쪽번호 출력--%>
									<c:forEach var="a" begin="${startpage}" end="${endpage}"
										step="1">
										<%--현재 페이지가 선택되었다면--%>
										<c:if test="${a == page}">
											<li><a>${a}</a></li>
										</c:if>
										<%--현재 페이지가 선택되지 않았다면 --%>
										<c:if test="${a != page}">
											<li><a href="member_list?page=${a}">${a}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${page >= maxpage}">
										<li>&gt;</li>
									</c:if>
									<c:if test="${page<maxpage}">
										<li><a href="member_list?page=${page+1}">&gt;</a></li>
									</c:if>
								</c:if>
								<%-- 검색후 페이징 --%>
								<c:if test="${!empty find_name}">
									<c:if test="${page<=1}">
										<li>&lt;</li>
									</c:if>
									<c:if test="${page>1}">
										<li><a
											href="member_list?page=${page-1}&find_name=${find_name}">&lt;</a></li>
									</c:if>
									<%--현재 쪽번호 출력--%>
									<c:forEach var="a" begin="${startpage}" end="${endpage}"
										step="1">
										<%--현재 페이지가 선택되었다면--%>
										<c:if test="${a == page}">
											<li><a>${a}</a></li>
										</c:if>
										<%--현재 페이지가 선택되지 않았다면 --%>
										<c:if test="${a != page}">
											<li><a
												href="member_list?page=${a}&find_name=${find_name}">${a}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${page >= maxpage}">
										<li>&gt;</li>
									</c:if>
									<c:if test="${page<maxpage}">
										<li><a
											href="member_list?page=${page+1}&find_name=${find_name}">&gt;</a></li>
									</c:if>
								</c:if>
							</ul>
						</nav>
					</div>
					<!-- ------------------------------------------------------ -->
				</div>
			</div>
		</form>
	</div>
</div>
<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />