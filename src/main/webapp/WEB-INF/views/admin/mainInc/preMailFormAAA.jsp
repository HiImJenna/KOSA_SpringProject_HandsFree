<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/admin/css/mail.css" />



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
						메일서비스를 볼 수 있는 페이지 입니다.</div>
				</div>
				<div class="card-body">
					<br />
					<h2 style="text-align: center">메일보내기</h2>
					<br />
					
					

					<div id="content">
						<h1>메일</h1>

						<form action=" " method="post" autocomplete="on">
							<p>
								<label for="username" class="icon-user">받는 사람 <span
									class="required">*</span>
								</label> <input type="text" name="username" id="username"
									required="required" placeholder="이메일 주소를 입력하세요" />
							</p>

							<p>
								<label for="usermail" class="icon-envelope">참조 메일 <span
									class="required">*</span>
								</label> <input type="email" name="usermail" id="usermail"
									placeholder="참조 수신인을 입력하세요" required="required" />
							</p>

							<p>
								<label for="usersite" class="icon-link">제목</label> <input
									type="url" name="usersite" id="usersite"
									placeholder="제목을 입력하세요" />
							</p>

							<p>
								<label for="subject" class="icon-bullhorn">첨부파일</label> <input
									type="text" name="subject" id="subject"
									placeholder="What would you like to talk about?" />
							</p>

							<p>
								<label for="message" class="icon-comment">메일 내용 <span
									class="required">*</span>
								</label>
								<textarea placeholder="메일 내용을 입력하세요" required="required"></textarea>
							</p>
							<p class="indication">
								<span class="required">*</span>는 반드시 입력해주세요.
							</p>

							<input type="submit" class="btn btn-outline-primary" value="메일전송하기" />
						</form>
					</div>

					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->