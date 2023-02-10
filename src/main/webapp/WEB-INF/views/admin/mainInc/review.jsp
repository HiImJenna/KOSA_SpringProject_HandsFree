<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link href="${path}/resources/admin/css/star.css" rel="stylesheet" />
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
              <div style="color: #ff6e6e; font-size: x-small">
                *이 페이지는 리뷰관리를 볼 수 있는 페이지 입니다.
              </div>
            </div>
            <div class="card-body">
              <br />
              <form class="mb-3" name="myform" id="myform" method="post">
                <fieldset>
                  <span class="text-bold">별점을 선택해주세요</span>
                  <input
                    type="radio"
                    name="reviewStar"
                    value="5"
                    id="rate1"
                  /><label for="rate1">★</label>
                  <input
                    type="radio"
                    name="reviewStar"
                    value="4"
                    id="rate2"
                  /><label for="rate2">★</label>
                  <input
                    type="radio"
                    name="reviewStar"
                    value="3"
                    id="rate3"
                  /><label for="rate3">★</label>
                  <input
                    type="radio"
                    name="reviewStar"
                    value="2"
                    id="rate4"
                  /><label for="rate4">★</label>
                  <input
                    type="radio"
                    name="reviewStar"
                    value="1"
                    id="rate5"
                  /><label for="rate5">★</label>
                </fieldset>
                <div>
                  <textarea
                    class="col-auto form-control"
                    type="text"
                    id="reviewContents"
                    placeholder="좋은 수강평을 남겨주시면 Cocolo에 큰 힘이 됩니다! 포인트 5000p도 지급!!"
                  ></textarea>
                </div>
              </form>
              <br /><br />
              <canvas class="my-4 w-100" height="30"></canvas>
            </div>
          </div>
        </section>
      </div>
    </main>

    <!--Main layout-->