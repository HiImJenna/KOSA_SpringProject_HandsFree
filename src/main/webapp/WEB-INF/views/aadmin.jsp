<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Hands Free 점주님 페이지</title>
<!-- 파비콘 -->
<link rel="icon" href="${path}/resources/admin/img/crown.png" />
<!-- 4.6 부트스트랩 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
		crossorigin="anonymous" />
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<!-- 구글 폰트 JalpullineunHaru -->
<link
	href="https://webfontworld.github.io/Jalpullineun/JalpullineunHaru.css"
	rel="stylesheet" />
<!-- CSS -->
<link href="${path}/resources/admin/css/mdb.min.css" rel="stylesheet" />
<link href="${path}/resources/admin/css/admin.css" rel="stylesheet" />

<!-- Jquery & Ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	
<!-- 비동기 처리 -->
<script type="text/javascript">
	$(document).ready( ()=> {
		/* 기본정보 */
		$('#admin').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/admin",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 마이페이지 */
		$('#mypage').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/mypage",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 예약현황 */
		$('#reserve').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/reserve",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 채팅관리 */
		$('#chatting').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/chatting",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 리뷰관리 */
		$('#review').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/review",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 프리미엄관리 */
		$('#preMain').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preMain",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 가게홍보 */
		$('#preMarketing').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preMarketing",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 메일서비스 */
		$('#preMail').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preMail",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 메일서비스 폼 */
		$('#preMailForm').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preMailForm",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
			});
		});
		/* 일정관리 */
		$('#preSchedule').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preSchedule",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 통계 */
		$('#preStastics').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preStastics",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		
		
	});
</script>



</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/inc/sidebar.jsp" />
	<jsp:include page="/WEB-INF/views/admin/inc/header.jsp" />

	<div id="main">
		<jsp:include page="/WEB-INF/views/admin/admin.jsp" />



	</div>
	<!--Main layout-->
	

	
	<jsp:include page="/WEB-INF/views/admin/inc/footer.jsp" />

</body>
</html>



