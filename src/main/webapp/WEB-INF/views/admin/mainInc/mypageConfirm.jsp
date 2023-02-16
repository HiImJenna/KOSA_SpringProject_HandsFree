<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
$(document).ready(()=> {
   
   /* 기본정보 수정*/
   $('#mypage').click(function(){
      $.ajax({
         type : "GET",
         url : "/mypage",
         dataType : "html",
         error : function(){
            alert("새로고침 해주세요11");
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
               <div style="color: #ff6e6e; font-size: x-small">*이 페이지는 비밀번호를
                  입력하는 페이지 입니다.</div>
            </div>
            <h5>마이페이지</h5>
            <br>
            <form method="POST">
               비밀번호를 입력해주세요 : <input type="password" name="password"> <input type="submit" value="확인">
            </form>

            <br />
            <canvas class="my-4 w-100" height="30"></canvas>
         </div>
   </div>
   </section>
   </div>
</main>

<!--Main layout-->