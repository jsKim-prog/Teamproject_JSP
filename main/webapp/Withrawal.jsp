<%@page import="common.CalenderDTO"%>
<%@page import="common.Automatic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./Common/IsLoginCheck.jsp" %> 
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<%@include file="./Common/Font.jsp"%>
<script src="./resources/js/color-modes.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<script src="./resources/js/checkout.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>Withrawal</title>

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/checkout.css" rel="stylesheet">
<link href="./resources/css/font.css" rel="stylesheet">
</head>
<body>
	<%@ include file="./Common/ColorMode.jsp"%>
	<script type="text/javascript">
	function valUser(form) {
		var inid = form.user_id.value;
		var userid = '<%=(String)session.getAttribute("UserId")%>';
		if(inid==userid){
			return true;
		}else{
			alert("id, pw를 확인해 주세요.");
			return false;
		}
	}
	</script>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="./resources/icons/logo.svg"
					width="72" height="57">
				<h2>회원탈퇴</h2>
				<p class="lead">회원정보 확인을 위한 아이디와 패스워드를 입력해 주세요.</p>
			</div>
			<c:if test='<%=request.getAttribute("errorMSG") != null%>'
				var="error">
				<div class="alert alert-warning" role="alert">${errorMSG}</div>
			</c:if>

			<div class="row ">
			<form class="needs-validation" action="WithrProcess.jsp" method="post"  onsubmit="return valUser(this);">			
					<div class="row gy-3 mb-2">
						<div class="col-2">
							<label for="id" class="form-label">아이디</label>
						</div>
						<div class="col-10">
							<input type="text" class="form-control" name="user_id" id="user_id"  required>
							<div class="invalid-feedback"></div>
						</div>
					</div>
					
					<div class="row gy-3 mb-2">
						<div class="col-2">
							<label for="password" class="form-label">패스워드</label>
						</div>
						<div class="col-10">
							<input type="password" class="form-control" name="user_pw" id="user_pw"  required>
							<div class="invalid-feedback"></div>
						</div>
					</div>

					
			<hr class="my-4">

			<button class="w-100 btn btn-primary btn-lg" type="submit">회원탈퇴</button>
			</form>
	</div>
	</main>

	<%@include file="./Common/Footer.jsp"%>
	</div>

</body>
</html>
