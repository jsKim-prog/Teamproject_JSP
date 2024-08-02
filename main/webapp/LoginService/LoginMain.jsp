<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% //쿠키값 불러와 save_check 여부 확인
	String loginID = CookieManager.readCookie(request, "loginID");
	String cookieCheck ="";
	if(!loginID.equals("")){ //아이디에 무언가 저장한 상태라면
		cookieCheck="checked";
	}
%>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<jsp:include page="../Common/TopMenu.jsp" />
	<h1 align="center">로그인</h1>
	<hr>
	<!--되돌아 왔을 때 로그인 실패하면 메시지 출력  -->
	<span class="span_wrapper" style="color: red; font-size: 20px; "> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	//로그인 상태를 파악하여 안되어 있으면 아래 form 출력

	if (session.getAttribute("UserId") == null) {//세션 정보 비어있으면
	%>
	<script>
	function valForm(form) {
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(form.user_pw.value==""){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
<div id=loginwin" align="center">
		<form action="LoginProcess.jsp" method="post" name="loginFm" onsubmit="return valForm(this);">
		<table>
		<tr><td width ="30%">아이디 :</td>	 
		<td width ="70%"><input type="text" name="user_id" value="<%=loginID%>"/></td> </tr>
		<tr><td colspan="2" align="right"><input type="checkbox" name="save_check" value="Y"<%=cookieCheck %>/>아이디 저장</td></tr>
			<tr><td width ="30%">패스워드 :</td><td width ="70%"> <input type="text" name="user_pw" /></td> </tr>
			<tr><td colspan="2" align="right"><input type="submit" value="로그인" /></td> </tr></table>
					</form>
</div>
	<div id=findwin align="center">
			<table>
			<tr><td width ="50%"> <button type="button" onclick="location.href='FindID.jsp'">아이디 찾기</button></td>
			<td width ="50%"><button type="button" onclick="location.href='FindPW.jsp'">비밀번호 찾기</button></td>
			</tr>
			</table>
		
</div>	
	<%
	} else {
	%>
	<div class="container" name="welcomewin" align="center">
		<form action="Logout.jsp" method="post" name="logoutFm">
			<%=session.getAttribute("UserName")%>회원님, 환영합니다.
			<input type="submit" value="로그아웃">
		</form>
	</div>
	<%
	}
	%>

</body>
</html>