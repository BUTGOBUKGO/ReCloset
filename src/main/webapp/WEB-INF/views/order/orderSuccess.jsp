<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="결제 완료 페이지"/>
	</c:import>
	<style>
		button { 
			
			height: 30px;
			color: white;
			background-color: #9EA6E1;
			cursor: pointer;
	    }
	    #orderTotal {
	    	padding-bottom: 10px;
	    	height: 100px;
	    }
	</style>
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br>
	
	<!-- 상세 메뉴 -->
<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Paying Order
			</span>
		</div>
	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<div class="container">
		<div class="row">
		
			<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="" >
						<h2>주문이 정상적으로 완료되었습니다.</h2><br />
					</div>
					<hr style="width:550px;"/>
					<br /><br />
					<table id="orderDetail">
						<tr style="height:50px;">
							<td style="width: 120px;"><strong>주문번호</strong></td>
							<td style="color: #9EA6E1;"><h3><strong>${order.orderNo}</strong></h3></td>
						</tr>
						<tr style="height:130px;">
							<td><strong>배송지정보</strong></td>
							<td>
								${delivery.receiver } <br />
								${delivery.phone } <br />
								${delivery.zipCode } <br />
								${delivery.address1 } <br />
								${delivery.address2 }
							</td>
						</tr>
						<tr style="height:80px;">
							<td><strong>신용카드</strong></td>
							<td>
								일시불 <br />
								승인일시 : &nbsp; ${order.oDate }
							</td>
						</tr>
					</table>
					<div>
						<!-- 쿠폰 사용/적립 내역 -->
					</div>
					<br /><br /><br />
					<div align="center">
						<button style="width: 110px;" onclick="homeView();">메인화면</button> &nbsp;&nbsp; 
						<button style="width: 180px;">마이페이지&gt;주문내역</button>
					</div>
				</div>
			</div>
			
			<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
				<div class="bor10 p-lr-40 p-t-30 p-b-40">
					<h4 class="mtext-109 cl2 p-b-30">
						Order Totals
					</h4>
						
						
					<table id="orderinfo" style="width:400px;">
						<c:forEach var="goods" items="${goodsList }">
							<tr id="orderTotal">
								<td style="width:30%;"><img src="${ pageContext.request.contextPath }/resources/uploadimg/${goods.changeName }" style="width:120px;" ></td>
	   							<td style="width:45%; text-align:center;">${goods.gName }</td>
	   							<td style="width:25%; text-align:right;"><strong>${goods.gPrice }</strong>&nbsp;원</td>
	   						</tr>
						</c:forEach>
					</table>

					<br />
					<br />
					<br />

					<div class="flex-w flex-t bor12 p-b-13">
						<div class="size-208">
							<span class="stext-110 cl2">
								Subtotal:
							</span>
						</div>

						<div class="size-209">
							<span class="mtext-110 cl2 subtotalPrice">
								${order.totalPrice - 2500} &nbsp; 원
							</span>
						</div>
					</div>

					<div class="flex-w flex-t bor12 p-t-15 p-b-13">
						<div class="size-208 w-full-ssm">
							<span class="stext-110 cl2">
								Shipping:
							</span>
						</div>

						<div class="size-209">
							<span class="mtext-110 cl2">
								2500 원
							</span>
						</div>
					</div>

					<div class="flex-w flex-t p-t-27 p-b-33">
						<div class="size-208">
							<span class="mtext-101 cl2">
								Amount of payment:
							</span>
						</div>

						<div class="size-209 p-t-1">
							<span class="mtext-110 cl2 totalPrice">
								${order.totalPrice } &nbsp; 원
							</span>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
					
		
	
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		function homeView(){
			location.href='${pageContext.request.contextPath}';
		}
		function orderHistory(){
			location.href='${pageContext.request.contextPath}/product/orderHistory.do';
		}
		
		
	</script>
	
</body>
</html>