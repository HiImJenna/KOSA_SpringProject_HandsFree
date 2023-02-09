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
					<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 가게홍보를
						볼 수 있는 페이지 입니다.</div>
				</div>
				<div class="card-body">
					<br />
					<h2 style="text-align: center">가게홍보</h2>
					<h4 style="text-align: right">
						<a href="">페이지 미리보기</a>
					</h4>
					<br />
					<!-- 이미지 카드 -->
					<div class="card-deck">
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button"
										onclick="location.href='preMarketingModify.html'"
										class="btn btn-light btn-sm" style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button" class="btn btn-light btn-sm"
										style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button" class="btn btn-light btn-sm"
										style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<br />
					</div>
					<br /> <br />
					<!-- 이미지 카드 -->
					<div class="card-deck">
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button" class="btn btn-light btn-sm"
										style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button" class="btn btn-light btn-sm"
										style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<div class="card">
							<img src="${path}/resources/admin/img/kyochon.jpg"
								class="card-img-top" alt="..." />
							<div class="card-body">
								<div style="text-align: right">
									<button type="button" class="btn btn-light btn-sm"
										style="color: cornflowerblue">
										등록&수정</button>
								</div>
								<h5 class="card-title">허니콤보</h5>
								<h5 style="text-align: right">20,000원</h5>
								<p class="card-text">허니콤보 개존맛 많이드셈</p>
							</div>
						</div>
						<br />
					</div>
					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->