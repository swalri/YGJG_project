<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">
   <title>로그인</title>
   <link rel="stylesheet" type="text/css" href="../css/client/loginForm.css">
</head>

<body>
   <!-- 헤더 -->
   <jsp:include page="../header/header2.jsp" />

   <div class="container">
      <form class="form-signin" method="post" action="/login">
         
         <div class="con">
         <h1 class="form-login-heading">로그인</h1>
         <hr>

            <c:if test="${param.error == true}">
               <div class="form-group">
                  <p class="alert alert-danger">Error message: 로그인 정보가 맞지 않습니다.</p>
               </div>
            </c:if>

            <div class="container2">
         <p class="p-style">
            <label for="username" class="sr-only">ID</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="" required
               autofocus>
         </p>
         <p>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder=""
               required>
         </p>
         <input name="_csrf" type="hidden" value="2e711206-8a0f-4ea7-ab6c-821a001c4211" />
         <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
         </div>
         

         </div>
      </form>
   </div>
   
<jsp:include page="../footer/footer2.jsp" />
   
</body>

</html>