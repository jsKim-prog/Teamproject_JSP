<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
         
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               
               <li class="nav-item"><a class="nav-link active"
               
                  aria-current="page" href="#!">종합영상게시판</a></li>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                  <li class="nav-item dropdown">
                            <button class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리별 영상게시판</button>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!"> 로맨스</a></li>
                                <li><a class="dropdown-item" href="#!"> 코미디 </a></li>
                                <li><a class="dropdown-item" href="#!"> 액션</a></li>
                                <li><a class="dropdown-item" href="#!"> 미스터리</a></li>
                                <li><a class="dropdown-item" href="#!"> SF</a></li>
                                <li><a class="dropdown-item" href="#!"> 판타지</a></li>
                                <li><a class="dropdown-item" href="#!"> 예능</a></li>
                            </ul>
                            
                            </li>
                            <li class="nav-item dropdown">
                            <button class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">플랫폼별 영상게시판</button>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!"> 넷플릭스 </a></li>
                                <li><a class="dropdown-item" href="#!"> 티빙 </a></li>
                                <li><a class="dropdown-item" href="#!"> 디즈니+ </a></li>
                            </ul>
                        </li>
               
               <%if(session.getAttribute("UserId")!=null){%>
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="#!">내가 쓴 리뷰 조회하기</a></li>
               <%} %>               
            </ul>
         
         </div>
   </nav>

                  

