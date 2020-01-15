<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

   <c:import url="../common/commonUtil.jsp">
      <c:param name="titleName" value="QnA&FAQ페이지"/>
   </c:import>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/af.js"></script>

<!------ Include the above in your HEAD tag ---------->
<style>
.tab-pane fade{width:100%;}

#container{width:100%;}
</style>
</head>

<body class="animsition">
   <c:import url="../common/header.jsp"/>
   <c:import url="../common/cart.jsp"/>
   
   <br><br><br><br><br>
<section>
 <div class="container">
              <div class="row">
                <div class="col-12 ">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" onclick="showHome();">Product</a>
                      <a class="nav-item nav-link" id="nav-post-tab" data-toggle="tab" href="#nav-post" role="tab" aria-controls="nav-profile" aria-selected="true" onclick="showPost();">Post</a>
                      <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a>
                      <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">About</a>
                      <a class="nav-item nav-link" id="nav-notice-tab" data-toggle="tab" href="#nav-notice" role="tab" aria-controls="nav-notice" aria-selected="false">notice</a>
                    </div>
                  </nav>
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                  <!-- 첫번째 태그 -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    
			<div id="container">
         <section id="board-container-1" class="container">
            <p>총  <span id="homeCnt">${list.size()}</span> 건의 게시물이 있습니다.</p>
            <input type="button" value="글쓰기" id="btn-add" class="btn btn-light" style="float:right";  onclick="helpForm();"/>
            <br /><br />
            <table id="tbl-board-home" class="table table-striped table-hover" style="width:100%";>
               <tr>
               	  <th>번호</th>
                  <th>제목</th>
                  <th>아이디</th>
                  <th>등록일자</th>
               </tr>
               <c:forEach items="${faqList}" var="q"> 
               <tr id="qcon">
               	  <td>${q.qnaNo}</td>
                 <td>${q.qTitle}</td>
                 <td>${q.userId}</td>
                  <td>${q.qDate}</td>
                 

               </tr>
               </c:forEach>
            </table>
         </section> 
   				</div>
                    </div>
                    
                    <!-- 두번째 태그 -->
                    <div class="tab-pane fade" id="nav-post" role="tabpanel" aria-labelledby="nav-post-tab">
             <div id="container">
         <section id="board-container-1" class="container">
            <p>총  <span id="postCnt">${list.size()}</span> 건의 게시물이 있습니다.</p>
            <input type="button" value="글쓰기" id="btn-add" class="btn btn-light" style="float:right";  onclick="psotForm();"/>
            <br /><br />
            <table id="tbl-board-post" class="table table-striped table-hover" style="width:100%";>
               <tr>
               	  <th>번호</th>
                  <th>제목</th>
                  <th>아이디</th>
                  <th>등록일자</th>
               </tr>
              
            </table>
         </section> 
   				</div>
   			</div>
   					
   					<!-- 세번째 태그 -->
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                      Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                    </div>
                    <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                      
                      <div class="accordion" id="accordionExample">
					  <div class="card">
					    <div class="card-header" id="headingOne">
					      <h2 class="mb-0">
					        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					          Collapsible Group Item #1
					        </button>
					      </h2>
					    </div>
					
					    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
					      <div class="card-body">
					        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					      </div>
					    </div>
					  </div>
					  <div class="card">
					    <div class="card-header" id="headingTwo">
					      <h2 class="mb-0">
					        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					          Collapsible Group Item #2
					        </button>
					      </h2>
					    </div>
					    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
					      <div class="card-body">
					        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					      </div>
					    </div>
					  </div>
					  <div class="card">
					    <div class="card-header" id="headingThree">
					      <h2 class="mb-0">
					        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          Collapsible Group Item #3
					        </button>
					      </h2>
					    </div>
					    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
					      <div class="card-body">
					        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					      </div>
					    </div>
					  </div>
					</div>
                      
                    </div>
                     <div class="tab-pane fade" id="nav-notice" role="tabpanel" aria-labelledby="nav-notice-tab">
                      Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                    </div>
                 
                  </div>
                
                </div>
              </div>
        </div>
            
            			
</section>
   <script>
   function helpForm(){
		location.href = "${pageContext.request.contextPath}/helpForm.do";
	}
   function psotForm(){
	    location.href = "${pageContext.request.contextPath}/postForm.do"
   }
   
   
    
   
	// 최근 게시글 목록 꺼내기
	function showHome(){
		$.ajax({
			url : '${pageContext.request.contextPath}/help/faqList.do',
			type : 'get',
			success : function(data){
				
				console.log(data);
				
				var $table = $('#tbl-board-home');
				$table.empty();
				$table.append('<tr>' +
		                  		'<th>번호</th>' +
		                  		'<th>제목</th>' +
		                  		'<th>작성자</th>' +
		                  		'<th>등록일자</th>' +
		               			'</tr>');
				for(var i in data){
					var $trHelpAndFAQ = $('<tr>');
					var $tdqnaNo = $('<td>').text(data[i].qnaNo);
					var $tdqTitle = $('<td>').text(data[i].qTitle);
					var $tduserId = $('<td>').text(data[i].userId);
					var $tdqDate = $('<td>').text(moment(data[i].qDate).format('YYYY-MM-DD'));
					
					
					$trHelpAndFAQ.append($tdqnaNo)
					.append($tdqTitle)
					.append($tduserId)
					.append($tdqDate);
					
					$table.append($trHelpAndFAQ);
				}
				$('#homeCnt').text(data.length);
				
			}, error : function(request){
				
				console.log("에러났어요.");
				console.log(request);
				
			}
		});
	}
	
	function showPost(){
		$.ajax({
			url : '${pageContext.request.contextPath}/post/postList.do',
			type : 'get',
			success : function(data){
				
				console.log(data);
				
				var $table = $('#tbl-board-post');
				$table.empty();
				$table.append('<tr>' +
                  		'<th>번호</th>' +
                  		'<th>제목</th>' +
                  		'<th>작성자</th>' +
                  		'<th>등록일자</th>' +
               			'</tr>');
				for(var i in data){
					console.log(data[i]);
					
					var $trPost = $('<tr>');
					var $tdpsnano = $('<td>').text(data[i].psnano);
					var $tdpstitle = $('<td>').text(data[i].pstitle);
					var $tduserId = $('<td>').text(data[i].userId);
					var $tdpsdate = $('<td>').text(moment(data[i].psdate).format('YYYY-MM-DD'));
					
					$trPost.append($tdpsnano)
					.append($tdpstitle)
					.append($tduserId)
					.append($tdpsdate);
					
					$table.append($trPost);
				}
				$('#postCnt').text(data.length);
				
			}, error : function(request){
				
				console.log("에러났어요.");
				console.log(request);
				
			}
		});
	}
	

   </script>
   <c:import url="../common/footer.jsp"/>

</body>
</html>