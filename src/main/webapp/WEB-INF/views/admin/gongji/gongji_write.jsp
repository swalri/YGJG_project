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
<div class="main-tablepage gongji-writepage">
	<div class="aaa">
		<form action="gongji_write_ok" method="post" id="dateForm"
			style="border-radius: 15px; border: 1px solid black; text-align: left; margin: 10px; padding: 20px;">
			<h2>공지 작성</h2>
			<table id="">
				<tr>
					<th>작성자 :</th>
					<td><input name="gongji_name" id="gongji_name" size="14" /></td>
				</tr>
				<tr>
					<th>제목 :</th>
					<td><input name="gongji_title" id="gongji_title" size="14" /></td>
				</tr>
				<tr>
					<th>내용 :</th>
					<td><textarea name="gongji_cont" id="gongji_cont" rows="9"
							cols="36"></textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="작성"> <input type="reset"
					value="초기화"> <input type="button" value="목록"
					onclick="location='gongji_list?page=${page}';">
			</div>
		</form>
	</div>
</div>
<%-- footer페이지 --%>
<jsp:include page="../footer/footer.jsp" />