<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
$(document).ready(()=> {
	
	/* 기본정보 수정*/
	$('#manage').click(function(){
		$.ajax({
			type : "GET",
			url : "/adminManage",
			dataType : "html",
			error : function(){
				alert("새로고침 해주세요11");
			},
			success : function(data){
				$("#main").empty();
				$("#main").append(data);
			}
			
		});
	});

});

</script>




<!--Main layout-->
<main style="margin-top: 58px">
	<div class="container pt-4">
		<section class="mb-4">
			<div class="card">
				<div class="card-header py-3">
					<h5 class="mb-0 text-left">
						<strong>[Hands Free] 교촌치킨 서울역점</strong>
					</h5>
					<br />
					<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 기본정보를
						볼 수 있는 페이지 입니다.</div>
				</div>
				<div class="card-body">
					<div style="text-align: right">
						<a href="javascript:;" id=manage>변경하기</a>
					</div>
					<h5>가게정보</h5>
					<br /> <b>대표 이미지</b> <br /> <img
						src="${path}/resources/admin/img/kyochon.jpg" height="70px"
						width="70px" /> <br /> <br /> <b>가게이름</b> <br /> 교촌치킨 서울역점 <br />
					<br /> 주소 <br /> 서울시 중구 가나다로 123-45 <br /> <br /> 대표번호 <br />
					02-1234-5678 <br /> <br />
					<hr />
					<div style="text-align: right">
						<br>
					</div>
					<h5>영업시간</h5>
					<br /> <b>월~금</b> : 오전 11:00 ~ 오후 09:00 <br /> <br /> <b>토요일</b>
					: 오전 11:00 ~ 오후 09:00 <br /> <br /> <b>일요일</b> : 오전 11:00 ~ 오후
					09:00 <br /> <br />
					<hr />
					<div style="text-align: right">
						<br>
					</div>
					<h5>공지사항 안내</h5>
					<br /> 여기 맛있어요 <br /> <br />
					<hr />
					<br />
					<h5>사업자등록증</h5>
					<br /> <a href="">사업자등록증 다운로드</a><br /> <br /> <a
						data-toggle="collapse" href="#collapseExample" role="button"
						aria-expanded="false" aria-controls="collapseExample">펼쳐보기</a> <br />
					<div class="collapse" id="collapseExample">
						<div class="card card-body">
							<img style="height: 70%; width: 30%"
								src="${path}/resources/admin/img/document.jpg" />
						</div>
					</div>

					<br />
					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->