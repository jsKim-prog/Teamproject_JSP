<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//String findID = CookieManager.readCookie(request, "FindID");
	String findID = request.getAttribute("FindID").toString();
	
	System.out.println("넘어온 ID:"+findID);
%>	
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

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/sign-in.css" rel="stylesheet">
<title>FindID</title>
</head>
<%-- <%@include file="./Common/TopMenu.jsp" %> --%>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<%@ include file="./Common/ColorMode.jsp"%>
	<main class="form-signin  m-auto">
		<form>
			<img class="mb-4" src="./resources/icons/logo.svg" alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">아이디 찾기 결과</h1>

			<div class="alert alert-info" role="alert">회원님의 아이디 : <%=findID %></div>
			
			<hr class="my-4">
			<div class="btn-group" role="group" aria-label="Default button group">
				<button type="button" class="btn btn-outline-primary" type="button"
					onclick="location.href='FindPW.jsp'">비밀번호 찾기</button>
				<button type="button" class="btn btn-outline-primary" type="button"
					onclick="location.href='LoginMain.jsp'">로그인</button>
			</div>

			<p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2024</p>
		</form>
	</main>
	<script src="./resources/js/bootstrap.bundle.min.js"></script>
	<%-- <%@include file="./Common/Footer.jsp" %> --%>
</body>
</html>