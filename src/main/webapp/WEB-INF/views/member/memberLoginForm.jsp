<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/commonUtil.jsp">
	<c:param name="titleName" value="로그인 페이지" />
</c:import>
</head>
<body class="animsition">
	<c:import url="../common/header.jsp" />
	<c:import url="../common/cart.jsp" />

	<br>
	<br>
	<br>

	<!-- 상세 메뉴 -->
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04"> 대 주제
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> 소 주제 </span>
		</div>
	</div>

	<!-- Content page -->
	<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
		<form action="memberLogin.do" method="post">
			<h4 class="mtext-105 cl2 txt-center p-b-25">Login Member</h4>
			<div
				class="bor10 p-lr-10 p-t-30 p-b-50 m-lr-0-xl p-lr-15-sm"
				style="background : lightcoral;">
				<div class="row p-b-25">
					<div class="col-2"></div>
					<div class="col-2 p-b-7">
						<label class="stext-102 cl3" for="userId" style="color: white;">User ID</label>
					</div>
					<div class="col-6 p-b-7" id="userId-container">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" id="userId_" type="text" name="userId" placeholder="Your Id here">
							<img class="how-pos4 pointer-none" src="${pageContext.request.contextPath }/resources/images/icons/icon-userId.png" style="width : 22px; height: 22px; top : 15px;" alt="ICON">
					</div>
					<div class="col-2 p-b-7"></div>

					<div class="col-2"></div>
					<div class="col-2 p-b-7">
						<label class="stext-102 cl3" for="userPwd" style="color: white;">Password</label>
					</div>
					<div class="col-6 p-b-7">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" id="userPwd_" type="password" name="userPwd" placeholder="Your Password here">
							<img class="how-pos4 pointer-none" src="${pageContext.request.contextPath }/resources/images/icons/icon-userpwd.png" style="width : 22px; height: 22px; top : 15px;" alt="ICON">
					</div>
					<div class="col-2 p-b-7"></div>
					
					<div class="col-2"></div>
					
					<div class="col-8 p-b-7 m-t-25">
						<button type="submit"
							class="stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
							로그인</button>
						&nbsp;&nbsp;
						<button type="button"
							class="stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10"
							onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">
							회원가입</button>
					</div>
					<div class="col-2 p-b-7"></div>
				</div>

			</div>
		</form>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>