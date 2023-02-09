<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!--     <script type="text/javascript" src="/scripts/jquery-ui/jquery.min.js"></script>
	<script type="text/javascript" src="/scripts/common/common-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#emailBtn').click(function(){
				var formData = new FormData($('#fileForm')[0]);
				$.ajax({
					type: "post",
					enctype: 'multipart/form-data', //필수
					processData: false,
 				    contentType: false,
 				    data: formData,
 				    url : "preMailAAA",
 				    cache: false,
					success : function(data){
						alert("메일이 발송되었습니다.");
					},
					error: function(request, status, error){
	     			      //alert("loading error:" + request.status);
	     			      console.log("code : " +  request.statusText  + "\r\nmessage : " + request.responseText);
	     			   
	     			 }
				});
	
				$('#joinSubmit').attr("disabled",false);
			});
			
			
			/* 비동기로 메일 수신인 추가 */
			$('#addMail').click(function(){
				const box = this.parentElement.parentElement;  
				const newP = document.createElement("tr");
				newP.innerHTML = "<tr class='form-group'><td></td><td><input type='text' class='form-control' name='toMail' ></td><td><input type='button' id='removeBtn' class='form-control' value='삭제' ></td></tr>";
				box.parentNode.insertBefore(newP, box.nextSibling);
			});
			
			$('#addccMail').click(function(){
				const box = this.parentElement.parentElement;  
				const newP = document.createElement("tr");
				newP.innerHTML = "<tr class='form-group'><td></td><td><input type='text' class='form-control' name='toMail' ></td><td><input type='button' id='removeBtn' class='form-control' value='삭제'></td></tr>";
				box.parentNode.insertBefore(newP, box.nextSibling);
			});
			
			$(document).on("click","#removeBtn", function(){
				$(this).parent().parent().remove();
				console.log($(this).parent());
			})
			$('#removeBtn').click(function(){
				alert("asd");
				console.log($(this));
				$(this).removeChild;
			});
			
			
			
		});
	</script>
	


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
					<div class="container">
<div style="float: left; width: 50%;">
    <h1>텍스트 메일 보내기</h1>
 
    <form id="fileForm" action="" method="post" enctype="multipart/form-data"> <!-- 인코딩 타입으로 이미지, 파일 서버로 전송할 경우 사용  -->
        <table>
            <tr id="box" class="form-group">
                <td>받는 사람</td>
                <td>
                    <input type="text" class="form-control" name="toMail" placeholder="이메일 주소를 입력하세요">
                </td>
                <td>
					<input type="button" id="addMail" class="form-control" value="추가">
				</td>
            </tr>
            <tr id="box2" class="form-group">        
                <td>참조 메일 주소</td>
                <td>
                    <input type="text" class="form-control" name="ccMail" placeholder="참조 수신인을 입력하세요">
                </td>
                <td>
					<input type="button" id="addccMail" class="form-control" value="추가">
				</td>
            </tr>
            <tr class="form-group">
                <td>제목</td>
                <td>
                    <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
                </td>
            </tr>
            <tr class="form-group">
                <td>내용</td>
                <td>
                    <textarea class="form-control" name="content" placeholder="보낼 내용을 입력하세요"> </textarea>
                </td>
            </tr>
            <tr class="form-group">
            	<td>첨부 파일 </td>
            	<td>
            		<input type="file" name="file" class="file-input" />
            	</td>
            </tr>
        </table>
        <button id = "emailBtn" type="button" class="btn btn-default">발송</button>
    </form>
 
 </div>
 </div>
					



					<canvas class="my-4 w-100" height="30"></canvas>
				</div>
			</div>
		</section>
	</div>
</main>

<!--Main layout-->