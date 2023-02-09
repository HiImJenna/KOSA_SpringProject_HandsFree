<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	$(document).ready(()=> {
	
		/* 메일서비스 폼 */
		$('#preMailForm').click(function(){
			$.ajax({
				type : "GET",
				url : "/kosa/admin/preMailForm",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
			});
		});
	
	});
</script>



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
					<h2 style="text-align: center">메일서비스</h2>
					<br />
					<p style="text-align: right">
						<button class="btn btn-outline-primary"
							 id=preMailForm> 전체 메일보내기 </button>
					</p>
					<form>
						<div class="form-row align-items-center">
							<div class="col-auto">
								<label class="sr-only" for="inlineFormInput">Name</label>
							</div>
							<div class="col-auto">
								<label class="sr-only" for="inlineFormInputGroup">고객조회하기</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-search"></i>
										</div>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroup" placeholder="고객조회하기" />
								</div>
							</div>

							<div class="col-auto">
								<button type="submit" class="btn btn-outline-primary mb-2">
									조회</button>
							</div>
						</div>
					</form>

					<table class="table table" style="text-align: center">
						<thead class="table-primary">
							<tr>
							<tr>
								<td>번호</td>
								<td>고객이름</td>
								<td>선택</td>
								<td>메일전송</td>
							</tr>
							</tr>
						</thead>

						<tbody style="text-align: center">

							<tr>
								<td>00001</td>
								<td>장동건</td>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck1" /> <label
											class="custom-control-label" for="customCheck1"></label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-info">메일전송</button>
								</td>
							</tr>
							<tr>
								<td>00001</td>
								<td>장동건</td>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck2" /> <label
											class="custom-control-label" for="customCheck2"></label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-info">메일전송</button>
								</td>
							</tr>
							<tr>
								<td>00001</td>
								<td>장동건</td>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck3" /> <label
											class="custom-control-label" for="customCheck3"></label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-info">메일전송</button>
								</td>
							</tr>
							<tr>
								<td>00001</td>
								<td>장동건</td>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck4" /> <label
											class="custom-control-label" for="customCheck4"></label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-info">메일전송</button>
								</td>
							</tr>
							<tr>
								<td>00001</td>
								<td>장동건</td>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck5" /> <label
											class="custom-control-label" for="customCheck5"></label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-info">메일전송</button>
								</td>
							</tr>
						</tbody>
					</table>

					<nav aria-label="..." style="text-align: center">
						<ul class="pagination">
							<li class="page-item disabled"><span class="page-link"><<</span>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active" aria-current="page"><span
								class="page-link">2</span></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">>></a></li>
						</ul>
					</nav>



					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->