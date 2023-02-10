<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HandsFree main</title>
        <link rel="icon" type="image/x-icon" href="${path}/resources/user/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
            <div class="container px-5">
                <a class="navbar-brand fw-bold" href="#page-top">Hands Free</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="bi-list"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#about us">About us</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#price">가격</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#guide">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#">Korean</a></li>
                    </ul>
                    
                   <se:authentication property="name"/> <!-- 유저 이름 보여줌 -->
                   
                   <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/login'">
						<span class="d-flex align-items-center"> 
							<span class="small">로그인</span>
						</span>
					</button>
					
					
					
						<li>
							<a href="${pageContext.request.contextPath}/logout">${loginuser}:로그아웃</a>
						</li>
					<button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='/users/register'">
						<span class="d-flex align-items-center"> 
							<span class="small">회원가입</span>
						</span>
					</button>
					
                </div>
            </div>
        </nav>
        <!-- 메인 -->
        <form name = "bookingform" action="${path}/search" method=get>
	        <header class="masthead">
	            <div class="container px-5">
	                <div class="row gx-5 align-items-center">
	                    <div class="col-lg-6">
	                        <!-- Mashead text and app badges-->
	                        <div class="mb-5 mb-lg-0 text-center text-lg-start">
	                            <h1 class="display-1 lh-1 mb-3">Hands free와 함께하는 <br>가벼운 여행의 시작</h1> <br> 
	
	                            <p class="lead fw-normal text-muted mb-5">
	                                <i class="bi bi-geo-alt-fill"></i> &nbsp 
	                                	<input class="input-text" type="text" placeholder="어디로 가시나요?" name="destination" id="destination"><br><br> 
	                                <i class="bi bi-calendar3"></i> &nbsp
	                                <input type="text" class="datebutton" name="dropDate" id="dropDate" placeholder = "맡기는 날"/>
	                                <input type="text" class="datebutton" name="pickupDate" id="pickupDate" placeholder = "찾는 날"/> <br><br>
	                                <i class="bi bi-handbag"></i> &nbsp 짐 1개
	
	                            </p>
	                            <div class="d-flex flex-column flex-lg-row align-items-center">
	                                <button class="custom-btn btn-1">검색하기</button>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-6">
	                        <img class = "main-img" src="${path}/resources/user/assets/img/main.png" alt="main image" width="500" height="500">
	                    </div>
	                </div>
	            </div>
	        </header>
        </form>

        <!-- About us -->
        <section id="about us">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
                        <div class="container-fluid px-5">
                            <div class="row gx-5">
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-clock icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">언제, 어디서나</h3>
                                        <p class="text-muted mb-0">여행 루트에 맞는 장소와 시간에 짐을 보관해 가벼운 여행을 즐겨보세요.</p>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        
                                        <i class="bi-chat icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">실시간 채팅</h3>
                                        <p class="text-muted mb-0">보관소와의 실시간 1:1 채팅으로 빠르고 <br>원활한 소통이 가능합니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-5 mb-md-0">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-star icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">숨겨진 핫플</h3>
                                        <p class="text-muted mb-0">보관소에 짐을 맡기며 <br>숨겨진 가게들을 발견해보세요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-patch-check icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">고정된 가격</h3>
                                        <p class="text-muted mb-0">10,000원/시간의 고정된 <br> 가격으로 보관 서비스를 이용해보세요.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 order-lg-0">
                        <img class = "main2-img" src="${path}/resources/user/assets/img/main2.png" alt="mian image" width="500" height="500">
                    </div>
                </div>
            </div>
        </section>

        <!-- 가격-->
        <section class="bg-light" id = "price">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
                    <div class="col-12 col-lg-5">
                        <h2 class="display-4 lh-1 mb-4"><b>가격</b></h2>
                        <p class="lead fw-normal text-muted mb-5 mb-lg-0">
                            <b>시간 당 10,000원</b><br>
                            NO 보증금<br>
                            NO 수수료
                        </p>
                    </div>
                    <div class="col-sm-8 col-md-6">
                        <div class="px-5 px-sm-0"><img style="width: 500px; height: 500px;" src="${path}/resources/user/assets/img/coin.png" alt="coin" /></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 이용가이드, FAQ
        <section class="bg-light" id = "guide">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
                    
                        <h2 class="display-4 lh-1 mb-4">이용가이드, FAQ</h2>
                        <p class="lead fw-normal text-muted mb-5 mb-lg-0"></p> 
                        <h3 style="color: rgb(59, 59, 59);">Q. 영남님은 어떻게 그렇게 코딩을 잘 하시나요?</h3>
                        <h4 style="color: rgb(106, 106, 106);">A. No one knows</h4>

                        <h3 style="color: rgb(59, 59, 59);">Q. 현중님은 어떻게 그렇게 코딩을 잘 하시나요?</h3><br>
                        <h4 style="color: rgb(106, 106, 106);">A. No one knows</h4><br>

                        <h3 class="font-alt">Q. 승복님은 어떻게 그렇게 코딩을 잘 하시나요?</h3><br>
                        <h4 style="color: rgb(106, 106, 106);">A. No one knows</h4><br>

                        <h3 class="font-alt">Q. 교수님은 어떻게 그렇게 코딩을 잘 하시나요?</h3><br>
                        <h4 style="color: rgb(106, 106, 106);">A. No one knows</h4><br>

                        
                    
                    <div class="col-sm-8 col-md-6">
                        <div class="px-5 px-sm-0"><img class="img-fluid rounded-circle" src="https://source.unsplash.com/u8Jn2rzYIps/900x900" alt="..." /></div>
                    </div>
                    
                </div>
            </div>
        </section> -->

        <!-- 이용가이드 FAQ -->
        <section class="cta">
            <div class="cta-content">
                <div class="container px-5">
                    <h1 class="text-white display-1 lh-1 mb-4">이용가이드</h1>
                    <h3 style="color: white;">Q.회원가입은 어떻게 하나요?</h3> <h4 style="color: white;">A. 버튼을 누르세요.</h4>
                    <h3 style="color: white;">Q.회원가입은 어떻게 하나요?</h3> <h4 style="color: white;">A. 버튼을 누르세요.</h4>
                    <h3 style="color: white;">Q.회원가입은 어떻게 하나요?</h3> <h4 style="color: white;">A. 버튼을 누르세요.</h4>

                    <!-- <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="https://startbootstrap.com/theme/new-age" target="_blank">Download for free</a> -->
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <footer class="bg-black text-center py-5">
            <div class="container px-5">
                <div class="text-white-50 small">
                    <div class="mb-2">&copy; Enjo2 2023. All Rights Reserved.</div>
                    <span class="mx-1">&middot;</span>
                    <a href="#!">Git</a>
                    <span class="mx-1">&middot;</span>
                </div>
            </div>
        </footer>
        <!-- Login Modal-->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-gradient-primary-to-secondary p-4">
                        <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">로그인</h5>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body border-0 p-4">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
<!--                             Name input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div> -->
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">Email</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <!-- Password input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" type="password" placeholder="123!@#abcABC" data-sb-validations="required" />
                                <label for="password">Password</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">A Password is required.</div>
                            </div>
<!--                             Message input
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div> -->
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Register Modal-->
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-gradient-primary-to-secondary p-4">
                        <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">회원가입</h5>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body border-0 p-4">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="email@example.com" data-sb-validations="required,email" />
                                <label for="email">Email address</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
							<!-- Password input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" type="password" placeholder="123abcABC!@#" data-sb-validations="required" />
                                <label for="password">password</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
                            </div>
<!--                             Phone number input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div> -->
<!--                             Message input
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div> -->
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/user/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
 </html>
