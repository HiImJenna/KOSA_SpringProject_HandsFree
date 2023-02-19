<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
<link href="${path}/resources/user/css/book.css" rel="stylesheet" /> 
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

</head>
<body>
		<!-- header -->
		<%
		pageContext.include("/WEB-INF/views/include/header.jsp");
		%>

	<div class="form">
		<header>
			<h2>예약하기</h2>
		</header>
		<section>
			<form>
				<p>
					<label for="dropDate">맡기는 날짜 : </label> <input type="date"
						id="dropDate" name="dropDate" />
				</p>
				<p>
					<label for="pickuplDate">찾는 날짜 : </label> <input type="date"
						id="pickuplDate" name="pickuplDate" />
				</p>
				<p>
					<label for="tourPackage"> 짐 개수 : </label> <select>
						<option value="one">1개</option>
						<option value="two">2개</option>
						<option value="three">3개</option>
						<option value="four">4개</option>
						<option value="five">5개</option>
					</select>
				</p>
				<p>
					<label for="coupon"> 결제 수단 </label> <input type="text"
						name="coupon" placeholder="UNKNOWN_TYPE" /> <input type="text"
						name="coupon" placeholder="UNKNOWN_TYPE" /> <input type="text"
						name="coupon" placeholder="UNKNOWN_TYPE" />
				</p>
				<p class='paddingTop'>
					<label for="terms"> Terms and conditions* </label> <input
						type="radio" class="radio" name="terms" value="Iagree">동의
					<input type="radio" class="radio" name="terms" value="Idisagree">비동의
				</p>
				<p>
					<button type="button">Complete reservation</button>
				</p>
			</form>
		</section>
	</div>

	<div class="carddd">
		<div class="col-lg-5 col-12 margin-b-5e hide-tablet">
			<div class="invoice">
				<div class="invoice-content">
					<div class="place-infos clearfix">
						<div class="place-text">
							<div class="type">
								<div class="address">Coventry St, London</div>
								<div class="nanny-type">Electronics store</div>
								<div class="d-flex nanny-stars">
									<div class="type-point" style="display: none;">•</div>
								</div>
							</div>
						</div>
						<div class="place-pic">
							<div class="top-image nanny-type-banner ELECTRONICS_STORE">
								<div class="type-icon nanny-type-icon white ELECTRONICS_STORE"></div>
							</div>
						</div>
					</div>
					<div class="infos-part top-part" style="display: none;">
						<div class="separator"></div>
						<div class="price-info clearfix">
							<div class="item">Drop-off</div>
							<div class="value">Feb 10, 2023 at 10:00 AM - 10:30 AM</div>
						</div>
						<div class="price-info clearfix">
							<div class="item">Pick-up</div>
							<div class="value">Feb 11, 2023 at 11:00 AM - 11:30 AM</div>
						</div>
					</div>
					<div class="infos-part address-warning">
						<div class="separator"></div>
						<div class="title">Address</div>
						<div>The exact address will be given to you after booking</div>
						<div class="separator"></div>
					</div>
					<div class="infos-part">
						<div class="hide-tablet">
							<div>
								<p class="hide-tablet sections-title">Dates</p>
								<div class="date-change">
									<div>
										<div class="d-flex flex-row dates-picker">
											<div class="dates d-flex flex-row">
												<div class="vdatetime">
													<p>Drop-off</p>
													<a class="nanny-icon calendar leftcal"></a> <a
														id="bookingDepositDateTimeUniversal" role="button"
														class="to users-map-label"> Today <!----> <span>10:00
															- 10:30</span></a>
													<!---->
													<div class="">
														<div class="">
															<div class="">
																<!---->
															</div>
														</div>
													</div>
												</div>
												<a class="rightcal nanny-icon calendar"></a>
												<div class="vdatetime">
													<p>Pick-up</p>
													<a id="bookingWithdrawalDateTimeUniversal" role="button"
														class="to users-map-label"> 11 Feb <span>11:00
															- 11:30</span></a>
													<!---->
													<div class="">
														<div class="">
															<div class="">
																<!---->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
					<div>
						<div>
							<div class="price-info">
								<div class="title">Price details</div>
							</div>
							<div class="price-info clearfix">
								<div class="item">£6.00 x 2 objects x 2 days</div>
								<div class="value">£12.00</div>
							</div>
							<!---->
							<!---->
							<!---->
							<div class="price-info clearfix">
								<div class="item">Luggage protection</div>
								<div class="value">Free</div>
							</div>
							<div class="price-info clearfix">
								<div class="item">Security seal</div>
								<div class="value">Included</div>
							</div>
							<div class="separator"></div>
							<div class="price-info clearfix">
								<div class="item">
									<b>Total</b>
								</div>
								<div class="value font-weight-bold">£24.00</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
</body>
</html>
