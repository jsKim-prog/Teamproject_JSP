<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
 Map<String, Object> param = new HashMap<String, Object>(); //검증용 값 보내기 위한 map
 String userId = request.getParameter("user_id");
 String userNick = request.getParameter("user_nick");
 if(userId != null){
	 param.put("user_id", userId);
 }
 if(userNick != null){
	 param.put("user_nick", userNick);
 }


%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register.jsp</title>
</head>
<body>
	<jsp:include page="../Common/TopMenu.jsp" />
	<h2>회원가입</h2>
	<hr>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function valform(form) {
			if (form.user_name.value == "") {
				alert("이름을 입력하세요.");
				return false;
			}
			if (form.user_id.value == "") {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
			if (form.user_nick.value == "") {
				alert("닉네임을 입력하세요.");
				return false;
			}

			if (form.pno_mid.value == "" || form.pno_last.value == "") {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if (form.ssn_frn.value == "") {
				alert("생년월일 6자리를 입력하세요.");
				return false;
			}
			if (form.ssn_last.value == "") {
				alert("주민번호 뒷자리 첫 글자를 입력하세요.");
				return false;
			}
		}
		
		function idajax() {
			var userid = $("input:[name=user_id]").val();
			$.ajax({
				url : './DupleCheck.jsp',
				type :'post',
				data : {userid}
				dataType : "text",
				success : function(result) {
					if(result==0){ //성공
						('#IdCheck').value =1;
					alert("사용가능한 id입니다.");
					}else{
						('#IdCheck').value =0;
						alert("사용중인 id입니다.");
					}
				}		
			});
		}
		
	
	</script>
	<form action="RegisteProcess.jsp" method="post" 
		onsubmit="return valform(this);">

		<table>
			<tr>
				<td>아이디</td>
				<td colspan="3"><input type="text" name="user_id" />
				<button type="button" id="IdCheck" onclick="idajax();" value="0">중복확인</button></td>
			</tr>

			<tr>
				<td>패스워드</td>
				<td colspan="3"><input type="password" name="user_pw" /></td>
			</tr>

			<tr>
				<td>이름</td>
				<td colspan="3"><input type="text" name="user_name" /></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td colspan="3"><input type="text" name="user_nick" />
				<button type="submit" id="NickCheck" onclick="nickajax();" value="0">중복확인</button></td>
			</tr>

			<tr>
				<td>휴대폰 번호</td>
				<td><select name="pno_frn">
						<!--앞고정번호  -->
						<option value="010">010</option>
						<option value="011">011</option>
				</select>- <input type="text" name="pno_mid" maxlength="4" />- <input
					type="text" name="pno_last" maxlength="4" /></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="ssn_frn" maxlength="6" />- <input
					type="password" name="ssn_last" maxlength="1" /><input type="text"
					readonly="readonly" value="******" /></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td colspan="2"><input type="text" name="mail_frn"></td><td><select name="mail_last"><option value="@naver.com">@naver.com</option>
						<option value="@gmail.com">@gmail.com</option>
						<option value="@daum.net">@daum.net</option><!--메일주소고정  -->
				</select></td>
			</tr>


			<tr>
				<td colspan="4" align="right">
					<button type="submit">가입하기</button>
					<button type="button" onclick="location.href='LoginMain.jsp';">취소</button>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>