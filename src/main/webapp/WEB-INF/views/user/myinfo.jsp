<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
 <link rel="icon" type="image/x-icon" href="${path}/resources/user/assets/favicon.ico" />
 <!-- Bootstrap icons-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
 <!-- Core theme CSS (includes Bootstrap)-->
 <link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
</head>
<body>


	<%
	pageContext.include("/WEB-INF/views/include/header.jsp");
	%>

<!--Main layout-->
<main style="margin-top: 58px">
	<div class="container pt-4">
		<section class="mb-4">
			<div class="card">
				<div class="card-header py-3">
					<h2>내 정보</h2>			
					<br />
					
				</div>
				<div class="card-body">
					<strong><se:authentication property="name"/></strong>
					<br /> <b>대표 이미지</b> <br /> 
					<b>가게이름</b> <br /> 교촌치킨 서울역점 <br />
					<br /> 주소 <br /> 서울시 중구 가나다로 123-45 <br /> <br /> 대표번호 <br />
					02-1234-5678 <br /> <br />
					<hr />
				</div>
			</div>
		</section>
	</div>
</main>

</body>
</html>