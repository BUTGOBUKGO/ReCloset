<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="좋아요 리스트 페이지"/>
	</c:import>
	<style>
		#like {
		background: white;
    	border: 1px solid white;
	  	font-size: 30px;
	}
	#likeheart {
		width: 80px;
	  	height: 100px;
	  	color: #ff666f;
	  	cursor: pointer;
	  	font-size: 40px; 	  
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
				Like
			</span>
		</div>
	</div>
	

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" action="${pageContext.request.contextPath}/order/orderForm.do">
		<input type="hidden" name="userNo" value="${member.userNo }"/>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart cart-list-content">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2">Detail</th>
									<th class="column-3"></th>
									<th class="column-4">Total</th>
									<th class="column-5"></th>
								</tr>
								
							</table>
						</div>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Apply coupon
								</div>
							</div>

							
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</form>	
	<c:import url="../common/footer.jsp"/>
	
	<script>
	
	
	
	$(function(){
		
		var userNo = "${member.userNo}";
		
 		 $.ajax({
   	      url: "${pageContext.request.contextPath}/like/myLikeCount.do",
   	      data: {
   	         userNo : userNo,
   	      },
   	      success: function(data){
   	    	  
   	    	  console.log("datadatadatadatadatadatadata : "+data);

   	         $('.go-like-List').attr("data-notify", data);

   	      }
   	   });
 	})
	
	
	
		
		$(function(){
			if($('.subtotalPrice').text() == "0 원"){
				$('#submitBtn').attr('disabled', true);
			}
		});
	
	
		$(function(){
			var userNo = '${member.userNo}'
			$.ajax({
				url: "${pageContext.request.contextPath}/like/likeList.do",
	    		dataType: "json",
	    		data: { userNo : userNo },
	    		success : function(data){
	    			console.log(data);
	    			if(data.length == 0) {
	    			
	    			} else {
	    				// $('.cart-list-content').empty();
		    			for(var i in data){
		    				console.log(data);
		    				var innerDiv1 = '<tr class="table_row">'
		    							+ '<input type="hidden" name="goodsNo" value="' + data[i].goodsNo + '">'
		    							+ '<td class="column-1">'
		    							+ '<div class="how-itemcart1">'
		    							+ '<img src="${ pageContext.request.contextPath }/resources/uploadimg/' + data[i].changeName + '" alt="IMG">'
		    							+ '</div>'
		    							+ '</td>'
		    							+ '<td class="column-2">' + data[i].gName + '</td>'
		    							+ '<td class="column-3"> x &nbsp; 1 </td>'
		    							+ '<td class="column-4">' + data[i].gPrice + '&nbsp;원</td>'
		    							+ '<td class="column-5">'
		    							+ '<button type="button" onclick="deleteCartOne(this);"><i class="zmdi zmdi-delete zmdi-hc-2x"></i></button>'
										+ '</td>'
										+ '</tr>';
							$('.cart-list-content').append(innerDiv1);
		    			}
		    			var totalAmount = 0;
	    				for(var i in data){
		    				totalAmount += data[i].gPrice;
		    			}
	    				$('.subtotalPrice').html(totalAmount + "&nbsp;원");
	    				
	    				var totalPrice = totalAmount + 2500;
	    				$('.totalPrice').html(totalPrice + "&nbsp;원");
	    			}
   				}
			});
 	    });
		
		
		function deleteCartOne(obj){
			var userNo = '${member.userNo}';
			var sel = confirm("좋아요 리스트에서 해당 상품을 삭제하시겠습니까?");
			if(sel == true){
				var goodsNo = $(obj).parent().siblings('input').val();
				$.ajax({
					url: "${pageContext.request.contextPath}/like/likeDelete.do?userNo=${member.userNo}",
		    		dataType: "json",
		    		data: { userNo : userNo,
		    				goodsNo : goodsNo },
		    		success : function(data){
		    			console.log(data);
		    			if(data == 1){
		    				var origin = $('.subtotalPrice').text();
							var minus = $(obj).parent().siblings().eq(4).text();
								    			
							origin = origin.replace(/[^0-9]/g,"");
							minus = minus.replace(/[^0-9]/g,"");
							var subtotal = origin-minus
		    				
		    				$('.subtotalPrice').html(subtotal + "&nbsp;원");
		    				$('.totalPrice').html(subtotal + 2500 + "&nbsp;원");
		    				
		    				$(obj).parent().parent().remove();
		    			}
		    			$.ajax({
							url: "/recloset/like/likeNumber.do",
				    		dataType: "json",
				    		data: { userNo : userNo },
				    		success : function(data){
				    			console.log(data)
				    			$('.go-like-List').attr("data-notify", data);
				    		}
						});
		    		}
		    	});
				
			}
		}
		
	</script>
	
</body>
</html>