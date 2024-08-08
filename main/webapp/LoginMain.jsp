<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="./resources/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>LoginMain</title>

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/sign-in.css" rel="stylesheet">
<title>Login</title>
</head>

<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<%@ include file="./Common/ColorMode.jsp"%>

	<main class="form-signin w-300 m-auto">
		<form action="LoginProcess.jsp" method="post">
			<img class="mb-4" src="./resources/icons/logo.svg" alt="" width="72"
				height="57">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<%if(request.getAttribute("LoginErrMsg")!=null){
			String ErrorMsg = request.getAttribute("LoginErrMsg").toString();%>			
				<div class="alert alert-warning" role="alert"><%=ErrorMsg%></div>
<%} %>
			<div class="form-floating">
				<input type="text" class="form-control" id="user_id" name="user_id"
					placeholder="id"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="user_pw" name="user_pw"
					placeholder="Password"> <label for="floatingPassword">패스워드</label>
			</div>

			<div class="form-check text-start my-3">
				<input class="form-check-input" type="checkbox" value="remember-me"
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> 아이디 저장 </label>
			</div>
			<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>

			<hr class="my-4">
			<div class="btn-group" role="group" aria-label="Default button group">
				<button type="button" class="btn btn-outline-primary" type="button"
					onclick="location.href='Register.jsp'">회원가입</button>
				<button type="button" class="btn btn-outline-primary" type="button"
					onclick="location.href='FindID.jsp'">아이디 찾기</button>
				<button type="button" class="btn btn-outline-primary"  type="button"
					onclick="location.href='FindPW.jsp'">비밀번호 찾기</button>
			</div>

			<p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2024</p>
		</form>
	</main>
	<script src="./resources/js/bootstrap.bundle.min.js"></script>
<%-- 	<%@include file="./Common/Footer.jsp" %> --%>
</body>
</html>