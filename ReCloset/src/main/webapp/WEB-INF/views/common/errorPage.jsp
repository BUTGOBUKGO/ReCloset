<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="에러 페이지"/>
	</c:import>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/error.css" />
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br>
	<div class="error-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="error-text">
                    <h1 class="error">404 Error</h1>
                    <div class="im-sheep">
                        <div class="top">
                            <div class="body"></div>
                            <div class="head">
                                <div class="im-eye one"></div>
                                <div class="im-eye two"></div>
                                <div class="im-ear one"></div>
                                <div class="im-ear two"></div>
                            </div>
                        </div>
                        <div class="im-legs">
                            <div class="im-leg"></div>
                            <div class="im-leg"></div>
                            <div class="im-leg"></div>
                            <div class="im-leg"></div>
                        </div>
                    </div>
                    <h4>Oops! This page Could Not Be Found!</h4>
                    <p>Sorry bit the page you are looking for does not exist, have been removed or name changed.</p>
                    <a href="<?=base_url()?>" class="btn btn-primary btn-round">Go to homepage</a>
                </div>
            </div>
        </div>
    </div>
</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>