<%@page import="common.CalenderDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="common.Automatic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<%@include file="./Common/Font.jsp"%>
<script src="./resources/js/color-modes.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<script src="./resources/js/checkout.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>아이디 찾기</title>

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/checkout.css" rel="stylesheet">
<link href="./resources/css/font.css" rel="stylesheet">
</head>
<body>
	<%@ include file="./Common/ColorMode.jsp"%>

<%
//option으로 보여줄 리스트 생성(년, 월, 일)
Automatic auto = new Automatic();
List<String> years = auto.makeListDESC(1900, 2024);
List<String> months = auto.makeListASC(1, 12);

List<String> month31 = Arrays.asList("01", "03", "05", "07", "08", "10", "12");
List<String> month30 = Arrays.asList("04", "06", "09", "11");

CalenderDTO userCal = new CalenderDTO();
%>
<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="./resources/icons/logo.svg"
					width="72" height="57">
				<h2>회원가입</h2>
				<p class="lead">회원가입을 환영합니다.</p>
			</div>

			<div class="row">

				<div class="col-12">
					<h4 class="mb-3">회원정보 입력</h4>
					<form class="needs-validation" action="RegisteProcess.jsp"
						method="post" onsubmit="return valform(this);">
						<div class="row g-3">
							<div class="col-2">
								<label for="id" class="form-label">아이디</label>
							</div>
							<div class="col-10">
								<input type="text" class="form-control" name="user_id"
									id="user_id" placeholder="" value="" required>
								<div class="invalid-feedback">중복검사 필요</div>
							</div>

							<div class="col-2">
								<label for="password" class="form-label">패스워드</label>
							</div>
							<div class="col-10">
								<input type="password" class="form-control" name="user_pw"
									id="user_pw" placeholder="" value="" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="col-2">
								<label for="name" class="form-label">이름</label>
							</div>
							<div class="col-10">
								<input type="text" class="form-control" name="user_name"
									id="user_name" placeholder="" value="" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="col-2">
								<label for="nickName" class="form-label">닉네임</label>
							</div>
							<div class="col-10">
								<input type="text" class="form-control" name="user_nick"
									id="user_nick" placeholder="" value="" required>
								<div class="invalid-feedback"></div>
							</div></div>
							<!--생년월일  -->
							<div class="row gy-3">
								<div class="col-4">
									<label for="birth" class="form-label">생년월일</label>
								</div>
								<div class="row gy-3">
									<div class="col-4"> <!--year  -->
										<div class="input-group has-validation">
											<select class="form-select" name="birth_year" id="birth_year"
												required>
												<c:forEach var="in_year" items="<%=years%>">
													<option value="in_year">${in_year}</option>
												</c:forEach>
												</select><span class="input-group-text">년</span>
											<div class="invalid-feedback"></div>											
										</div>
										<c:set target='<%=userCal %>' property="year" value="${user_year}" />
										<%
										if(userCal.getYear()!=null){
											int getyear = Integer.parseInt(userCal.getYear());
											if(getyear%4==0 | getyear%100==0 | getyear%400==0){
												userCal.setLeapYear(true);
											}
										}
										%>								
									</div>
									<div class="col-4">  <!--month  -->
										<div class="input-group has-validation">
											<select class="form-select" name="birth_month" id="birth_month" required>
												<c:forEach var="in_month" items="<%=months%>">
													<option value="in_month">${in_month}</option>
												</c:forEach></select><span class="input-group-text">월</span>
											<div class="invalid-feedback"></div>
										</div>
										<c:set target='<%=userCal %>'  property="month"  value="${user_month}" />
									</div>
									<div class="col-4"> <!--day  -->
										<div class="input-group has-validation">
											<select class="form-select" name="birth_day" id="birth_day" required>
												<%
												int end = 0; 
												String monthInfo = "";
												if(userCal.getMonth()==null){
													end=31;
												}else{
													monthInfo = userCal.getMonth();
												}
												if (monthInfo.equals("02")) {
													if (userCal.isLeapYear()) {//윤년인 경우
														end = 29;
													} else {
														end = 28;
													}
												} else if (month30.contains(monthInfo)) {
													end = 30;
												} else {
													end = 31;
												}
												List<String> days = auto.makeListASC(1, end);
												%>
												<c:forEach var="in_day" items="<%=days%>">
													<option value="in_day">${in_day}</option>
												</c:forEach></select><span class="input-group-text">일</span>
											<div class="invalid-feedback"></div>
										</div>
									</div>
								</div>
							</div>
							<!--성별  -->
							<div class="row gy-3">
							<div class="col-2">
								<label for="sex" class="form-label">성별</label>
							</div>
							<div class="col-10">

								<input id="man" name="man" type="radio" class="form-check-input"
									checked required> <label class="form-check-label"
									for="man">남</label> <input id="woman" name="woman" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="woman">여</label>
							</div></div>

							<!--전화번호  -->
							<div class="row gy-3">
							<div class="col-4">
								<label for="phone" class="form-label">휴대폰번호</label></div>
							</div>
							<div class="row gy-3">
								<div class="col-4 ">
								<div class="input-group has-validation">
									<select class="form-select" name="pno_front" id="pno_front" required>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option> </select>
									<span class="input-group-text">-</span></div>
									<div class="invalid-feedback"></div>
								</div>
								<div class="col-4 ">
								<div class="input-group has-validation">
									<input type="text" class="form-control" name="pno_mid" id="pno_mid" placeholder="" value="" required> <span
										class="input-group-text">-</span></div>
									<div class="invalid-feedback"></div>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" name="pno_end"
										id="pno_end" placeholder="" value="" required>
									<div class="invalid-feedback"></div>
								</div>
							</div>

							<!--이메일 -->
							<div class="row gy-3">
							<div class="col-2">
								<label for="mail" class="form-label">email</label>
							</div>
								<div class="col-5">
									<input type="text" class="form-control" name="mail_front"
										id="mail_front" placeholder="" value="" required>
								</div>
								<div class="col-5">
									<select class="form-select" name="mail_end" id="mail_end"  required>
									<option value="@naver.com">@naver.com</option>
									<option value="@gmail.com">@gmail.com</option>
									<option value="@daum.net">@daum.net</option></select>
								</div>
						</div>


						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
					</form>
				</div>
			</div>
		</main>

		<%@include file="./Common/Footer.jsp"%>
	</div>

</body>
</html>
