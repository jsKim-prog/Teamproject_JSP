<%@page import="member.MemberKDAO"%>
<%@page import="util.JSFunction"%>
<%@page import="util.CookieManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	//1. id/pw값 받기(post방식)
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String saveId = request.getParameter("save_check"); //id저장 값 가져오기
	//System.out.println("test:request Pw : " + pw);
	MemberDTO loginMem = new MemberDTO(user_id, user_pw);
	//2. dao로 회원여부 확인
	
	MemberKDAO dao = new MemberKDAO();
	
	int userVal = dao.loginVal(loginMem);
	if(userVal==1){//회원확인 성공
		loginMem = dao.login(loginMem);
		
	}else{//로그인 실패
		request.setAttribute("LoginErrMsg", "id, pw를 확인해 주세요.");
		request.getRequestDispatcher("LoginMain.jsp").forward(request, response);
	}
	
	dao.close();//5단계 닫기!
	
	if(loginMem.isLoginStatus()){//로그인 성공시에만 작동
		if(saveId != null && saveId.equals("Y")){//아이디 저장 했다면
			CookieManager.makeCookie(response, "loginID", user_id, 86400);	
		}
		session.setAttribute("UserId", loginMem.getId());
		session.setAttribute("UserName", loginMem.getName());
		session.setAttribute("UserNick", loginMem.getNickName());
		session.setAttribute("AccTime", session.getLastAccessedTime());
		JSFunction.alertLocation(loginMem.getNickName()+"님 환영합니다.", "index.jsp", out);
		
	}
	
	
	%>

