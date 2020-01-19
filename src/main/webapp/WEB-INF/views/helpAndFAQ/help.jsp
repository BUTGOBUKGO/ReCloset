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
#nav-tab {
   width : 100%;
   background-color : #FFDD73;
}
</style>

		<script>
		
		$(function(){
		    $(".showHome").on("click",function(){
		       var qnaNo = $(this).attr("id");
		       console.log("qnaNo="+ qnaNo);
		       location.href = "${pageContext.request.contextPath}/help/helpView.do?no="+qnaNo;
		    });
		    
		   
		 }); 
		</script>

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
                      <a class="nav-item nav-link active" style="color:#6C6C6C;" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" onclick="showHome();">상품문의</a>
                      <a class="nav-item nav-link" style="color:#6C6C6C;" id="nav-post-tab" data-toggle="tab" href="#nav-post" role="tab" aria-controls="nav-profile" aria-selected="true" onclick="showPost();">배송문의</a>
                      <a class="nav-item nav-link" style="color:#6C6C6C;" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">자주묻는질문</a>
                      <a class="nav-item nav-link" style="color:#6C6C6C;" id="nav-notice-tab" data-toggle="tab" href="#nav-notice" role="tab" aria-controls="nav-notice" aria-selected="false">공지사항</a>
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
               <tr id="${q.qnaNo}" class="showHome">
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
            <input type="button" value="글쓰기" id="btn-add" class="btn btn-light" style="float:right";  onclick="postForm();"/>
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
                  
                    <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                      
                      <div class="accordion" id="accordionExample">
                 <div class="card">
                   <div class="card-header" id="headingOne">
                     <h2 class="mb-0">
                       <button class="btn btn-link" style="color:#5A5A5A;" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          [배송문의]주문했는데 품절이라고 문자가 왔어요.
                       </button>
                     </h2>
                   </div>
               
                   <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                     <div class="card-body">
                       먼저 품절이 발생하게 되어 죄송합니다.
            
                        품절인 제품을 다른 색상 또는 다른 제품 교환 원하실 경우 게시판에 남겨 주시면 추가금액(+3000원)까지 지원해 드리고 있습니다. 
                        환불 원하실 경우 카드는 부분 환불 되며 무통장은 계좌를 남겨 주시면 환불해 드립니다.   휴대폰결제는 부분환불이 되지 않습니다.             
                        적립금으로 환불받으시거나, 현금 환불 도움드리고 있습니다. 7만원 이상 주문하셔서 배송료 무료 혜택을 받으신 경우인데 
                        한 개의 제품이 품절인 경우(변심반품제외) 7만원 미만이 되어 무료 배송에 해당하지 않아도 배송료는 저희가 부담해 드립니다.
                        (단 고객님 측에서 취소를 하신 경우는 배송료 고객님 부담입니다.) 
                     </div>
                   </div>
                 </div>
                 <div class="card">
                   <div class="card-header" id="headingTwo">
                     <h2 class="mb-0">
                       <button class="btn btn-link collapsed" style="color:#5A5A5A; type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                         [기타문의]현금영수증 발급은 어떻게 받나요?
                       </button>
                     </h2>
                   </div>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                     <div class="card-body">
                  무통장입금, 실시간 계좌이체로 결제시에만 현금영수증을 발급받으실 수 있으며
                           저희쪽 게시판/고객센터로 발급받으실 유형(개인/사업자)과 번호를 알려주시면
                           발행이 가능합니다. (매주 월요일에 순차적으로 접수되오니 확인 부탁드립니다.)       
                     </div>
                   </div>
                 </div>
                 <div class="card">
                   <div class="card-header" id="headingThree">
                     <h2 class="mb-0">
                       <button class="btn btn-link collapsed" style="color:#5A5A5A; type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          [배송문의]교환/ 반품비는 어떻게 되나요?
                       </button>
                     </h2>
                   </div>
                   <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                     <div class="card-body">
                     교환택배비는 상품 개수에 상관없이 한번에 보내주셨을 경우 5,000원입니다. 택배는 꼭 우체국 택배(1588-1300) 택배 착불로 보내 주시기 바랍니다.
                     (타택배 이용시 착불이용 불가합니다) 반품 택배비는 반품상품 제외하고 남아있는 금액이 7만원 이상일시 2,500원이며,
                     7만원 미만일시에는 5,000원 입니다. 
                     </div>
                   </div>
                 </div>
                   <div class="card">
                   <div class="card-header" id="headingFour">
                     <h2 class="mb-0">
                       <button class="btn btn-link collapsed"style="color:#5A5A5A; type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                         [배송문의] 교환/반품 하고 싶습니다.
                       </button>
                     </h2>
                   </div>
                   <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                     <div class="card-body">
                      청약철회 (교환/반품) 의사를 게시판이나 고객센터로 먼저 밝혀주신 후 상품을 보내주셔야 합니다.변심에 의한 교환/반품시 배송비는 고객님부담 입니다.
                              주문하실 때 보내드린 반품봉투에 교환일 때는 받으신 제품, 교환 원하는 제품 (타 제품교환 시엔 제품금액을 기재)을 자세히 적으시고 교환배송비(5천 원)와  
                              타상품교환 추가금액은 동봉 또는 온라인으로 입금해 주시고,내용 기재는 주문하실 때 주문내용과 이름, 휴대폰 번호가 일치하셔야 신속한 처리가 됩니다. 
                              제품 받으신 봉투나 박스에 제품과 함께 반송준비를 마치신후 그 다음우체국 택배(1588-1300)로 접수해 주시기 바랍니다.
                       ** 반품주소: 역삼역 5분거리 주소몰라 5층 "KH352 Class" 무통장환불은 계좌명, 은행, 계좌번호를 꼭 기재해 주셔야 빠른 처리가 이루어집니다. 
                       (고객님의 계좌는 저희 쪽에 노출되지 않습니다.^^) 보내주실때 주문자나 입금자명으로 환불계좌를 꼭 적어주셔야 합니다. 
                       *****타 택배 이용 시엔 꼭 선불로 보내 주시기 바랍니다.착불로 보내시면 분실, 반송될 우려가 있습니다 ***** )       
                     </div>
                   </div>
                 </div>
                 
                   <div class="card">
                   <div class="card-header" id="headingFive">
                     <h2 class="mb-0">
                       <button class="btn btn-link collapsed" style="color:#5A5A5A; type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                          [상품문의] 같이 코디된 상품은 언제 업데이트 되나요?
                       </button>
                     </h2>
                   </div>
                   <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                     <div class="card-body">
                  보통 1주일 이내 업데이트 되며,2주 이내 업데이트 되지 않는 상품의 경우
                       개인 소장품이거나 제작 도중 품절되어 출시가 어려운 상품일 수 있습니다.
                       자세한 문의사항 고객센터(1600-0000) 연락 주세요.           
                     </div>
                   </div>
                 </div>
                        <div class="card">
                <div class="card-header" id="headingSix">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" style="color:#5A5A5A; type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                      [입금문의] 입금했는데 결제완료 처리가 안돼요.
                    </button>
                  </h2>
                </div>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
                  <div class="card-body">
                     입금확인이 안되는 경우('무통장입금'만 해당) 1) 입금자명이 다를 경우   <br>
                     (주문자와 입금자가 다를 경우 꼭 입금자명으로로 입금하셔야 합니다.)2) 주문 시 선택하신 입금은행과 입금시 은행이 다를 경우 <br>
                     (예 : 주문시 국민은행을 선택했는데 신한은행으로 입금할 경우 안돼요.) 3) 주문금액과 동일하지 않을 경우 <br>
                     (예 : 주문금액 10,00원인데 11,000원으로 입금하실 경우)   4) 같은 주문서가 중복으로 존재할 경우 <br>
                     (기존 주문을 취소하지 않고 또다시 동일한 주문을 했을 경우)5) 주문하시고 일주일 이내에 입금하지 않았을 때 <br>
                     *위 1~5항 중에 하나라도 해당하시면 게시판/고객센터로 말씀해주세요.       
                  </div>
                </div>
              </div>
               </div>
                      
                    </div>
                     <div class="tab-pane fade" id="nav-notice" role="tabpanel" aria-labelledby="nav-notice-tab">
                       1. 상품이미지 정책 국내 도매처 이미지, 해외 도매 거래처 이미지의 사용을 제한하며 입점 취소사유가 될 수 있습니다. <br>
                     2. 전 상품 무료배송 정책 Recloset은 현재 전 상품 무료배송 정책을 시행하고 있습니다. Recloset에서의 판매상품은 100% 무료배송으로 진행해 주셔야 합니다. (배송비 업체 부담) <br>
                     3. 전 상품 가격정찰제브랜디에서의 판매상품은 자사몰의 최종 판매가와 가격이 동일해야 합니다. 월 1회 이상 판매가 모니터링을 실시하여 가격이 상이할 경우, 브랜디 내 상품 노출이 제한됩니다.<br>
                     4. 정산 정책 Recloset은 월 2회 정산되며, 판매 수수료와는 별도로 서버 이용료 (45,000원/월 2회 분납, VAT 별도)가 부과됩니다. <br><br>
                     
                     dotoli4058@nate.com <-- 확인 후 메일 주세요. <br><br> 
                     
                     !!--------------꼭 상세 내용을 확인 하신 뒤 입점 신청해주세요~^.^----------------------!!
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
   function postForm(){
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
               var $trHelpAndFAQ = $('<tr class="showHome" id="' + data[i].qnaNo + '">');
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
            $(".showHome").on("click",function(){
 		       var qnaNo = $(this).attr("id");
 		       console.log("qnaNo="+ qnaNo);
 		       location.href = "${pageContext.request.contextPath}/help/helpView.do?no="+qnaNo;
 		    });
               $('.table-striped tr:nth-of-type(odd)').css('background-color', 'rgba(0,0,0,.05)');
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
               
               var $trPost = $('<tr class="showPost" id="' + data[i].psnaNo + '">');
               var $tdpsnano = $('<td>').text(data[i].psnaNo);
               var $tdpstitle = $('<td>').text(data[i].psTitle);
               var $tduserId = $('<td>').text(data[i].userId);
               var $tdpsdate = $('<td>').text(moment(data[i].psdate).format('YYYY-MM-DD'));
               
               $trPost.append($tdpsnano)
               .append($tdpstitle)
               .append($tduserId)
               .append($tdpsdate);
               
               $table.append($trPost);
            }
            $(".showPost").on("click",function(){
 		       var psnano = $(this).attr("id");
 		       console.log("psnano="+ psnano);
 		       location.href = "${pageContext.request.contextPath}/post/postView.do?no="+psnano;
 		    });
            $('#postCnt').text(data.length);
               $('.table-striped tr:nth-of-type(odd)').css('background-color', 'rgba(0,0,0,.05)');
            
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