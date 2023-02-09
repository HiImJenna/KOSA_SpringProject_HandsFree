<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 풀캘린더 -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js"></script>
	<script>
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: "dayGridMonth",
        });
        calendar.render();
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
					<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 일정관리를
						볼 수 있는 페이지 입니다.</div>
				</div>
				<div class="card-body">
					<div id="calendar"></div>
					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->