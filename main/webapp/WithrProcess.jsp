<%@page import="util.JSFunction"%>
<%@page import="member.MemberKDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    
    MemberDTO delMem = new MemberDTO();
    delMem.setId(user_id);
    delMem.setPw(user_pw);
    
    //회원확인
    MemberKDAO dao = new MemberKDAO();
    int result = dao.loginVal(delMem);
    
    if(result==1){//성공시 회원탈퇴 진행
    	dao.delete(delMem);
    	dao.close();
    	session.removeAttribute("UserId");
    	session.removeAttribute("UserName");
    	session.removeAttribute("UserNick");
    	session.removeAttribute("AccTime");
    	JSFunction.alertLocation("회원탈퇴 완료. 안녕히 가세요.", "index.jsp", out);
    	
     }else{
    	dao.close();
    	request.setAttribute("errorMSG", "id, pw를 확인해 주세요.");
		request.getRequestDispatcher("Withrawal.jsp").forward(request, response);
    }
%>    
