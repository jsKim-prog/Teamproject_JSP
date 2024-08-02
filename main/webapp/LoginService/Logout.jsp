<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout.jsp</title>
</head>
<body>
<!-- loginmain에서 넘어와 세션삭제->돌아가기 -->
<%
session.invalidate(); //세션자체 무효화
response.sendRedirect("LoginMain.jsp"); //돌아가기

%>

</body>
</html>