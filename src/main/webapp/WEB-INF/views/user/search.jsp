<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Hands free Search</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
	<!-- Google Fonts Roboto -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
	
	<!-- Custom styles -->
 	<link href="${path}/resources/user/css/search.css" rel="stylesheet" /> 
 	<link href="${path}/resources/user/css/customSearch.css" rel="stylesheet" />
	<link href="${path}/resources/user/css/chat.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
		integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
		crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/418779817b.js" crossorigin="anonymous"></script>
	<!-- sock js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<!-- 커스텀 js -->
	<script type="text/javascript" src="${path}/resources/user/js/search.js"></script>
<style>
body{
	font-family:"맑은 고딕", "고딕", "굴림";
}
html, body {
margin: 0px; 
padding: 0px;
}
#wrapper{
	width: 1200px;
	margin: 0 auto;	
}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;margin:10px 0 30px 10px;padding:5px;}

</style>


</head>
	<!-- 지도 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f8465e5d46edf4274cf5a48ed2ce318&libraries=services"></script>
		<script type="text/javascript">
		var lat='';
		var lon='';

		$(document).ready(function(){
			
			//소켓 연결
			//webSocket 대신 SockJS을 사용하므로 Stomp.client() 가 아닌 Stomp.over()를 사용한다
			const socket = new SockJS('http://localhost:8090/websocket');
			const stomp = Stomp.over(socket);
			stomp.debug = null; //stomp 콘솔출력 X
			//구독 아이디 저장
			const subscribe = [];
			
			//	connect(header, connectCallback(연결에 성공하면 실행되는 메소드 ))
			stomp.connect({}, function(){
				main();
			});
			
			// ***************** 카카오API *****************
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 
			
			if("${destination}" == ""){
				if (navigator.geolocation) {
					  navigator.geolocation.getCurrentPosition(function(position) {
					        lat = position.coords.latitude; // 위도
					        lon = position.coords.longitude; // 경도
					        var locPosition = new kakao.maps.LatLng(lat, lon);
					        var bounds = new kakao.maps.LatLngBounds();
						    var marker = new kakao.maps.Marker({position: locPosition });
						    marker.setMap(map);
						    bounds.extend(locPosition);
						    map.setBounds(bounds);
					  });
				}
			}else{
				// 키워드로 장소를 검색합니다
				ps.keywordSearch('<c:out value="${destination}" />', placesSearchCB);	
			}
		
			
			
			var data = {
					latitude : lat,
					longitude : lon
				}
				$.ajax({
					type : "get",
					url : '/selectStore',
					data:data,
					success : function(data){
						$('#listGroup').empty();
						$.each(data, function(index, obj){
							console.log(obj.NAME);
							console.log("asd");
							createList(obj)
						})
					},
					error:function(request, status, error){
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				})
				
				
				function createList(data){
					const str = data.ADDRESS;
					var address = '';
					if(str.length >= 5){
						console.log(str.length);
						address = str.substr(0,9) + "...";
					}
					console.log("호출 몇번됨??")
					const itemList = `
					<div class="shopList" >
						<img class="shop_img" alt="없음"
							src="${path}/resources/user/assets/img/shop.jpg">
						<div class="shop_info">
								짐 보관소<br>
							<h4>\${data.NAME}</h4>
								\${address}<br>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
						</div>
						<div class="list_button">
							<button type="button" class="btn btn-primary" id="detailBtn"
								style="margin-bottom: 15px">상세보기</button>
							<br>
							<button type="button" class="btn btn-primary">예약하기</button>
						</div>
					</div>`;
					$('#listGroup').append(itemList);
				}

			
			
			
			
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
			
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });
			
			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			//지도끝
			

			
			
			/*  채팅   */
			
			$(document).on("click", "#chatBtn", function(){
				createRoom("세션아이디")
			})
			
			/* 채팅  */
			
			//채팅 만들기
			function createRoom(roomName){
				var nickname = "사용자아이디";
				
					if(nickname){
						var data ={
								roomName : roomName,
								nickname : nickname
						}						
						$.ajax({
							url : "/chatingRoom",
							type :  "POST",
							data : data,
							success : function(data){
								//console.log(data);
								//data값 기준으로 채팅창 페이지 만들다.
								console.log("방만들어질때");
								console.log(subscribe.length);
								initRoom(data, nickname);
							},
			               error:function (request, status, error){
			                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			               }

						})
					}
			}
			
			//메세지 보낼때		
			function sendMessage(){
				console.log("메세지보낼때");
				console.log(subscribe.length);
				
				const message = $(".chat_input_area textarea");
				
				if(message.val() == "")
					return
				
				const roomNumber = info.getRoomNumber();
				const nickname = info.getNickname();
				
				const data = {
						message : message.val(),
						nickname : nickname
				}
				console.log(roomNumber);
				console.log(nickname);
				console.log(data);
				stomp.send("/socket/sendMessage/" + roomNumber, {}, JSON.stringify(data));
				message.val("");
			}
			
			//채팅 구독.!!
			function chatingConnect(roomNumber){
				
				console.log("채팅");
				console.log(subscribe.length);
				//메세지 받을 경로
				const id1 = stomp.subscribe("/topic/message/" + roomNumber, function(result){
					const message = JSON.parse(result.body);
					console.log("메세지 구독")
					console.log(result);
					console.log(message);
					//채팅 그리기
					chating(message);
				})
				// 입장,퇴장 알림을 받을 경로
			const id2 = stomp.subscribe("/topic/notification/" + roomNumber, function(result){
				console.log(result);
				const room = JSON.parse(result.body);
				const message = room.message;
				console.log("5 접근");
				userList(room.users);
			
				const chatHtml = `
			        <li>
			        	<div class="notification">
		            		<span>\${message}</span>
		            	</div>
			        </li>`;
				
				$(".chat ul.chat_list").append(chatHtml);
				$(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
			})
				
			}
			
			//에러메세지
			function errorMSG(result){
				if(result.status == 404){
					alert("종료되었거나 없는 방입니다.");
				}else{
					alert("에러가 발생했습니다.");
				}
				location.href="${pageContext.request.contextPath}/websocket";
			}
			
			
			/*함수*/
			
			
			/*셋팅 데이터*/
			
			
			/* 추후 세션 값 받고 없앨꺼임*/
			const info = (function(){
				let nickname = "";
				let roomNumber = "";
				
				const getNickname = function() {
					return nickname;
				}
				
				const setNickname = function(set){
					nickname = set;
				}
				
				const getRoomNumber = function() {
					return roomNumber;
				}
				
				const setRoomNumber = function(set) {
					roomNumber = set;
				}
				return {
					getNickname : getNickname,
					setNickname : setNickname,
					getRoomNumber : getRoomNumber,
					setRoomNumber : setRoomNumber,
				}
			})();
			/* 추후 세션 값 받고 없앨꺼임*/
			
			function initRoom(roomData, nickname){
				/* $("main").hide(); */
				
				info.setNickname(nickname);
				info.setRoomNumber(roomData.roomNumber);
				
				$(".chat").show();
				$(".chat .chat_title").text(roomData.roomName);
				chatingConnect(roomData.roomNumber);
				
				$(".chat_input_area textarea").focus();
				
			}
			
			function userList(users){
				$(".chat .chat_users .user").text(users.length + "명");
				
				let userHtml = "";
				for(let i=0;i<users.length;i++){
					userHtml += `
						<li>\${users[i]}</li>`;
				}
				
				$(".chat .chat_nickname ul").html(userHtml);
			}
			/*셋팅 데이터*/
			
			
			/* 뷰페이지 그리기 */
			
			function listHtml(roomList){
				let listHtml = "";
				
				for(let i=0; i<roomList.length; i++){
					listHtml += `
						<li data-room_number=\${roomList[i].roomNumber}>
							<span class="chat_title">\${roomList[i].roomName}</span>
							<span class="chat_count">\${roomList[i].users.length}명</span>
						</li>`;
				}
				$("main ul").html(listHtml);
			}
			

			
	 		// 메세지 그리기
			function chating(messageInfo){ 
	 			let nickname = messageInfo.nickname;
	 			let message = messageInfo.message;
	 			
	 			message = message.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp");
	 			
	 			
	 			const date = messageInfo.date;
	 			console.log(date);
	 			const d = new Date(date);
	 			
	 			const time = String(d.getHours()).padStart(2, "0") 
				+ ":" 
				+ String(d.getMinutes()).padStart(2, "0");
	 			
	 			let sender ="";
	 			
	 			if(info.getNickname() == nickname) {
	 				sender = "chat_me";
	 				nickname = "";
	 			} else {
	 				sender=  "chat_other";
	 			}
	 			
	 			const chatHtml = `
	 		        <li>
	 		            <div class=\${sender}>
	 		            	<div>
	 			            	<div class="nickname">\${nickname}</div>
	 			            	<div class="message">
	 				                <span class=chat_in_time>\${time }</span>
	 				                <span class="chat_content">\${message}</span>
	 			                <span>
	 		                </div>
	 		            </div>
	 		        </li>`;
	 			$(".chat ul.chat_list").append(chatHtml);
	 			$(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
			
	 		}
			
			/* 뷰페이지 그리기 */
	})
	//위도 경도
/* 	window.onload = function(){
			console.log("window onload 접근");
			console.log(lat);
			console.log(lon);
			

	} */
	</script>	

<body>
	<!--Main Navigation-->
	<header>
		<!-- 좌측 사이드바 -->
		<!-- Sidebar -->
		<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
			<div class="position-sticky">
				<div id="listGroup" class="list-group list-group-flush mx-2 mt-4">

				</div>
			</div>
				<div id="chatBtn" class="balloon"> </div>
			</div>
		</nav>
		<!-- Sidebar -->

		<!-- header -->
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
		<!--Main layout-->
		<main style="margin-top: 58px">
			<div class="container pt-4">
				<section class="mb-4">
					<div class="card">
						<div class="card-header py-3">
							<h5 id="searchKey">${destination}</h5>
							<h5>${dropDate}</h5>
							<h5>${pickupDate}</h5>
						</div>
						<div id="map" class="card-body">
							<canvas class="my-4 w-100" height="380"></canvas>							
						</div>
						<div id="menu_wrap" class="chat" draggable="true">
							<div>
								<div id="chat_body" class="chat_body">
									<h2 class="chat_title">1번방</h2>
									<button class="chat_back">◀</button>
	
									<ul class="chat_list">
										<li></li>
									</ul>
	
									<div class="chat_input">
										<div class="chat_input_area">
											<textarea class="textareaF"></textarea>
										</div>
	
										<div class="chat_button_area">
											<button>전송</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="mb-4"></section>
			</div>
			
			
							
		</main>
</body>

<%pageContext.include("/WEB-INF/views/include/footer.jsp");%>
</html>
