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
              <div style="color: #ff6e6e; font-size: x-small">
                *이 페이지는 프리미엄관리를 볼 수 있는 페이지 입니다.
              </div>
            </div>
            <div class="card-body">
              <br />
              <h2 style="text-align: center">프리미엄 서비스 관리</h2>
              <br />
              <br />

              <table class="table" style="text-align: center">
                <thead>
                  <tr>
                    <th scope="col">프리미엄ID</th>
                    <th scope="col">가게명</th>
                    <th scope="col">적용기간</th>
                    <th scope="col">프리미엄활성화</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">A00001</th>
                    <td>교촌치킨 서울역점</td>
                    <td>2023.02.01.(수) ~</td>
                    <td>
                      <div class="custom-control custom-switch">
                        <input
                          type="checkbox"
                          class="custom-control-input"
                          id="customSwitch1"
                        />
                        <label
                          class="custom-control-label"
                          for="customSwitch1"
                        ></label>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>

              <canvas class="my-4 w-100" height="30"></canvas>
            </div>
          </div>
        </section>
      </div>
    </main>

    <!--Main layout-->