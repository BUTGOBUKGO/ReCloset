<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head> 
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="주문 페이지"/>
	</c:import>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<style>
	span {
		margin-right: 20px;
		/* margin-bottom: 10px; */
	}
	div>input {
		border: 1px solid #e6e6e6;
		height: 35px;
	}
	#orderPhone, #phone{
		width: 250px;
	}
	#addBtn {
		width: 110px;
		height: 35px;
		color: white;
		background-color: #9EA6E1;
		cursor: pointer;
	}
	#zipBtn {
		width: 130px;
		height: 35px;
		color: white;
		background-color: #9EA6E1;
		cursor: pointer;
	}
	 .phone>input {
	 	width: 50px;
		display: inline-block;
	 }
	 .add {
	 	margin-bottom: 10px;
	 }
	 textarea {
		padding: 5px 10px;
		border: 1px solid #e6e6e6;
		resize: none;
	}
	
	
		/* The Modal (background) */
    .addModal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .addModal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */                          
    }
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    #address>tr {
    	height: 90px;
    }
    .addSelectBtn {
		width: 40px;
		height: 30px;
		color: white;
		background-color: #9EA6E1;
		cursor: pointer;
    	
    }
    #orderTotal {
    	padding-bottom: 10px;
    	height: 100px;
    }
    #theadtr>th {
    	text-align: center;
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
				Order Form
			</span>
		</div>
	</div>
		

	<!-- Shoping Cart -->
	<form action="${pageContext.request.contextPath}/order/payForm.do" class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="infocheck" >
							<h3>주문자 정보</h3><br />
							<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>이름</span>								
								<div class="">
									<input type="text" id="orderName" name="orderName" value="${member.userName}" readonly>
								</div>
							</div>
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>연락처</span>							
								<div class="">
									<input type="text" id="orderPhone" name="orderPhone" value="${member.phone}" readonly>
								</div>
							</div>
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>주소</span>							
								<div class="">
									<input type="text" class="orderZipCode add" value="${member.zipCode}" readonly>
									<input type="text" class="orderAddress1 add" value="${member.address1 }"style="width:450px;" readonly>
									<input type="text" class="orderAddress2 add" value="${member.address2 }"style="width:350px;" readonly>
								</div>
							</div>
						</div>
						
						<br /><br /><br />
						
						
						
						
						<h3>배송지 정보</h3><br />
							<span>주문자 정보와 동일한 경우 체크 &nbsp;<input type="checkbox" id="addCheck" style="display:inline-block;"/></span>
							<button type="button" id="addBtn">최근 배송지</button>
							
							<!-- 모달 시작했다 -->
						    <div id="myAddModal" class="addModal">
						 
						      <div class="addModal-content" style="width: 800px; height:420px;">
						        <span class="close">&times;</span>                                                               
						        <h3 style="text-align:center;">최근 배송지 목록</h3>
						        <br /><br />
						        <table id="recentlyAddress" style="text-align: center; width:750px;">
						        
				                    <thead>
					                    <tr id="theadtr" style="border-bottom:1px solid black; height: 40px;">
					                        <th>수령자</th>
					                        <th colspan="3">주소</th>
					                        <th colspan="2">연락처</th>
					                        <th>선택</th>
					                    </tr>
				                    </thead>
				                    <tbody id="address">
				                    
				                    	<c:forEach var="delivery" items="${deliveryList }">
				                    		<tr>
					                            <td>
					                                <strong class="receiverName">${delivery.receiver }</strong>
					                            </td>
					                            <td colspan="3">
					                                <span class="rZipCode">${delivery.zipCode }</span><br />
					                                <span class="rAddress1">${delivery.address1 }</span><br />
					                                <span class="rAddress2">${delivery.address2 }</span><br />
					                            </td>
					                            <td colspan="2">
					                            	<span class="telNo">${delivery.phone }</span>
					                            	<!-- <span class="telNo2">010-2999-5433</span> -->
					                            </td>
					                            <td>
					                                <button type="button" class="addSelectBtn" onclick="addSelect(this);">선택</button>
					                            </td>
					                        </tr>
				                    	</c:forEach>
				                    
				                     </tbody>
						        </table>
						      </div>
						    </div>
							<!-- 모달 끝났다 -->
							
							
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>이름</span>								
								<div class="">
									<input type="text" id="receiverName" name="receiver">
								</div>
							</div>
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>연락처</span>							
								<div class="phone">
									<input type="text" id="phone" name="phone">
								</div>
							</div>
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>주소</span> 								
								<div class="">
									<input class="add r1" id="zipCode" type="text" name="zipCode" onclick="addrSearch();" 
									       placeholder="클릭하세요!" style="background: lightgoldenrodyellow; cursor:pointer;" readonly>
									<input class="add" id="address1" type="text" name="address1" placeholder="시군구" style="width:450px;">
									<input class="add" id="address2" type="text" name="address2" placeholder="상세 주소" style="width:350px;">
								</div>
							</div>
						</div>
						<br />
						<div class="">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<span>배송 메시지</span>							
								<div class="">
									<textarea name="dMessage" id="dmessage" cols="50" rows="5"></textarea>
								</div>
							</div>
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
		    					<td style="width:30%;"><img src="${ pageContext.request.contextPath }/resources/uploadimg/${goods.changeName }" style="width:120px;"></td>
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
									${subtotal} 원
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
									Total:
								</span>
							</div>
							<c:set var="totalPrice" value="${subtotal + 2500}" />
							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2 totalPrice">
									${totalPrice } 원
								</span>
								<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice }" />
							</div>
						</div>
						
						<br />
						<br />
						
						<button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Proceed to Checkout
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>	
	<c:import url="../common/footer.jsp"/>
	
	<script>
	
		$(function(){
			$('#addCheck').change(function(){
				
				if($('#addCheck').is(':checked')){
					$('#receiverName').val($('#orderName').val());
					$('#phone').val($('#orderPhone').val());
					$('#zipCode').val($('.orderZipCode').val());
					$('#address1').val($('.orderAddress1').val());
					$('#address2').val($('.orderAddress2').val());
					
				} else {
					$('#receiverName').val("");
					$('#phone').val("");
					$('#zipCode').val("");
					$('#address1').val("");
					$('#address2').val("");
				}
			});
		});

		
			/* $(function(){
			var userNo = '${member.userNo}';
			$.ajax({
				url: "${pageContext.request.contextPath}/cart/cartList.do",
	    		dataType: "json",
	    		data: { userNo : userNo },
	    		success : function(data){
	    			console.log(data);
	    			if(data.length == 0) {
	    			
	    			} else {
	    				$('#orderinfo').empty();
	    				var subtotal = 0;
		    			for(var i in data){
		    				var innerDiv = '<tr id="orderTotal">'
		    							+ '<td style="width:30%;"><img src="/recloset/images/item-cart-01.jpg" ></td>'
		    							+ '<td style="width:45%;">' + data[i].gName + '</td>'
		    							+ '<td style="width:25%; text-align:right;"><strong>' + data[i].gPrice + '</strong>&nbsp;원</td>'
		    							+ '</tr>';
		    				$('#orderinfo').append(innerDiv);
		    				subtotal += data[i].gPrice;
		    			}
		    			$('.subtotalPrice').html(subtotal + "&nbsp;원");
		    			
		    			$('.totalPrice').html((subtotal + 2500) + "&nbsp;원");
		    			$('#totalPrice').val(subtotal + 2500);
	    			}
	    		}
			});
		});	 */
	
	</script>
	
	<script>
	    $('#addBtn').click(function(){
	    	$('.addModal').css('display', 'block');
	    });
	
	    $('.close').click(function() {
	    	$('.addModal').css('display', 'none');
	    });
	
	</script>
	
	<script>
		function addSelect(obj){
			var name = $(obj).parent().siblings().eq(0).children().text();
			
			var postcode = $(obj).parent().siblings().eq(1).children('span').eq(0).text();
			var address = $(obj).parent().siblings().eq(1).children('span').eq(1).text();
			var detail = $(obj).parent().siblings().eq(1).children('span').eq(2).text();

			var phone = $(obj).parent().siblings().eq(2).children().eq(0).text();
			// var tel2 = $(obj).parent().siblings().eq(2).children().eq(1).text();
			
			
			
			$('#receiverName').val(name);
			
			$('#phone').val(phone);
			
			$('#zipCode').val(postcode);
			$('#address1').val(address);
			$('#address2').val(detail);
			
			$('.addModal').css('display', 'none');
		}
	</script>
	
	<script>
		function paygo(){
			$('#orderForm').submit();
			
			//location.href='${pageContext.request.contextPath}/product/payGo.do';
		}
		
		// 참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$('#zipCode').val(data.zonecode); //5자리 새우편번호 사용

							$('#address1').val(fullAddr);

							// 커서를 상세주소 필드로 이동한다.
							$('#address2').focus();
						}
					}).open();
		};
		
	</script>
	
</body>
</html>