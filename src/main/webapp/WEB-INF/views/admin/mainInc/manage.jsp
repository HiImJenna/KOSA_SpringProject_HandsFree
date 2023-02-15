<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
                  수정할 수 있는 페이지 입니다.</div>
            </div>
            <div class="card-body">
               <form method="post">
                  <div style="text-align: right">
                     <input class="btn btn-outline-success" type="submit" value="수정완료">
                  </div>
                  <h5>가게정보</h5>
                  <br /> <b>대표 이미지</b> <br /> <img
                     src="${path}/resources/admin/img/kyochon.jpg" height="70px"
                     width="70px" /> <br /> <br /> <b>가게이름</b> <br />
                  ${store.name}<br /> <br /> 주소 <br /> ${store.address}<br />
                  <br /> 대표번호 <br /> <input type="text" value="${store.phone}"
                     name="phone"><br /> <br />
                  <hr />
                  <br>
                  <h5>영업시간</h5>
                  <br /> <b>월~금</b> : <input type="time"
                     value="${store.manage_week_time}" name="manage_week_time"> ~ <input type="time"
                     value="${store.manage_week_time}" name="manage_week_time">
                  <br /> <br /> <b>토요일</b> : <input type="time"
                     value="${store.manage_sat_time}" name="manage_sat_time"> ~ <input type="time"
                     value="${store.manage_sat_time}" name="manage_sat_time">
                  <br /> <br /> <b>일요일</b> : <input type="time"
                     value="${store.manage_sun_time}" name="manage_sun_time"> ~ <input type="time"
                     value="${store.manage_sun_time}" name="manage_sun_time"> 
                  <br /> <br />
                  <hr />
                  <br>
                  <h5>공지사항 안내</h5>
                  <br />
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="notice">${store.notice}</textarea>
                  <br /> <br />
                  <hr />
                  <br />
               </form>

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