<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 헤더 -->
<header>
        <div class="logo-image" >
            <a href="main"> <img src="../img/client/logo6.png"
                alt="Your Image" class="logo-image" />
            </a>
        </div>
        <div class="menu">
            <a href="intro_list" class="header-menu-box">회사소개</a>
            <a href="leisure_list" class="header-menu-box">레저</a>
            <a href="gongji_list" class="header-menu-box">공지사항</a>
        </div>
   <div class="login" style="float: right; padding: 30px 50px;">


      <sec:authorize access="isAnonymous()">
         <a href="login" class="btn btn-primary btn-lg custom-btn">로그인</a>
                    &nbsp;|&nbsp;
                    <a href="signup"
            class="btn btn-success btn-lg custom-btn">회원가입</a>
      </sec:authorize>

      <sec:authorize access="isAuthenticated()">

      <div class="user-container">
         <a href="#" onclick="toggleMenu()" class="user-link"> <!-- 사용자 아이콘 -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
               fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
               <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
               <path fill-rule="evenodd"
                  d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
           </svg> <!-- 사용자 이름 --> ${name}님 <!-- 아래쪽 화살표 아이콘 --> <span
            style="font-size: 9px; margin-top: 4px; margin-left: 2px;">▼</span>
         
         </a>

            <div id="user-dropdown" class="user-dropdown">
               <!-- 드롭다운 메뉴 내용 -->
               <ul>
                  <li class="my-ygjg">MY YGJG</li>
                  
                  <hr>
               
                  <li>
                  <span class="user-name">${name}님</span>
                  <a href="logout" class="logout-link">로그아웃</a>
                  <span class="nbsp">&nbsp;|&nbsp;</span>
                  <a href="memInfo_list">회원정보</a>
                  </li>
                  
                  <li>
                  <a href="#">Point</a>
                  <span class="pin">0 P</span>
                  </li>
                  
                  <li>
                  <a href="#">쿠폰함</a>
                  <span class="pin2">0 개</span>
                  <a href="#" class=right-align>〉</a>
                  </li>
               </ul>
            </div>

         </div>
   </sec:authorize>

   </div>

</header>


<script>
    function toggleMenu() {
        var dropdown = document.getElementById("user-dropdown");
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        } else {
            dropdown.style.display = "block";
        }
    }
</script>