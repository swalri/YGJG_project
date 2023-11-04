<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>gongji_list</title>
<link rel="stylesheet" href="../css/admin/content/info_page.css">
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage gongji-tablepage">

	<!-- 예약정보 -->
	<div class="card-show-table" id="gongji-info">
		<form action="gongji_list">
			<div style="padding: 10px; border-bottom: 0.01px solid #eaecf4;">
				이름: <input type="text" placeholder="Serch..." name="find_name"
					id="find_name"
					style="border: 1px solid black; border-radius: 15px; padding: 3px; padding-left: 10px;">
				<input type="submit" value="검색" style="cursor: pointer;">
			</div>
			<div class="card-header">
				<h6 class="table-header-name">
					<a href="gongji_list"> GONGJI-INFORMATION </a>
				</h6>
			</div>
			<div class="card-body">
				<div class="datatable-container">
					<table class="table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>제목</th>
								<th>내용</th>
								<th>조회수</th>
								<th>등록날짜</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty gongjilist}">
								<c:forEach var="g" items="${gongjilist}" varStatus="gno">
									<tr>
										<c:if test="${page == 1}">
											<th>${gno.count}</th>
										</c:if>
										<c:if test="${page > 1}">
											<th>${gno.count+(page-1)*5}</th>
										</c:if>
										<th>${g.gongji_name}</th>
										<th>${g.gongji_title}</th>
										<th><c:if test="${fn:length(g.gongji_cont) >= 10}">
												<button onclick="alert(`${g.gongji_cont}`);">자세히</button>
											</c:if> <c:if test="${fn:length(g.gongji_cont) < 10}">
												<div>${g.gongji_cont}</div>
											</c:if></th>
										<th>${g.gongji_hit}</th>
										<th>${g.gongji_date}</th>
										<th><a href="gongji_edit?gongji_no=${g.gongji_no}">
												수정 </a></th>
										<th><a href="#"
											onclick="confirmAndRedirect('gongji_del?gongji_no=${g.gongji_no}')">
												삭제 </a></th>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty gongjilist}">
								<tr>
									<th colspan="8">목록이 없습니다!</th>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="datatable-bottom">
					<div>
						<button type="button"
							onclick="location.href='gongji_write?page=${page}'">글쓰기</button>
						<c:if test="${!empty find_name}">
							<input type="button" value="전체목록"
								onclick="location='gongji_list?page=${page}';" />
						</c:if>
					</div>
					<div>
						<span>${page}</span> / <span>${maxpage}</span>
					</div>
					<!-- ------------------------------------------------------ -->
					<%--페이징 즉 쪽나누기 추가 --%>
					<div id="gList_paging">
						<nav class="select-no-page">
							<ul>
								<%-- 검색전 페이징 --%>
								<c:if test="${empty find_name}">
									<c:if test="${page<=1}">
										<li>&lt;</li>
									</c:if>
									<c:if test="${page>1}">
										<li><a href="gongji_list?page=${page-1}">&lt;</a></li>
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
											<li><a href="gongji_list?page=${a}">${a}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${page >= maxpage}">
										<li>&gt;</li>
									</c:if>
									<c:if test="${page<maxpage}">
										<li><a href="gongji_list?page=${page+1}">&gt;</a></li>
									</c:if>
								</c:if>
								<%-- 검색후 페이징 --%>
								<c:if test="${!empty find_name}">
									<c:if test="${page<=1}">
										<li>&lt;</li>
									</c:if>
									<c:if test="${page>1}">
										<li><a
											href="gongji_list?page=${page-1}&find_name=${find_name}">&lt;</a></li>
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
												href="gongji_list?page=${a}&find_name=${find_name}">${a}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${page >= maxpage}">
										<li>&gt;</li>
									</c:if>
									<c:if test="${page<maxpage}">
										<li><a
											href="gongji_list?page=${page+1}&find_name=${find_name}">&gt;</a></li>
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