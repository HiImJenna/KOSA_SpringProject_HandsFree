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
                *이 페이지는 채팅관리을 볼 수 있는 페이지 입니다.
              </div>
            </div>
            <div class="card-body">
              <br />
              <h2 style="text-align: center">채팅관리</h2>
              <br />
              <table class="table table-bordered">
                <tbody style="text-align: center">
                  <tr>
                    <td>
                      <i class="fas fa-calendar-check fa-fw me-3"></i>날짜선택
                    </td>
                    <td>예약건수</td>
                    <td>10건</td>
                  </tr>
                  <tr>
                    <td>2023.02.01(화) ~ 2023.02.05(토)</td>
                    <td>채팅내역</td>
                    <td>7건</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table class="table" style="text-align: center">
                <thead class="table-primary">
                  <tr>
                    <th scope="col">예약번호</th>
                    <th scope="col">예약자명</th>
                    <th scope="col">채팅시간</th>
                    <th scope="col">채팅내용</th>
                    <th scope="col">채팅방</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>정우성</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>안녕하세요.</td>
                    <td>
                      <button type="button" class="btn btn-info">입장</button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>정우성</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>안녕하세요.</td>
                    <td>
                      <button type="button" class="btn btn-info">입장</button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>정우성</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>안녕하세요.</td>
                    <td>
                      <button type="button" class="btn btn-info">입장</button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>정우성</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>안녕하세요.</td>
                    <td>
                      <button type="button" class="btn btn-info">입장</button>
                    </td>
                  </tr>
                </tbody>
              </table>
              <nav aria-label="..." style="text-align: center">
                <ul class="pagination">
                  <li class="page-item disabled">
                    <span class="page-link"><<</span>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page">
                    <span class="page-link">2</span>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">>></a>
                  </li>
                </ul>
              </nav>
              <canvas class="my-4 w-100" height="30"></canvas>
            </div>
          </div>
        </section>
      </div>
    </main>

    <!--Main layout-->