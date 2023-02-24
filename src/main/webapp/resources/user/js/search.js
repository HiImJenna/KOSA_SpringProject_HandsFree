
window.onload = function(){
   
   
/*   var hostIndex = location.href.indexOf(location.host) + location.host.length;
   var contextPath = location.href.substring(hostIndex, location.href.indexOf ('/', hostIndex + 1));*/
   
   
   //DragAndDrop
   //태그값 가져오려면  document.getElementById("menu_wrap");
   var chatData = $('#menu_wrap')[0]; 
   chatData.addEventListener("dragstart", dragStart);
   chatData.addEventListener("drag", drag);
   chatData.addEventListener("dragover", dragOver);
   chatData.addEventListener("dragend", dragEnd);

   
   function dragStart(e){}
   
   function drag(e){
      this.style.left = e.clientX - this.offsetWidth + 'px';
      this.style.top = e.clientY - this.offsetHeight + 'px';
   }
   
   function dragOver(e){
   }
   
   function dragEnd(e){
      this.style.left = e.clientX - this.offsetWidth + 'px';
      this.style.top = e.clientY - this.offsetHeight + 'px';
   }   
   
   
   
   
   //클릭 이벤트
   $(document).on("click", "#detailBtn", function(){
/*             var data = $(this).parent();
      console.log(data);
      var data1 = $(this).parents()
      console.log(data1); */
//      $("#chatBtn").css('display', 'inline-block');
      var length = '';
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      storeId = $(this).closest('div').data('obj');
      console.log(storeId);
      var data = {
            title : list_data.find("h4").text(),
            name : 'asd',
            storeId : storeId
      };
      //console.log(data);
      /* console.log(JSON.stringify(data)); */
      $.ajax({
         type : "get",
         url : 'item',
         data:data,
         success : function(data){
            createForm(data);
            /* $('#listGroup').empty();
            var jsonData = JSON.parse(data);
            $('#listGroup').append */
            
         },
         error:function (request, status, error){
                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
            }
      }) 
   });

   
   $(document).on("click", "#reservationBtn", function(){
      var storeId = $(this).closest('div').data('obj');
      console.log(storeId);
      
   });
   
   
   
   
   $(document).on("click", "#information", function(){
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      
      var data = {
            title : title,
            type : 'information',
            storeId : storeId
      };
      
      $.ajax({
         type : "get",
         url : 'item/information',
         data:data,
         success : function(data){
            
            console.log("정보데이터");
            console.log(data);
            createTabView(data, 'information');
         },
         error:function (request, status, error){
                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
            }
      }) 
   });
   
   $(document).on("click", "#review", function(){
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      var storeId = $(this).closest('div').data('obj');
      $('#tabView').empty()
      var data = {
            title : title,
            type : 'review',
            storeId : storeId
      };

      $.ajax({
            type : "get",
            url : 'item/review',
            data:data,
            success : function(data){
               length = data.length;
               var twoData = data; 
               
               itemTab = `
                   <div class="comments">
                     <div class="d-flex resume-review">
                              <span class="type-point">
                                     •
                                 </span>
                                 (${length}) reviews
                      </div>
                    <div>
                             <hr class="nanny-s<div class=" nanny-opinions">
                             `;
                 $('#tabView').append(itemTab);
               
            $.each(data, function(index, obj){
               var date = new Date(obj.USEREDATE);
               var year = String(date.getYear()).substring(1);
               var time = String(date.getHours()).padStart(2, "0") 
               + ":" 
               + String(date.getMinutes()).padStart(2, "0");
               var sumDate = year + ":" + time;
               obj.USEREDATE = sumDate;
               console.log(obj);
               if(obj.PARENT === null || obj.PARENT === undefined)
            	   createTabView(obj, 'review');

               $.each(twoData, function(index, replyObj){
            	   if(obj.IDX === replyObj.PARENT){
            		   createReplyView(replyObj)                		   
            	   }
               })

            	  

            })
               
            },
            error:function (request, status, error){
                      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
               }
         }) 
   });
   
   
   function createTabView(data, type){
//      $('#tabView').children().hide();
      let itemTab = '';
      if(type === 'information')
      {
         itemTab = `
                  <div class="detail">
                     <div id=""><i class="bi bi-megaphone-fill"></i>&nbsp;${data[0].NOTICE}</div><br>
                     <div id=""><i class="bi bi-geo-alt-fill"></i>&nbsp;${data[0].ADDRESS}</div><br>
                     <div id=""><i class="bi bi-telephone-fill"></i>&nbsp;${data[0].PHONE}</div><br>
                     <div id=""><i class="bi bi-clock-fill"></i>&nbsp; 월~금 : ${data[0].MANAGE_WEEK_TIME}</div><br>
                     <div id="">&nbsp;&nbsp;&nbsp;&nbsp;          토요일 : ${data[0].MANAGE_SAT_TIME}</div><br>
                     <div id="">&nbsp;&nbsp;&nbsp;&nbsp;       일요일 : ${data[0].MANAGE_SUN_TIME}</div><br>
                        <se:authorize access="hasRole('ROLE_USER')"> 
	                        <img class="chatBtn" id="chatBtn"  data-obj=${data.storeId}
	                             src="/resources/user/assets/img/chatBtn.png"
	                             alt="이미지 없어유">
                        </se:authorize access>
                      <br>
                  </div>
                  `;
      }else if(type == 'review'){
         itemTab = `
            <div class="nanny-opinions">
                     <div class="comments">
                         <div class="comment">
                             <div class="top-part d-flex justify-content-between align-items-center">
                                 <div class="d-flex">
                                     <div class="user-infos">
                                         <div class="picture"
                                             style="background-image: url(&quot;/img/avatars/default_avatar.svg&quot;);">
                                         </div>
                                     </div>
                                     <div class="name-date">
                                         <div class="name"><b>${data.USERNAME}</b>
                                         </div>
                                         <div class="date">
                                             ${data.USEREDATE}
                                         </div>
                                     </div>
                                 </div>
                                 <div class="stars">
                                     <div class="score">
                                         ${data.STAR}.0
                                     </div>
								<div class="all-stars">`
	        	let startNum = data.STAR
	        	for(j = 0; j<startNum; j++){
	        		itemTab += `<div class="nanny-icon star yellow"></div>&nbsp`
	        	}
				itemTab +=`</div>
                                 </div>
                             </div>
                             <div class="comment-content">${data.USERCONTENT}
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div> `;
      }     
      
      $('#tabView').append(itemTab);
   }
   
   function createReplyView(data){
	   itemTab = `
	      <div class="comment">
	      답글시작
             <div class="top-part d-flex justify-content-between align-items-center">
                 <div class="d-flex">
                     <div class="user-infos">
                         <div class="picture"
                             style="background-image: url(&quot;/img/avatars/default_avatar.svg&quot;);">
                         </div>
                     </div>
                     <div class="name-date">
                         <div class="name"><b>${data.storeId}</b>
                         </div>
                         <div class="date">
                             ${data.USEREDATE}
                         </div>
                     </div>
                 </div>
             </div>
             <div class="comment-content">${data.USERCONTENT}
             </div>
         </div>
	   `;
	   $('#tabView').append(itemTab);
   }
   
   
   //Json 전용 table 생성
   function createForm(data, way){
      $('#listGroup').empty();
      const itemDetail =`
                  <table class="itemDetails table table-borderless">
                      <tr>
                          <th>
                              <img class="item_img" alt="없음" src="resources/user/assets/img/shop.jpg">
                          </th>
                      </tr>
                  
                      <tr>
                          <th>
                              <div class="detailsHeader">
    	  							보관소 🏠 <br>
                                  <h4>${data.title}</h4>
                                   
                              </div>
                          </th>
                      </tr>
                  
                      <tr class="nav nav-pills nav-justified" id="pills-tab" role="tablist">
                          <th class="nav-item" role="presentation">
                              <a id="firstTab" class="nav-link firstTab active" aria-current="page">
                                  <div id="information">정보</div>
                          </th>
                         
                          <th class="nav-item" role="presentation">
                              <a id="secondTab" class="nav-link" aria-current="page">
                                  <div id="review" data-obj=${data.storeId}>리뷰</div>
                              </a>
                          </th>
                      </tr>
                      </th>
                      </tr>
                      <tr>
                          <th>
                              <div id="tabView"></div>
                          </th>

                      </tr>
                  </table>         
                  </div>
                  `;
      $('#listGroup').append(itemDetail);
      //쓸수있음
      // onclick="activateTab('first')"
      //onclick="activateTab('second')"
         
      /* var opr="<table id='fresh-table' class='table'><tr>"+way+"</tr><thead><tr>"+
          "<th>EMPNO</th>"+
           "<th>ENAME</th>"+
           "<th>JOB</th>"+
           "<th>SAL</th>"+
           "<th>EDIT</th><th>DELETE</th></tr></thead><tbody>";
      $.each(data,function(index,emp){
         opr += "<tr><td>"+emp.empno+
         "</td><td>"+emp.ename+
         "</td><td>"+emp.job+
         "</td><td>"+emp.sal+
         "</td><td><input type='button' onclick='empupdate(this)' value='수정' class ='update'  value2="+emp.empno+
         "></td><td><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></td></tr>";
      });
      opr+="<tr><td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td></tr></tbody></table>"; */

   }
   
/*   function activateTab(active){
      let first = document.getElementById('firstTab');
      let second = document.getElementById('secondTab');
      let third = document.getElementById('thirdTab');
      if(active == 'first'){
         first.classList.add('active');
         second.classList.remove('active');
         third.classList.remove('active');
      }else if(active == 'second'){
         first.classList.remove('active');
         second.classList.add('active');
         third.classList.remove('active');
      }else{
         first.classList.remove('active');
         second.classList.remove('active');
         third.classList.add('active');
      }
   }*/
   
   
}