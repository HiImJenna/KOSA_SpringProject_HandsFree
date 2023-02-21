<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html
    lang="en-US"
    dir="ltr"
    data-n-head="%7B%22lang%22:%7B%22ssr%22:%22en-US%22%7D,%22dir%22:%7B%22ssr%22:%22ltr%22%7D%7D"
    style="--height-screen:1185px;">
	<link href="${path}/resources/user/css/myreserve.css" rel="stylesheet" /> 
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

<head>
        <title>예약내역 👜</title>
       	<meta data-n-head="ssr" charset="utf-8">
        
    </head>
    <body class="bodymargin">
        <noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
            <iframe
                src="https://www.googletagmanager.com/ns.html?id=GTM-MX4P352&"
                height="0"
                width="0"
                style="display:none;visibility:hidden"
                title="gtm"></iframe>
        </noscript>
        
		<%
		pageContext.include("/WEB-INF/views/include/header.jsp");
		%>


	<div id="__nuxt">
            <div id="__layout">
                    <div
                        class="content-row nanny-reservations-container base-nanny-container"
                        data-v-55ac5990="">
                        <!---->
                        <div class="mt-md-5 content">
                            <div class="row">
                                <div class="col-12 col-md-6 content-col">
                                    <h1 class="color-nanny-dark">
                                        	예약 내역 👜
                                    </h1>
                                </div>
                                <div class="col-md-6 text-right desktop help-text">
                                    <div>예약 관련 문의사항이 있으시나요?
                                        <a href="#" class="contact-us">문의하기</a>
                                    </div>
                                </div>
                                <div class="col-12 content-col">
                                    <div>
                                        <div class="table">
                                            <div class="row filters-row">
                                                <div class="col-12 col-md-12 col-lg-6">
                                                    <div class="listing-menu-container">
                                                        <div class="l-button" style="display:none;">
                                                            <span class="nanny-icon left-icon"></span></div>
                                                        <div class="r-button" style="display:none;">
                                                            <span class="nanny-icon right-icon"></span></div>
                                                        <!---->
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-12 col-lg-6">
                                                    <div class="row">
                                                        <div class="col-7 col-md-7"><input
                                                            placeholder="Search by reference"
                                                            name="search"
                                                            type="text"
                                                            aria-describedby="search"
                                                            value=""
                                                            class="form-style">
                                                            <span class="nanny-icon search search-icon"></span></div>
                                                        <div class="col-5 col-md-5 period-container">
                                                            <select class="form-style period-select">
                                                                <option selected="selected" value="">
                                                                    Period
                                                                </option>
                                                            </select>
                                                            <div class="nanny-icon chevron-down select-icon"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                              
                                            <div class="data-presentation">
                                                
                                                <div>
												<table class="table">
												  <thead>
												    <tr>
												      <th scope="col">✔️</th>
												      <th scope="col">보관소명</th>
												      <th scope="col">예약자명</th>
												      <th scope="col">짐 개수</th>
												      <th scope="col">결제 금액</th>
												      <th scope="col">맡기는 날</th>
												      <th scope="col">찾는 날</th>
												      <th scope="col">주소</th>
												      <th scope="col">전화번호</th>
												      
												    </tr>
												  </thead>
												  <tbody>
													  <c:forEach items="${list}" var="item"> 
													    <tr>
													      <th scope="row">${item.index + 1}</th>
													      <td>${item.STORENAME}</td>
													      <td>${item.USERNAME}</td>
													      <td>${item.CNT}개</td>
													      <td>${item.PRICE}</td>
													      <td>${item.SDATE}</td>
													      <td>${item.EDATE}</td>
													      <td>${item.ADDRESS}</td>
													      <td>${item.PHONE}</td>
													      
													    </tr>
													    </c:forEach>
												  </tbody>
												  
												</table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom-mobile"></div>
                    </div>
                    <!---->
                </div>
            </div>
        </div>

        <iframe
            name="_hjRemoteVarsFrame"
            title="_hjRemoteVarsFrame"
            tabindex="-1"
            aria-hidden="true"
            id="_hjRemoteVarsFrame"
            src="https://vars.hotjar.com/box-e031119f9e9e307a08fa610f85dbfb52.html"
            style="display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;"></iframe>
    </body>
</html>