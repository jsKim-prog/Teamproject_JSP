<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	width : 60%;
	border: 1px solid;
	border-collapse: collapse;
	table-layout: auto;
	vertical-align: middle;
	background-color: #ffffff;
}

tr{
	height: 50px;
}
td.tbtitle{
 width : 30%;
}
</style>
<script type="text/javascript">
	function valform(form) {
		if(form.user_name.value==""){
			alert("이름을 입력하세요.");
			return false;
		}
		if(form.pno_mid.value=="" || form.pno_last.value==""){
			alert("휴대폰 번호를 입력하세요.");
			return false;
		}
		if(form.ssn_frn.value==""){
			alert("생년월일 6자리를 입력하세요.");
			return false;
		}
		if(form.ssn_last.value==""){
			alert("주민번호 뒷자리 첫 글자를 입력하세요.");
			return false;
		}
		
	}
	</script>
<meta charset="UTF-8">
<title>FindID</title></head>
<body>
	<jsp:include page="../Common/TopMenu.jsp" />
	<h2>아이디 찾기</h2>
	<hr>
	<% 
	String findId = CookieManager.readCookie(request, "FindID");	
	%>	
	<c:if test="${ findID } eq null"></c:if>
	<form action="FindProcess.jsp" method="post" onsubmit="return valform(this);">

		<table>
			<tr>
				<td colspan="2"><h4>아래 회원정보를 입력해 주세요.</h4></td>
			</tr>
			<tr>
				<td class="tbtitle">이름</td>
				<td><input type="text" name="user_name" /></td>
			</tr>
			<tr>
				<td class="tbtitle">휴대폰 번호</td>
				<td><select name="pno_frn">
						<!--앞고정번호  -->
						<option value="010">010</option>
						<option value="011">011</option>
				</select>- <input type="text" name="pno_mid" maxlength="4" />- <input
					type="text" name="pno_last" maxlength="4" /></td>
			</tr>
			<tr>
				<td class="tbtitle">주민번호</td>
				<td><input type="text" name="ssn_frn" maxlength="6" />-<input
					type="password" name="ssn_last" maxlength="1" /><input type="text"
					readonly="readonly" value="******" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit"
					value="아이디 찾기" /></td>
			</tr>
			
		</table></form>
		
		
</body>
</html>