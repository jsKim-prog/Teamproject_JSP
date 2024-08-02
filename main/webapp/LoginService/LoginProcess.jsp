<%@page import="util.JSFunction"%>
<%@page import="util.CookieManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess.jsp:dto와 dao로 로그인 처리</title>
</head>
<body>
	<%
	//1. id/pw값 받기(post방식)
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String saveId = request.getParameter("save_check"); //id저장 값 가져오기
	//System.out.println("test:request Pw : " + pw);
	MemberDTO loginMem = new MemberDTO(user_id, user_pw);
	//2. dao로 회원여부 확인
	
	MemberDAO loginCheck = new MemberDAO();

	loginMem = loginCheck.loginUser(loginMem);
	loginCheck.close();//5단계 닫기!
	//3. 확인성공->로그인 성공(세션생성 UserId, UserName) / 실패->LoginErrMsg 리턴 + 쿠키생성 여부 추가
	int loginSts = (loginMem.isLoginStatus()) ? 10 : 20; //로그인 성공 시 10, 실패시 20
	int idSave = (saveId != null && saveId.equals("Y")) ? 1 : 0; //아이디 저장이 비어있지 않거나 값이 Y라면 1, 비어있다면 0
	switch (loginSts + idSave) {
	case 10: //로그인 성공, 아이디 저장 미체크 -> 세션만 생성
		session.setAttribute("UserId", loginMem.getId());
		session.setAttribute("UserName", loginMem.getName());
		session.setAttribute("AccTime", session.getLastAccessedTime());
		response.sendRedirect("LoginMain.jsp");
		break;
	case 11: //로그인 성공, 아이디저장 체크->세션+쿠키 생성
		session.setAttribute("UserId", loginMem.getId());
		session.setAttribute("UserName", loginMem.getName());
		session.setAttribute("AccTime", session.getLastAccessedTime());
		CookieManager.makeCookie(response, "loginID", user_id, 86400); //사용자 id로 1일 동안 유지되는 쿠키 생성 

		response.sendRedirect("LoginMain.jsp");

		break;
	case 20: //로그인 실패(미체크) -> LoginErrMsg
		request.setAttribute("LoginErrMsg", "id, pw를 확인해 주세요.");
		request.getRequestDispatcher("LoginMain.jsp").forward(request, response);
		break;
	case 21: //로그인 실패, 아이디저장 체크->쿠키삭제+LoginErrMsg
		CookieManager.deleteCookie(response, "loginID");
		request.setAttribute("LoginErrMsg", "id, pw를 확인해 주세요.");
		request.getRequestDispatcher("LoginMain.jsp").forward(request, response);
		break;
	default: //프로그램 오류(알럿창->홈)
		JSFunction.alertLocation("프로그램 오류.관리자에게 문의하세요.", "LoginMain.jsp", out);

	}//--switch()
	%>

</body>
</html>