<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
         <div
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="./Index.jsp"
               class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
               <svg width="22" height="22" fill="currentColor"
                  class="bi bi-house-fill" viewBox="0 0 16 16">
           <path
                     d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
           <path
                     d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
      </svg> <span class="fs-4">Home</span>
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               <%if(session.getAttribute("UserId")==null){ %>
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="#!">로그인</a></li>
               <li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
               <li class="nav-item"><a class="nav-link" href="#!">회원정보찾기</a></li>
               
               <% } else { %>
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="#!">로그아웃</a></li>
               <li class="nav-item"><a class="nav-link" href="MyPage.jsp">회원정보수정</a></li>
               <li class="nav-item"><a class="nav-link" href="#!">회원탈퇴</a></li>
               
               <%} %>               
            </ul>
         
         </div>
      </div>
   </nav>