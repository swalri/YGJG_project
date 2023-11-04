<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>coupon_list</title>
<link rel="stylesheet" href="../css/admin/content/info_page.css">
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
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage coupon-tablepage">
	<!-- 숙소 정보 -->
	<div class="card-show-table" id="coupon-info">
		<div class="card-header">
			<h6 class="table-header-name">
				<a>${cp.cp_id} </a>
			</h6>
		</div>
		<div class="card-body">
			<div>
				<div style="display: flex; justify-content: space-around;">
					<div>
						<div>
							이름 : <span>${cp.cp_name}</span><br>
						</div>
						<div>
							내용 : <span>${cp.cp_detail}</span><br>
						</div>
						<div>
							금액 : <span>${cp.cp_price}</span><br>
						</div>
						<div>
							기간 : <span>${cp.cp_startdate}</span> ~ <span>${cp.cp_enddate}</span>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 방정보 -->
	<div class="card-show-table" id="member-info">
		<div class="card-header">
			<h6 class="table-header-name">
				<a> MEMBER-INFORMATION </a>
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
							<th>전체선택<input type="checkbox" class="all-table-checkbox"></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty mlist}">
							<c:forEach var="m" items="${mlist}" varStatus="m_no">
								<tr class="table-row">
									<th>${m_no.count}</th>
									<th>${m.username}</th>
									<th>${m.name}</th>
									<th>${m.phone}</th>
									<th>${m.email}</th>
									<th>${m.rdate}</th>
									<th><input type="checkbox" class="table-checkbox"></th>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty mlist}">
							<tr>
								<th colspan="7">목록이 없습니다!</th>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="datatable-bottom">
				<div>
					<button type="submit" onclick="Issu_list()">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	let allcheckbox = document.querySelector('.all-table-checkbox');
	let checkboxs = document.querySelectorAll('.table-checkbox');
	let tableRows = document.querySelectorAll('.table-row');

	//전체체크하는 함수
	allcheckbox.addEventListener('click', function() {
		const allChecked = this.checked;
		checkboxs.forEach(function(checkbox) {
			checkbox.checked = allChecked;
		});
	});

	//tr클릭시 체크되는 함수
	tableRows.forEach(function(row) {
		row.addEventListener('click', function(e) {
			const checkbox = row.querySelector('.table-checkbox'); // 해당 tr에서 체크박스 가져오기
			if (e.target !== checkbox) {
				checkbox.checked = !checkbox.checked; // 체크 상태 반전
			}
			allcheckbox.checked = (checkboxs.length == document
					.querySelectorAll(".table-checkbox:checked").length);
			/* console.log(document.querySelectorAll(".table-checkbox:checked").length); */
		});
	});

	function Issu_list() {
		var mlist = [];
		const checkboxes = document.querySelectorAll('.table-checkbox:checked');
		checkboxes.forEach(function(checkbox) {
			const m_id = checkbox.closest('tr')
					.querySelector('th:nth-child(2)').textContent; // username은 두 번째 열 (th)의 내용입니다
			mlist.push(m_id);
		});
		if (mlist.length > 0) {
			var mParams = {
				"cp_id" : `${cp.cp_id}`,
				"mlist" : mlist
			};

			$.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
				type : "POST",//데이터s를 서버로 보내는 방법    
				url : "/admin/coupon_issu", //url 패턴 매핑주소 경로
				data : mParams,
				datatype : "String",
				success : function(data) {
					alert("쿠폰을 배포했습니다");
					location.replace(data);
				},
				error : function() {//비동기식 아작스로 서버디비 데이터를
					alert("data error");
				}
			});//$.ajax			
		} else {
			alert("배포할 대상을 체크해 주세요");
		}

	}
</script>

<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />