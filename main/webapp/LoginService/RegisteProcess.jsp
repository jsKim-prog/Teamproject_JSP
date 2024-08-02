<%@page import="util.JSFunction"%>
<%@page import="util.CookieManager"%>
<%@page import="member.MemberKDAO"%>
<%@page import="common.Automatic"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 넘어온 값 받기
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	String name = request.getParameter("user_name");
	String nickName = request.getParameter("user_nick");
	String pno_frn = request.getParameter("pno_frn");
	String pno_mid = request.getParameter("pno_mid");
	String pno_last = request.getParameter("pno_last");
	String mail_frn = request.getParameter("mail_frn");
	String mail_last = request.getParameter("mail_last");
	String ssn_frn = request.getParameter("ssn_frn");
	String ssn_last = request.getParameter("ssn_last");
	
	String phone = Automatic.phoneJoin(pno_frn, pno_mid, pno_last);
	String mail = Automatic.mailJoin(mail_frn, mail_last);
	MemberDTO regMem = new MemberDTO();
	regMem = Automatic.ssnChager(ssn_frn, ssn_last, regMem); //주민번호로 birth, sex항목 채우기	
	regMem.setId(id);
	regMem.setPw(pw);
	regMem.setName(name);
	regMem.setNickName(nickName);
	regMem.setpNo(phone);
	regMem.setMail(mail);
	regMem.setAuthor(1); //기본User 권한으로 세팅 ->admin이 수정하도록 추후 관리자 페이지 개발
	
	System.out.println(regMem.toString());
	
	//2. dao에서 가입처리
	MemberKDAO memberKDAO = new MemberKDAO(); //1,2단계
	int result = memberKDAO.register(regMem); //3,4단계
	memberKDAO.close(); //5단계
	
	//3. 가입 성공/실패처리
	if(result==1){//성공
		CookieManager.makeCookie(response, "regID", id, 3600); //가입한 id가 뜨도록 쿠키생성		
		JSFunction.alertLocation("회원가입이 완료되었습니다. \n가입하신 계정으로 로그인해주세요.", "LoginMain.jsp", out);//로그인 창으로 돌아간다.
		
	}else{//실패
		JSFunction.alertBack("회원가입이 실패했습니다. 관리자에게 문의하세요.", out);
	}
	








%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>