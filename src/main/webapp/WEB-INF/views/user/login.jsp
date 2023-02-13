
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>HandsFree main</title>
	<link rel="icon" type="image/x-icon" href="${path}/resources/user/assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Google fonts-->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
	<!-- Font -->
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">	
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function activateTab(active) {
			let left = document.getElementById('leftTab');
			let right = document.getElementById('rightTab');
			
			$('#form-box').empty();
			if (active == 'left') {
				left.classList.add('active');
				right.classList.remove('active');
				const temp = `<form action="/users/login" method="post" data-sb-form-api-token="API_TOKEN">
								<!-- 이메일 -->
								<div class="row" style="height:58px; padding: 0px;">
									<div class="col">
										<input style="height: 51px;" class="form-control" name="username" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
										<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
										<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
									</div>
								</div>
								
								<!-- 비밀번호 -->
								<div class="row" style="height: 58px; padding: 0px;">
									<div class="col">
										<input style="height: 51px;" class="form-control" name="password" id="password" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
										<!-- <label for="password">password</label> -->
										<div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
									</div>
								</div>
								
								<!-- 제출 버튼 -->
								<div class="d-grid" style="margin-top: 30px;">
									<button class="btn btn-primary rounded-pill btn-lg"
										id="submitButton" type="submit">로그인</button>
								</div>
							</form>`;
				$('#form-box').append(temp);
			} else {
				left.classList.remove('active');
				right.classList.add('active');
				const temp = `<form action="/storekeepers/login" method="post" data-sb-form-api-token="API_TOKEN">
				
					<!-- 이메일 -->
					<div class="row" style="height:58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="username" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="password" id="password" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
							<!-- <label for="password">password</label> -->
							<div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 제출 버튼 -->
					<div class="d-grid" style="margin-top: 30px;">
						<button class="btn btn-primary rounded-pill btn-lg"
							id="submitButton" type="submit">로그인</button>
					</div>
					
				</form>`;
				$('#form-box').append(temp);
			}
		}
	</script>
	
</head>
<body id="page-top" class="masthead">

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm"
		id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand fw-bold" href="/">Hands Free</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="bi-list"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
					<li class="nav-item"><a class="nav-link me-lg-3"
						href="#about us">About us</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3" href="#price">가격</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3" href="#guide">FAQ</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3" href="#">Korean</a></li>
				</ul>
				<button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/login'">
					<span class="d-flex align-items-center"> 
						<span class="small">로그인</span>
					</span>
				</button>
				<button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/register'">
					<span class="d-flex align-items-center"> 
						<span class="small">회원가입</span>
					</span>
				</button>
			</div>
		</div>
	</nav>

	<!-- 메인 -->
	<header>
		
		<div style="width: 520px; margin: 0 auto">
		
			<nav class="nav nav-pills nav-justified">
			  <a id="leftTab" class="nav-link active" aria-current="page" onclick="activateTab('left')">일반회원</a>
			  <a id="rightTab" class="nav-link" aria-current="page" onclick="activateTab('right')">개인사업자</a>
			</nav>
			
			<br>
			
			<div id="form-box" class="container" style="padding: 0px;">
			
				<form action="${pageContext.request.contextPath}/login" method="post" data-sb-form-api-token="API_TOKEN">
				
					<!-- 이메일 -->
					<div class="row" style="height:58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="username" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="password" id="password" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
							<!-- <label for="password">password</label> -->
							<div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 제출 버튼 -->
					<div class="d-grid" style="margin-top: 30px;">
						<button class="btn btn-primary rounded-pill btn-lg"
							id="submitButton" type="submit">로그인</button>
					</div>
					
				</form>
			</div>
		
		</div>
	</header>

	<!-- Footer-->
<!-- 	<footer class="bg-black text-center py-5">
		<div class="container px-5">
			<div class="text-white-50 small">
				<div class="mb-2">&copy; Enjo2 2023. All Rights Reserved.</div>
				<span class="mx-1">&middot;</span> <a href="#!">Git</a> <span
					class="mx-1">&middot;</span>
			</div>
		</div>
	</footer> -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${path}/resources/user/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>