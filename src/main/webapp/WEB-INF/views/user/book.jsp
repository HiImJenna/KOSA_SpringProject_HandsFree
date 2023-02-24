<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관소 예약하기</title>
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
<!-- toss api -->
<script src="https://js.tosspayments.com/v1/payment"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<sec:authentication property="principal" var="principal"/>
        <!-- 파비콘 -->
        <link rel="icon" href="${path}/resources/admin/img/loca3.png" /> 
</head>
<script type="text/javascript">
		$(document).ready(function(){

			$('#sTime, #eTime').on('change', calculateTimeDifference);
			
			function calculateTimeDifference(){
				var sDate = $('#sdate').val();
    			var eDate = $('#edate').val(); 
				var sTime = $('#sTime').val();
			    var eTime = $('#eTime').val();
				var new_sTime = sTime.substring(0,5);
				var new_eTime = eTime.substring(8,13);

			    // 시작시간과 종료시간이 모두 선택되었을 때만 계산
			    if (sTime && eTime) {

			      var startDate = new Date(sDate + 'T' + new_sTime + ':00');
			      var endDate = new Date(eDate + 'T' + new_eTime + ':00');
			      // 시간 차이 계산
			      var timeDiff = endDate.getTime() - startDate.getTime();
			      // 시간 차이 출력
			      var hours = Math.floor(timeDiff / (1000 * 60 * 60));
			      var price = hours * 5000;
			    
			      $('.value[name="price"]').text(price + '원');
			    }
			}
			
			
			$('#payment-button').click(function(e){
		       console.log("결제버튼 눌림");
		       var username = "${principal.username}";
		       console.log(username)
		       var price = "2000"; //가격 값 받아와야함
		       payment(username);
		    })
		    
		    
		    
		    function payment(username){
		    	
    			var userId = $('#userId').val();
    			var storeid = $('#storeid').text();
    			var name = $('#name').val();
    			var sDate = $('#sdate').val();
    			var eDate = $('#edate').val(); 
    			var sTime = $('#sTime').val();
    			var eTime = $('#eTime').val();

    			var data = {
    					userId : userId,
    					storeid : storeid,
    					name : name,
    					sDate : sDate,
    					eDate : eDate,
    					sTime : sTime,
    					eTime : eTime
    			}
    			$.ajax({
    				url : "/users/paymentData",
    				type : "POST",
    				data : data,
    				success : function(data){
							console.log("성공")    	                  
    	               },
   	                  error:function (request, status, error){
   	                      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
   	                  }
    				
    			})
    			
				let successUrl = "http://localhost:8090/users/paymentreserve";
		        var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
		        var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
		             tossPayments.requestPayment('카드', { // 결제 수단
		               // 결제 정보
		               amount: '2000',
		               orderId: 'QTIk82kxDPefXZC8MLFj0',
		               orderName: "결제 진행",
		               customerName: username,
		               successUrl: successUrl,
		               failUrl: "https://github.com/HiImJenna",   
		               flowMode: 'D',
		               easyPay: '토스페이'
		             })
		    }
		})

</script>


<body>
		<!-- header -->
		<%
		pageContext.include("/WEB-INF/views/include/header.jsp");
		%>

	<div class="form">
		<header>
			<h2>예약하기</h2>
		</header>
				<p>
					<label>예약자명 : </label> <input type="text"
						id="name" name="name" value="" placeholder="예약자명을 입력해주세요">
						
					<label>이메일 : </label> 
					<input type="text" id="userId" name="userId" value="${userId}" readonly>
				</p>
					<button id="payment-button" >결제하기</button>

	</div>

	<div class="carddd">
		<div class="col-lg-5 col-12 margin-b-5e hide-tablet">
			<div class="invoice">
				<div class="invoice-content">
					<div class="place-infos clearfix">
						<div class="place-text">
							<div class="type">
								<div class="address" id="storeName" name="storeName">${storeName}</div>
								<div class="nanny-type">전화번호 : ${phone}</div>
								<div id="storeid" name ="storeid" class="nanny-type">이메일 : ${storeId}</div>
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
							<div class="item">맡기는 날</div>
							<div class="value">임시날짜${sdate}</div>
						</div>
						<div class="price-info clearfix">
							<div class="item">찾는 날</div>
							<div class="value">임시날짜${edate}</div>
						</div>
					</div>
					<div class="infos-part address-warning">
						<div class="separator"></div>
						<div class="title">주소</div>
						<div>${address}</div>
						<div class="separator"></div>
					</div>
					<div class="infos-part">
						<div class="hide-tablet">
							<div>
								<p class="hide-tablet sections-title">날짜</p>
								<div class="date-change">
									<div>
										<div class="d-flex flex-row dates-picker">
											<div class="dates d-flex flex-row">
												<div class="vdatetime">
													<p>맡기는 날</p>
													<input type="date" class="datebutton" name="sdate" id="sdate" value="${sDate}" placeholder="맡기는 날" />
													<select id='sTime' name='sTime'>
														<option value='' selected>-- 선택 --</option>
														<c:forEach items="${timeList}" var="time">
															<option value='${time}'>${time}</option>
														</c:forEach>
													</select>
												</div>
												<div class="vdatetime">
													<p>찾는 날</p>
													<input type="date" class="datebutton" name="edate" id="edate" value="${eDate}" placeholder="찾는 날" />
													<select id='eTime' name='eTime'>
														<option value='' selected>-- 선택 --</option>	
														<c:forEach items="${timeList}" var="time">
															<option value='${time}'>${time}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div>
							<div class="price-info">
								<div class="title">결제 정보</div>
							</div>
							<div class="price-info clearfix">
								<div class="item">기본 요금은 5000기준 입니다.</div>
								<div class="value">1시간 x 5000원</div>
							</div>

							<div class="separator"></div>
							<div class="price-info clearfix">
								<div class="item">
									<b>총</b>
								</div>
								<div class="value font-weight-bold" name="price">0원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>