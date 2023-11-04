<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>coupon_write</title>
<link rel="stylesheet" href="../css/admin/content/allcontent.css">
<style>
input {
	border: 1px solid black;
}

.aaa {
	display: flex;
	justify-content: center;
}

tr {
	display: flex;
}

th {
	width: 50px;
	margin-bottom: 10px;
	margin-right: 20px;
}

table {
	margin-bottom: 10px;
}
</style>
<%-- css사용 --%>
</head>

<%-- header페이지 --%>
<jsp:include page="../header/header.jsp" />

<!-- 메인페이지 -->
<div class="main-tablepage coupon-writepage">
	<div class="aaa">
		<form action="coupon_write_ok" method="post" id="dateForm"
			style="border-radius: 15px; border: 1px solid black; text-align: left; margin: 10px; padding: 20px;">
			<h2>쿠폰 생성</h2>
			<table id="">
				<tr>
					<th>아이디 :</th>
					<td><input name="cp_id" id="cp_id" size="14" /></td>
				</tr>
				<tr>
					<th>이름 :</th>
					<td><input name="cp_name" id="cp_name" size="14" /></td>
				</tr>
				<tr>
					<th>내용 :</th>
					<td><textarea name="cp_detail" id="cp_detail" rows="9"
							cols="36"></textarea></td>
				</tr>
				<tr>
					<th>금액 :</th>
					<td><input name="cp_price" id="cp_price" size="14" /></td>
				</tr>
				<tr>
					<th>시작일 :</th>
					<td><input type='date' id='cp_startdate' name="cp_startdate"
						min="<%=java.time.LocalDate.now()%>"
						value="<%=java.time.LocalDate.now()%>" /></td>
				</tr>
				<tr>
					<th>종료일 :</th>
					<td><input type='date' id='cp_enddate' name="cp_enddate"
						min="<%=java.time.LocalDate.now()%>" /></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="생성"> <input type="reset"
					value="초기화"> <input type="button" value="목록"
					onclick="location='coupon_list?page=${page}';">
			</div>
		</form>
	</div>
</div>
<%-- js사용 --%>
<script src="../js/admin/time.js"></script>
<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />