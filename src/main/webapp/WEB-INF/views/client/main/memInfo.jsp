<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memInfo</title>
<link rel="stylesheet" type="text/css" href="../css/client/info.css">
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

<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>

   <jsp:include page="../header/header2.jsp" />

    <div class="element">
      <div class="form-group">
         <h3 style="text-align: center">마이 페이지</h3>
         <hr><br>
            <label for="name">이름</label> 
            <input type="text" id="name" name="name" class="form-control"value="${user.name}" disabled="disabled"><br> 
            <label for="username">아이디</label> 
            <input type="text" id="username" name="username" class="form-control"value="${user.username}" disabled="disabled"><br>
            <label for="rdate">생년월일</label> 
            <input type="text" id="rdate" name="rdate" class="form-control"value="${user.rdate}"disabled="disabled" ><br>
            <label for="email">이메일</label> 
            <input type="text" id="email" name="email" class="form-control"value="${user.email}"disabled="disabled"><br> 
            <label for="phone">전화번호</label> 
            <input type="text" id="phone" name="phone" class="form-control" value="${user.phone}"disabled="disabled"><br> 
      </div>
   </div>
</body>
</html>
<jsp:include page="../footer/footer2.jsp" />
















