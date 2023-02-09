<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--Main Navigation-->
<header>
	<!-- 좌측 사이드바 -->
	<!-- Sidebar -->
	<nav id="sidebarMenu"
		class="collapse d-lg-block sidebar collapse bg-white">
		<div class="position-sticky">

			<!-- data-toggle="pill"  -->

			<div class="list-group list-group-flush mx-2 mt-4">
				<a href="javascript:;" id=admin
					class="list-group-item list-group-item-action py-2 ripple active"
					data-toggle="pill" aria-current="true"> <i
					class="fas fa-home fa-fw me-3"></i> <span>기본정보</span>
				</a> <a href="javascript:;" id=mypage
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"> <i class="fas fa-user-cog fa-fw me-3"></i><span>마이페이지</span>
				</a> <a href="javascript:;" id=reserve
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-tasks fa-fw me-3"></i><span>예약현황</span></a>
				<a href="javascript:;" id=chatting
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-comments fa-fw me-3"></i><span>채팅관리</span></a>
				<a href="javascript:;" id=review
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"> <i class="fas fa-edit fa-fw me-3"></i><span>리뷰관리</span>
				</a>
				<div class="list-group-item list-group-item-action py-2 ripple">
					<i class="me-3"></i><span style="color: white">Hands Free</span>
				</div>
				<a href="#"
					class="list-group-item list-group-item-action py-2 ripple"
					style="color: #ff9100"><i class="fa-fw me-3"></i><span><프리미엄></span></a>
				<a href="javascript:;" id=preMain
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-user-circle fa-fw me-3"></i><span>프리미엄관리</span></a>
				<a href="javascript:;" id=preMarketing
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-store fa-fw me-3"></i><span>가게홍보</span></a>
				<a href="javascript:;" id=preMail
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-envelope-square fa-fw me-3"></i><span>메일서비스</span></a>
				<a href="javascript:;" id=preSchedule
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-calendar-alt fa-fw me-3"></i><span>일정관리</span></a>
				<a href="javascript:;" id=preStastics
					class="list-group-item list-group-item-action py-2 ripple"
					data-toggle="pill"><i class="fas fa-chart-bar fa-fw me-3"></i><span>통계</span></a>
			</div>
		</div>
	</nav>
	<!-- Sidebar -->