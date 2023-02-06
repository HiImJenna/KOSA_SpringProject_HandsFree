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
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />

<!-- Custom styles -->
<link href="${path}/resources/css/search.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
	crossorigin="anonymous"></script>

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/418779817b.js"
	crossorigin="anonymous"></script>

<!-- 지도 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f8465e5d46edf4274cf5a48ed2ce318&libraries=services"></script>

</head>

<body>
	<!--Main Navigation-->
	<header>
		<!-- 좌측 사이드바 -->
		<!-- Sidebar -->
		<nav id="sidebarMenu"
			class="collapse d-lg-block sidebar collapse bg-white">
			<div class="position-sticky">
				<div class="list-group list-group-flush mx-2 mt-4">
					<div class="shopList" >
						<img class="shop_img" alt="없음"
							src="${path}/resources/assets/img/shop.jpg">
						<div class="shop_info">
							짐 보관소<br>
							<h4>루피가게</h4>
							옷가게<br> <i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
						</div>
						<div class="list_button">
							<button type="button" class="btn btn-primary" id="detail"
								style="margin-bottom: 15px">상세보기</button>
							<br>
							<button type="button" class="btn btn-primary">예약하기</button>
						</div>
					</div>
				</div>
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
							<h5 id="test">${destination}</h5>
							<h5>${dropDate}</h5>
							<h5>${pickupDate}</h5>
						</div>
						<div id="map" class="card-body">

							<canvas class="my-4 w-100" height="380"></canvas>
						</div>
					</div>
				</section>

				<section class="mb-4"></section>
			</div>
		</main>
		<!--Main layout-->
		<!-- MDB -->
		<script type="text/javascript" src="js/mdb.min.js"></script>
		<!-- Custom scripts -->
		<script type="text/javascript" src="js/admin.js"></script>


		<script>
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
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch('<c:out value="${destination}" />', placesSearchCB); 
		
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
	</script>
		
	<script>
		// ***************** Ajax *****************
		
		
		$(document).ready(function(){
			 $('#detail').click(function(){
				console.log("ajax empty")
				$.ajax(
					{
						$('sidebarMenu').empty();
						
					}
				)
			 })
		})
	</script>	
		
	
</body>

<%
	pageContext.include("/WEB-INF/views/include/footer.jsp");
	%>

</html>
