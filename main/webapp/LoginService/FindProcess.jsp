<%@page import="util.CookieManager"%>
<%@page import="member.MemberKDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="common.Automatic"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. findID에서 넘어온 정보 받기 & 변환
String user_name = request.getParameter("user_name");
String pno_frn = request.getParameter("pno_frn");
String pno_mid = request.getParameter("pno_mid");
String pno_last = request.getParameter("pno_last");
String pnoAll = pno_frn + "-" + pno_mid + "-" + pno_last; //폰넘버 문자열 조합
String ssn_frn = request.getParameter("ssn_frn");
String ssn_last = request.getParameter("ssn_last");
//2. dao넘기기 위한 dto세팅
MemberDTO findMember = new MemberDTO();
findMember = Automatic.ssnChager(ssn_frn, ssn_last, findMember); //주민번호 보내서 birth와 sex로 입력된 객체로 되돌려 받는다.
findMember.setName(user_name);
findMember.setpNo(pnoAll);
//3. db연결-dbpool사용
MemberKDAO memberKDAO = new MemberKDAO();
findMember = memberKDAO.searchID(findMember);
memberKDAO.close();
//4. 받은 결과로 응답
if(findMember.isUsability()){ //id검색 성공
	response.sendRedirect("FindID.jsp");
	CookieManager.makeCookie(response, "FindID", findMember.getId(), 60*60); //1시간짜리 쿠키 만들어서 저장해줌
}else{//검색 실패
	request.setAttribute("errorMSG", "회원정보를 찾을 수 없습니다.");
	request.getRequestDispatcher("FindID.jsp").forward(request, response); //에러메시지를 가지고 돌아간다.
}
%>