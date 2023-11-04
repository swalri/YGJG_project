<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>lodging_list</title>
<link rel="stylesheet" href="../css/admin/content/info_page.css">
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage lodging-tablepage">
	<!-- 숙소 정보 -->
	<div class="card-show-table" id="lodging-info">
		<div class="card-header">
			<h6 class="table-header-name">
				<a href="lodging_list">${lod.lodging_name} </a>
			</h6>
		</div>
		<div class="card-body">
			<div class="datatable-container">
				<div style="display: flex; justify-content: space-around;">
					<img src="${lod.lodging_img}" alt=""
						style="width: 150px; height: 150;">
					<div>
						<div>
							숙소 아이디 : <span>${lod.lodging_id}</span><br>
						</div>
						<div>
							종류 : <span>${lod.lodging_type}</span><br>
						</div>
						<div>
							전화번호 : <span>${lod.lodging_phone}</span><br>
						</div>
						<div>
							이메일 : <span>${lod.lodging_email}</span><br>
						</div>
						<div>
							평점 : <span>${lod.lodging_description}</span><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 방정보 -->
	<div class="card-show-table" id="room-info">
		<div style="padding: 10px; border-bottom: 0.01px solid #eaecf4;">
			<input type="text" placeholder="Serch...">
		</div>
		<div class="card-header">
			<h6 class="table-header-name">
				<a> LODGING-ROOM-INFORMATION </a>
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
							<th>인원</th>
							<th>숙박가격</th>
							<th>대실가격</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty room}">
							<c:forEach var="r" items="${room}" varStatus="room_no">
								<tr>
									<c:if test="${page == 1}">
										<th>${room_no.count}</th>
									</c:if>
									<c:if test="${page > 1}">
										<th>${room_no.count+(page-1)*5}</th>
									</c:if>
									<th>${r.room_id}</th>
									<th>${r.room_name}</th>
									<th>${r.room_count}</th>
									<th>${r.room_day_price}</th>
									<th>${r.room_time_price}</th>
									<th><a href="#"
										onclick="confirmAndRedirect('${lod.lodging_id}/room_del?room_id=${r.room_id}')">
											삭제 </a></th>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty room}">
							<tr>
								<th colspan="7">목록이 없습니다!</th>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="datatable-bottom">
				<div>
					<c:if test="${!empty find_name}">
						<input type="button" value="전체목록"
							onclick="location='${lod.lodging_id}?page=${page}';" />
					</c:if>
				</div>
				<div>
					<span>${page}</span> / <span>${maxpage}</span>
				</div>
				<!-- ------------------------------------------------------ -->
				<%--페이징 즉 쪽나누기 추가 --%>
				<div id="LodList_paging">
					<nav class="select-no-page">
						<ul>
							<%-- 검색전 페이징 --%>
							<c:if test="${empty find_name}">
								<c:if test="${page<=1}">
									<li>&lt;</li>
								</c:if>
								<c:if test="${page>1}">
									<li><a href="${lod.lodging_id}?page=${page-1}">&lt;</a></li>
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
										<li><a href="${lod.lodging_id}?page=${a}">${a}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}">
									<li>&gt;</li>
								</c:if>
								<c:if test="${page<maxpage}">
									<li><a href="${lod.lodging_id}?page=${page+1}">&gt;</a></li>
								</c:if>
							</c:if>
							<%-- 검색후 페이징 --%>
							<c:if test="${!empty find_name}">
								<c:if test="${page<=1}">
									<li>&lt;</li>
								</c:if>
								<c:if test="${page>1}">
									<li><a
										href="${lod.lodging_id}?page=${page-1}&find_name=${find_name}">&lt;</a></li>
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
											href="${lod.lodging_id}?page=${a}&find_name=${find_name}">${a}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${page >= maxpage}">
									<li>&gt;</li>
								</c:if>
								<c:if test="${page<maxpage}">
									<li><a
										href="${lod.lodging_id}?page=${page+1}&find_name=${find_name}">&gt;</a></li>
								</c:if>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- ------------------------------------------------------ -->
			</div>
		</div>
	</div>
</div>
<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />