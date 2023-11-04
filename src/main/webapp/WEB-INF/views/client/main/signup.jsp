<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/client/signupForm.css">
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../header/header2.jsp" />

	<div class="element">
		<form action="/signup" method="post"
			onsubmit="return validateForm();" novalidate>

			<h1>회원가입</h1>
			<hr>
			<div class="element2">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<div class="form-group">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" class="form-control" placeholder="한글 또는 영문으로 입력해주세요."
						required autofocus onblur="validateName(this.value)"> <span
						id="name-error" class="error-message"
						style="color: red; display: none;">이름은 2자 이상 10자 이하로
						입력해주세요.</span> <label for="username">아이디</label> <input type="text"
						id="username" name="username" class="form-control"
						placeholder="아이디를 입력해주세요." autocomplete="username" required
						onblur="validateUsername(this.value)"> <span
						id="username-error" class="error-message"
						style="color: red; display: none;">아이디를 입력하세요.</span> <label
						for="password">비밀번호</label> <input type="password" id="password"
						name="password" class="form-control" placeholder="비밀번호를 입력해주세요."
						autocomplete="off" required onblur="validatePassword(this.value)">
					<span id="password-error" class="error-message"
						style="color: red; display: none;"></span> <label
						for="confirmPassword">비밀번호 확인</label> <input type="password"
						id="confirmPassword" name="confirmPassword"
						placeholder="비밀번호를 다시 입력해주세요." autocomplete="off" required
						onblur="validateConfirmPassword(this.value)"> <span
						id="confirmPassword-error" class="error-message"
						style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span> <label
						for="email">이메일</label> <input type="text" id="email" name="email"
						class="form-control" placeholder="이메일주소를 입력해주세요."
						autocomplete="email" required onblur="validateEmail(this.value)">
					<span id="email-error" class="error-message"
						style="color: red; display: none;">올바른 이메일 형식이 아닙니다.</span> <label
						for="phone">전화번호</label> <input type="text" id="phone"
						name="phone" class="form-control"
						placeholder="휴대폰 번호를 입력해주세요.(숫자만 입력가능합니다.)" autocomplete="off"
						required onblur="validatePhone(this.value)"> <span
						id="phone-error" class="error-message"
						style="color: red; display: none;">휴대폰 번호를 입력하세요.</span> <label
						for="rdate">생년월일</label> <input type="text" id="rdate"
						name="rdate" class="form-control" placeholder="년-월-일(8자리)"
						autocomplete="off" required onblur="validateRDate(this.value)">
					<span id="rdate-error" class="error-message"
						style="color: red; display: none;">올바른 생년월일 형식이 아닙니다.</span>
				</div>
				 <button type="submit" id="submit-button">회원가입</button>
			</div>
		</form>
	</div>

	<jsp:include page="../footer/footer2.jsp" />

	<script type="text/javascript">
		function validateName(name) {
			var nameInput = document.getElementById("name");
			var nameError = document.getElementById("name-error");

			if (name.length < 2 || name.length > 10) {
				nameError.innerHTML = "이름은 2자 이상 10자 이하로 입력해주세요.";
				nameError.style.color = "red";
				nameInput.classList.add("error-field");
				// 오류 메시지를 표시
				nameError.style.display = "block";
			} else {
				nameError.innerHTML = "";
				nameInput.classList.remove("error-field");
				// 오류 메시지를 숨김
				nameError.style.display = "none";
			}
		}
		
			function validateUsername(username) {
				var usernameInput = document.getElementById("username");
				var usernameError = document.getElementById("username-error");

				if (username.trim() === "") {
					usernameError.innerHTML = "아이디를 입력하세요.";
					usernameError.style.color = "red";
					usernameInput.classList.add("error-field");
					usernameError.style.display = "block";
				} else {
					usernameError.innerHTML = "";
					usernameInput.classList.remove("error-field");
					usernameError.style.display = "none";
				}
			}

		function validatePassword(password) {
			var passwordInput = document.getElementById("password");
			var passwordError = document.getElementById("password-error");

			var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			if (!passwordPattern.test(password)) {
				passwordError.innerHTML = "비밀번호는 8자리 이상이어야 하며, 영문자와 숫자를 섞어서 입력해야 합니다.";
				passwordError.style.color = "red";
				passwordInput.classList.add("error-field");
				passwordError.style.display = "block";
			} else {
				passwordError.innerHTML = "";
				passwordInput.classList.remove("error-field");
				passwordError.style.display = "none";
			}
		}

		function validateConfirmPassword(confirmPassword) {
			var confirmPasswordInput = document.getElementById("confirmPassword");
			var passwordInput = document.getElementById("password");
			var confirmPasswordError = document.getElementById("confirmPassword-error");

			var password = passwordInput.value;
			if (password !== confirmPassword) {
				confirmPasswordError.innerHTML = "비밀번호가 일치하지 않습니다.";
				confirmPasswordError.style.color = "red";
				confirmPasswordInput.classList.add("error-field");
				confirmPasswordError.style.display = "block";
			} else {
				confirmPasswordError.innerHTML = "";
				confirmPasswordInput.classList.remove("error-field");
				confirmPasswordError.style.display = "none";
			}
		}


		function validateEmail(email) {
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
			var emailInput = document.getElementById("email");
			var emailError = document.getElementById("email-error");

			if (!emailPattern.test(email)) {
				emailError.innerHTML = "올바른 이메일 형식이 아닙니다.";
				emailError.style.color = "red";
				emailInput.classList.add("error-field");
				emailError.style.display = "block";
			} else {
				emailError.innerHTML = "";
				emailInput.classList.remove("error-field");
				emailError.style.display = "none";
			}
		}
		
			function validatePhone(phone) {
				var phoneInput = document.getElementById("phone");
				var phoneError = document.getElementById("phone-error");

				if (phone.trim() === "") {
					phoneError.innerHTML = "휴대폰 번호를 입력하세요.";
					phoneError.style.color = "red";
					phoneInput.classList.add("error-field");
					phoneError.style.display = "block";
					return false; // 폼 제출 중단
				} else {
					phoneError.innerHTML = "";
					phoneInput.classList.remove("error-field");
					phoneError.style.display = "none";
					return true; // 유효한 전화번호 입력
				}
			}

			function validateRDate(rdate) {
				var rdateInput = document.getElementById("rdate");
				var rdateError = document.getElementById("rdate-error");

				// 생년월일 형식 검사
				var rdatePattern = /^\d{4}\d{2}\d{2}$/;
				if (!rdatePattern.test(rdate)) {
					rdateError.innerHTML = "올바른 생년월일 형식이 아닙니다.";
					rdateError.style.color = "red";
					rdateInput.classList.add("error-field");
					rdateError.style.display = "block";
				} else {
					rdateError.innerHTML = "";
					rdateInput.classList.remove("error-field");
					rdateError.style.display = "none";
				}
			}

		function validateForm() {
			var name = document.getElementById("name").value;
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;
			var rdate = document.getElementById("rdate").value;

			if (name === "" || username === "" || password === "" || email === "" || phone === "" || rdate === "") {
				alert("모든 입력란을 입력하세요.");
				return false; // 폼 제출 중단
			}
			


			var isValid = true;

			// 이름 검증
			if (name === "") {
				alert("이름을 입력하세요.");
				isValid = false;
			} else {
				var namePattern = /^[a-zA-Z가-힣]{2,10}$/;
				if (!namePattern.test(name)) {
					alert("이름은 2자 이상 10자 이하의 한글 또는 영문자로 입력하세요.");
					isValid = false;
				}
			}

			// 이메일 형식 검증
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
			if (!emailPattern.test(email)) {
				alert("올바른 이메일 형식이 아닙니다.");
				return false; // 폼 제출 중단
			}

			// 비밀번호 형식 검증
			var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			if (!passwordPattern.test(password)) {
				alert("비밀번호는 8자리 이상이어야 하며, 영문자와 숫자를 섞어서 입력해야 합니다.");
				return false; // 폼 제출 중단
			}
			// 비밀번호 확인
			if (password !== confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false; // 폼 제출 중단
			}
			
			// 생년월일 형식 검증
			var rdateInput = document.getElementById("rdate");
			var rdate = rdateInput.value;
			var rdatePattern = /^\d{8}$/;
			if (!rdatePattern.test(rdate)) {
				alert("올바른 생년월일 형식이 아닙니다.");
				return false; // 폼 제출 중단
			}

			document.getElementById("submit-button").disabled = hasErrors;

	        // 오류가 있으면 폼 제출을 중단
	        if (hasErrors) {
	            alert("모든 입력란을 입력하세요.");
	            return false;
	        }
	        
			return true; // 모든 유효성 검사가 통과되면 폼 제출을 허용합니다.
		}
	</script>

</body>

</html>