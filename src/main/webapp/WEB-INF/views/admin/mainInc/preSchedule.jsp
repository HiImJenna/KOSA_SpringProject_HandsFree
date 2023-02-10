<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

	<!-- 풀캘린더 -->
    <link href="${path}/resources/fullCalendar/main.css" rel="stylesheet" />
    <script src="${path}/resources/fullCalendar/main.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
          headerToolbar: {
            left: "prevYear,prev,next,nextYear today",
            center: "title",
            right: "dayGridMonth,dayGridWeek,dayGridDay",
          },

          selectable: true,
          selectMirror: true,

          navLinks: true, // can click day/week names to navigate views
          editable: true,
          // Create new event
          select: function (arg) {
            Swal.fire({
              html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
              icon: "info",
              showCancelButton: true,
              buttonsStyling: false,
              confirmButtonText: "Yes, create it!",
              cancelButtonText: "No, return",
              customClass: {
                confirmButton: "btn btn-primary",
                cancelButton: "btn btn-active-light",
              },
            }).then(function (result) {
              if (result.value) {
                var title = document.querySelector(
                  "input[name=;event_name']"
                ).value;
                if (title) {
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                  });
                }
                calendar.unselect();
              } else if (result.dismiss === "cancel") {
                Swal.fire({
                  text: "Event creation was declined!.",
                  icon: "error",
                  buttonsStyling: false,
                  confirmButtonText: "Ok, got it!",
                  customClass: {
                    confirmButton: "btn btn-primary",
                  },
                });
              }
            });
          },

          // Delete event
          eventClick: function (arg) {
            Swal.fire({
              text: "Are you sure you want to delete this event?",
              icon: "warning",
              showCancelButton: true,
              buttonsStyling: false,
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, return",
              customClass: {
                confirmButton: "btn btn-primary",
                cancelButton: "btn btn-active-light",
              },
            }).then(function (result) {
              if (result.value) {
                arg.event.remove();
              } else if (result.dismiss === "cancel") {
                Swal.fire({
                  text: "Event was not deleted!.",
                  icon: "error",
                  buttonsStyling: false,
                  confirmButtonText: "Ok, got it!",
                  customClass: {
                    confirmButton: "btn btn-primary",
                  },
                });
              }
            });
          },
          dayMaxEvents: true, // allow "more" link when too many events
          // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
          events: [
            {
              title: "All Day Event",
              start: "2032-01-01",
            },
            {
              title: "Long Event",
              start: "2023-01-07",
              end: "2023-01-10",
            },
            {
              groupId: 999,
              title: "Repeating Event",
              start: "2023-01-09T16:00:00",
            },
            {
              groupId: 999,
              title: "Repeating Event",
              start: "2023-02-16T16:00:00",
            },
            {
              title: "Conference",
              start: "2023-02-11",
              end: "2023-02-13",
            },
            {
              title: "Meeting",
              start: "2023-02-12T10:30:00",
              end: "2023-02-12T12:30:00",
            },
            {
              title: "Lunch",
              start: "2023-02-12T12:00:00",
            },
            {
              title: "Meeting",
              start: "2023-02-12T14:30:00",
            },
            {
              title: "Happy Hour",
              start: "2023-02-12T17:30:00",
            },
            {
              title: "Dinner",
              start: "2023-02-12T20:00:00",
            },
            {
              title: "Birthday Party",
              start: "2023-02-13T07:00:00",
            },
            {
              title: "Click for Google",
              url: "http://google.com/",
              start: "2023-02-28",
            },
          ],
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
				<div class="card-body" >
					<div id="calendar">a</div>
					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->