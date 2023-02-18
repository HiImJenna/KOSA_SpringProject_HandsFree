<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

 <link rel="icon" type="image/x-icon" href="${path}/resources/user/assets/favicon.ico" />
 <!-- Bootstrap icons-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
 <!-- Google fonts-->
 <link rel="preconnect" href="https://fonts.gstatic.com" />
 <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
 <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
 <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="${path}/resources/user/css/header.css" rel="stylesheet" />
 <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
            <div class="container px-5">
                <a class="navbar-brand fw-bold" href="/">Hands Free</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="bi-list"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#about us">About us</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#price">가격</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#guide">FAQ</a></li>
                    </ul>
                    
                    
                   <se:authorize access="!hasRole('ROLE_USER')"> 
                   <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/login'">
						<span class="d-flex align-items-center"> 
							<span class="small">로그인</span>
						</span>
					</button>
					</se:authorize>
					
						
					<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')" ><!-- if문 -->
					<div class="dropdown" >
					  <button class="btn btn-secondary dropdown-toggle" style="background-color: #0003ff" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
					    <se:authentication property="name"/>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
					    <li><button class="dropdown-item" type="button" onclick="location.href='/users/userDetail'" >내 정보</button></li>
					    <li><button class="dropdown-item" type="button" onclick="location.href='/users/myreserve'">예약 내역</button></li>
					    <li><button class="dropdown-item" type="button" onclick="location.href='/storekeepers'">점주 등록</button></li>
					    <li><button class="dropdown-item" type="button" onclick="location.href='/logout'">로그아웃</button></li>
					  </ul>
					</div>
					</se:authorize>
					
					<se:authorize access="!hasRole('ROLE_USER')">		
					<button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/register'">
						<span class="d-flex align-items-center"> 
							<span class="small">회원가입</span>
						</span>
					</button>
					</se:authorize>
					
                </div>
            </div>
        </nav>
        </body>

