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
		div#update-container{width:400px; margin:0 auto; text-align:center;}
		div#update-container input, div#update-container select {margin-bottom:10px;}
	</style>
</head>
<body class="animsition">


	<c:import url="../common/cart.jsp"/>
	<c:import url="../common/header.jsp"/>
	<br><br><br><br>
	<div id="container">
		
		<div id="board-container">
			<input type="text" class="form-control" placeholder="제목" name="qTitle" id="qTitle" value="${HelpAndFAQ.qTitle }" required>
			<input type="text" class="form-control" name="userId" value="${HelpAndFAQ.userId}" readonly required>
		
			
		    <textarea class="form-control" name="qContent" placeholder="내용" required>${HelpAndFAQ.qContent}</textarea>
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/HelpAndFAQ/help.do'">리스트로</button>
		    <c:if test="${member.userId eq HelpAndFAQ.userId}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/HelpAndFAQ/faqUpdateForm.do?qnaNo=${HelpAndFAQ.qnaNo}'">수정 페이지</button>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
	
	
</body>
</html>