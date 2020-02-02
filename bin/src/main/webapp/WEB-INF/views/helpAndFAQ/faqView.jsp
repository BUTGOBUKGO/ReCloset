<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="기본 페이지"/>
	</c:import>
		<style>
		div#board-container{width:950px; margin:0 auto; text-align:center;}
		div#board-container input, div#board-container select {margin-bottom:10px;}
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
		    <center>
		    <button class="btn btn-outline-info" type="button" onclick="location.href ='${pageContext.request.contextPath}/help.do'">리스트로</button>
		    <c:if test="${member.userNo eq helpandfaq.userNo}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href = '${pageContext.request.contextPath}/help/faqUpdateView.do?qnaNo=${helpandfaq.qnaNo}'">수정 페이지</button>
			</center>
			</c:if>
		</div>
		
		<br />
		<br />
		<br />
		<c:import url="../common/footer.jsp"/>
	</div>

</body>

	<script>
	function goHelpList(){
		
		location.href = "${pageContext.request.contextPath}/help/help.do";
	}
	
	function goHelpUpdate(){
		
		location.href = "${pageContext.request.contextPath}/help/faqUpdateForm.do?qnaNo=${HelpAndFAQ.qnaNo}";
	}
	
	</script>
		

</html>