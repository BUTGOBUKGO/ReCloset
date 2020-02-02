<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="상품 문의 상세보기 페이지"/>
	</c:import>
		<style>
		div#board-container{width:950px; margin:0 auto; text-align:center;}
		div#board-container input, div#board-container select {margin-bottom:10px;}
		
		#commenter-message{
		width: 780px;
      height: auto;
      background: center center no-repeat; /* This ruins default border */

      resize: none;
      color: black;
     
      overflow: auto;
		
		}
   
   #nameArea{
   margin-top:1rem;
    margin-left: 4rem;
   }
   
   h4{
    margin-left: 4rem;
    }
   .pcContentArea{
   	width: 600px;
      height: auto;
      background: center center no-repeat; /* This ruins default border */
	border: 1px solid black;
      resize: none;
      color: black;
      overflow: auto;
      text-align: left;
    margin-left: 8rem;
    margin-top:1rem;
   }
   
   .post-btn{
   margin-top:1rem;
   }
   
   .row{
   margin-top:2px;
   }
	</style>
</head>
<body class="animsition">


	<c:import url="../common/cart.jsp"/>
	<c:import url="../common/header.jsp"/>
	<br><br><br><br>
	<div id="container">
	
		
		<div id="board-container">
			<input type="text" class="form-control" placeholder="제목" name="qTitle" id="qTitle" value="${helpandfaq.qTitle}" readonly required>
			<input type="text" class="form-control" name="userId" value="${member.userId}" readonly required>
		
			
		   <div class="ContentArea" style="margin-top:20px;" name="qContent">     
		    ${helpandfaq.qContent}
		    </div>
		    
		    <br>
		  	<div>
		    <center><button class="btn btn-outline-info" type="button" onclick="location.href ='${pageContext.request.contextPath}/help.do'">리스트로</button>
		    <c:if test="${member.userNo eq helpandfaq.userNo}"> &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href = '${pageContext.request.contextPath}/help/faqUpdateView.do?qnaNo=${helpandfaq.qnaNo}'">수정 페이지</button>
			</c:if>
			</center>
			</div>
		    
               </div> <!-- board-container -->
		 <br />
		 <br />
		 <br />
		 
		  <c:if test="${!empty member }">
               <div class="container">
			<div class="comments-form">
                  <h4>Comment</h4>
                     <hr />
         		
                  <div class="comment-form-main">
                     <form action="${pageContext.request.contextPath}/comment/insertComment.do" onsubmit="return insertComment();">
                        <div class="row">
                              <input type="hidden" name="userNo" value="${member.userNo}"/>
                               <input type="hidden" name="qnaNo" value="${helpandfaq.qnaNo}" />
                             
                              
                           
                           <div class="col-md-8">
                              <div class="form-group">
                                 <textarea class="form-control" name="qcContent" placeholder="댓글을 입력해 주세요" id="commenter-message" class="cContent" cols="30" rows="2"></textarea>
                              </div>
                           </div>
                           <div class="col-md-4 post-btn">
                              <button class="btn btn-outline-info"><span>댓글 작성</span></button>
                           </div>
                        </div>
                        </form>
                        </div>
                        </div>
                        </div>
                     </c:if>
                     
                 </div>  
	
	
	
	
                  
               <div class="comments-form">
                 
                
                   <c:forEach var="hlist" items="${hlist}">
                  <div class="comment-form-main" >
                     
                        <div class="row" style="border:1px solid #dcdcdc">
                              <input type="hidden" name="userNo" value="${member.userNo}"/>
                              <input type="hidden" name="qnaNo" value="${helpandfaq.qnaNo}" />
                			
                			<div class="col-md-2">
                              <div class="form-group">
                                 <div class="pcnameArea" name="qc_name" id="nameArea">
                                		작성자 &nbsp;  ${member.userId}
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-7">
                              <div class="form-group">
                                 <textarea class="pcContentArea" name="qc_Content" id="${hlist.cNo }" readonly>${hlist.qcContent}</textarea>
                              </div>
                           </div>
                           <div class="col-md-3 post-btn">
                              <button class="btn btn-outline-info" type="button" onclick="updateReply(this);"><span>댓글 수정</span></button>
                           		&nbsp;&nbsp;
                              <button class="btn btn-outline-info delete" type="button" onclick="deleteReply(this);"><span>댓글 삭제</span></button>
                           </div>
                        </div>
                       
                        </div>
                      
                        </c:forEach>
                  </div>
           <!-- end container -->
		 
		 
		 
		<br />
		<br />
		<br />
               
		<c:import url="../common/footer.jsp"/>


</body>

	<script>
		var qnaNo = '${helpandfaq.qnaNo}';
		 // 댓글 수정 함수
	   function updateReply(obj){
	      // 현재 위치와 가장 가까운 textarea 가져오기
	      //console.log(obj);
	      var textArea = $(obj).parent().parent().find('[name="qc_Content"]');
	      
	      console.log(textArea.val().trim());
	      if(textArea.prop('readonly')){
	    	  textArea.prop('readonly', false);
	      } else {
	    	  textArea.prop('readonly', true);
	    	  $.ajax({
	              url : '${ pageContext.request.contextPath }/comment/updateComment.do',
	                data : {
	                   cNo : textArea.attr('id'),
	                   qnaNo : '${helpandfaq.qnaNo}',
	                   userNo : '${member.userNo}',
	                   qcContent : textArea.val().trim()
	                }, success : function(data){
	                   if(data != 0){
	                      alert("댓글 변경 성공!");      
	                   } else {
	                      alert("댓글 수정 실패!");
	                   }
	                }
	           });

	      }

	 }
	 
	   function deleteReply(obj){
		      var textArea = $(obj).parent().parent().find('[name="qc_Content"]');
		      console.log(textArea.val().trim());
		      $.ajax({
		         url : '${pageContext.request.contextPath}/comment/deleteComment.do',
		           data : {
		              cNo : textArea.attr('id')
		           }, 
		           success : function(data){
		              if(data != 0){
		                 alert("댓글 삭제 성공!");      
		                 textArea.parent().parent().parent('div').remove();
		                 $('[for=' + textArea.attr('id') + ']').remove();
		                
		              } else {
		                 alert("댓글 삭제 실패!");
		              }
		           }
		      });
	   }
	 
	 
	 
	 
	function insertComment(){
	       var qcContent = $('.qcContent').val().length;
	       
	       //console.log(cContent);
	       if (qcContent==0){
	          alert('댓글을 입력해주세요');
	          
	          return false;
	       }
	       
	       return true;
	    }
	
	
	
	
	
	
	
	
	function goHelpList(){
		
		location.href = "${pageContext.request.contextPath}/help/help.do";
	}
	
	function goHelpUpdate(){
		
		location.href = "${pageContext.request.contextPath}/help/faqUpdateForm.do?qnaNo=${HelpAndFAQ.qnaNo}";
	}
	
	</script>
		

</html>