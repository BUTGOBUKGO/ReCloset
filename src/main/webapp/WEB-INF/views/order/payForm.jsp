<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="결제 페이지"/>
	</c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<section style="text-align:center;">
	<h1>결제 중입니다...</h1> <br />
	<h2>결제 성공 시 주문 완료 화면으로 넘어갑니다. </h2>
	</section>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	
	<c:import url="../common/footer.jsp"/>
	
	
	<script>
		var totalPrice = '${order.totalPrice}';
	    $(function(){
	        var IMP = window.IMP;
	        IMP.init("imp82819471"); 
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : 'Recloset 결제',
	            amount : totalPrice
	        }, function(rsp) {
	            if ( rsp.success ) {
	                jQuery.ajax({
	                    url: "/payments/complete", 
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                    } 
	                });
	                //성공시 이동할 페이지
	                location.href = '${pageContext.request.contextPath}/order/orderSuccess.do?userNo=${ member.userNo }';
	            } else {
	                msg = '결제에 실패하였습니다. ';
	                msg += '\n에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                alert(msg);
	                location.href = '${pageContext.request.contextPath}/order/orderForm.do?userNo=${ member.userNo }';
	            }
	        });
	    });
    
    </script>
	
</body>
</html>