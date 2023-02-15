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
					<div style="color: #ff6e6e; font-size: x-small">*이 페이지는
						마이페이지를 볼 수 있는 페이지 입니다.</div>
				</div>
				<div class="card-body">
					<br>
					<h2 style="text-align: center">마이페이지</h2>

					<form id="storeRegister" method="post">
						<!-- 제출 버튼 -->
						<div class="" style="text-align: right">
							<button class="btn btn-outline-success" id="submitButton"
								type="submit">수정하기</button>
						</div>
						<!-- 이메일 -->
						이메일 <br>
						<div class="row" style="height: 58px; width: 600px; padding: 0px;">
							<div class="col-10">
								<input style="height: 51px;" class="form-control" name="email"
									id="email" type="email" placeholder="이메일"
									data-sb-validations="required,email" />
							</div>
						</div>
						<br>
						<!-- 비밀번호 -->
						비밀번호 <br>
						<div class="row" style="height: 58px; width: 600px; padding: 0px;">
							<div class="col-10">
								<input style="height: 51px;" class="form-control"
									name="password" id="password" type="password"
									placeholder="비밀번호" data-sb-validations="required" /> <label
									for="password">password</label>
								<div class="invalid-feedback"
									data-sb-feedback="password:required">Password is
									required.</div>
							</div>
						</div>
						<!-- 비밀번호 확인 -->
						<div class="row" style="height: 58px; width: 600px; padding: 0px;">
							<div class="col-10">
								<input style="height: 51px;" class="form-control" id="password"
									type="password" placeholder="비밀번호 확인"
									data-sb-validations="required" />

								<div class="invalid-feedback"
									data-sb-feedback="password:required">Password is
									required.</div>
							</div>
						</div>

						<!-- 이름 -->
						<br> 성
						<div class="row" style="height: 58px; width: 600px; padding: 0px;">
							<div class="col-10">
								<input style="height: 51px;" class="form-control"
									name="lastName" id="name" type="text" placeholder="성"
									data-sb-validations="required" />
							</div>
							<br>
						</div>
						이름
						<div class="row" style="height: 58px; width: 600px; padding: 0px;">
							<div class="col-10">
								<input style="height: 51px;" class="form-control"
									name="firstName" id="name" type="text" placeholder="이름"
									data-sb-validations="required" />
							</div>
						</div>
					</form>
					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>