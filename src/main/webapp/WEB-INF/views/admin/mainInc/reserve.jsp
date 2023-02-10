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
                *이 페이지는 예약현황을 볼 수 있는 페이지 입니다.
              </div>
            </div>
            <div class="card-body">
              <br />
              <h2 style="text-align: center">예약현황</h2>
              <br />
              <table class="table table-bordered">
                <tbody style="text-align: center">
                  <tr>
                    <td>
                      <i class="fas fa-calendar-check fa-fw me-3"></i>날짜선택
                    </td>
                    <td>예약건수</td>
                    <td>40건</td>
                  </tr>
                  <tr>
                    <td>2023.02.01(화) ~ 2023.02.05(토)</td>
                    <td>결제금액</td>
                    <td>300,000원</td>
                  </tr>
                </tbody>
              </table>
              <br />
              <table class="table" style="text-align: center">
                <thead class="table-primary">
                  <tr>
                    <th scope="col">예약번호</th>
                    <th scope="col">예약시간</th>
                    <th scope="col">이용날짜(시작)</th>
                    <th scope="col">이용날짜(종료)</th>
                    <th scope="col">짐 갯수</th>
                    <th scope="col">예약자명</th>
                    <th scope="col">결제금액</th>
                    <th scope="col">기타</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>2023.01.15.(일) <br />오후 08:43:00</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>2023.01.15.(일) <br />오후 10:00:00</td>
                    <td>3</td>
                    <td>정우성</td>
                    <td>18,000원</td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>2023.01.15.(일) <br />오후 08:43:00</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>2023.01.15.(일) <br />오후 10:00:00</td>
                    <td>3</td>
                    <td>정우성</td>
                    <td>18,000원</td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>2023.01.15.(일) <br />오후 08:43:00</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>2023.01.15.(일) <br />오후 10:00:00</td>
                    <td>3</td>
                    <td>정우성</td>
                    <td>18,000원</td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>2023.01.15.(일) <br />오후 08:43:00</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>2023.01.15.(일) <br />오후 10:00:00</td>
                    <td>3</td>
                    <td>정우성</td>
                    <td>18,000원</td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">B1F83BN2</th>
                    <td>2023.01.15.(일) <br />오후 08:43:00</td>
                    <td>2023.01.15.(일) <br />오후 09:00:00</td>
                    <td>2023.01.15.(일) <br />오후 10:00:00</td>
                    <td>3</td>
                    <td>정우성</td>
                    <td>18,000원</td>
                    <td></td>
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