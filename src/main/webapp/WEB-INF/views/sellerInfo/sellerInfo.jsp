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
		
		#addBtn {
			width: 160px;
			height: 35px;
			color: white;
			background-color: #9EA6E1;
			cursor: pointer;
			margin-bottom: 20px;
			margin-left: 20px;
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
		
		#theadtr>th {
    		text-align: center;
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
     #address>tr {
    	height: 90px;
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
			<a href="/" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Product
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Seller Page
			</span>
		</div>
	</div>
	
	<br />
	<br />
	<br />
	<br />
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background: #9EA6E1;">
		<h2 class="ltext-105 cl0 txt-center">
			${seller.marketname } <!-- 상호명으로 바꾸기 -->
		</h2>
	</section>
	
	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!--  -->
						

						<div class="p-t-32">
							
							<h4 class="ltext-109 cl2 p-b-28">
								Review
							</h4>
							<br />
							<div>
								<ul id="reviewList">
								<c:forEach var="review" items="${reviewList }">
									<li class="flex-w flex-t m-b-12" style="display:inline;">
										<div class="" style="float:left;">
										<img src="${ pageContext.request.contextPath }/resources/uploadimg/${review.changeName }" style="width:120px;">
										</div>
										<div class="header-cart-item-txt p-t-8" style="padding-left:150px; padding-bottom:30px;">
											<span class="header-cart-item-name trans-04" style="font-size:17px;">${review.rTitle } &nbsp; ${review.ratingStar }</span>
											<span class="header-cart-item-info m-b-18" >${review.userId } &nbsp;|&nbsp; ${review.rDate } &nbsp;&nbsp;&nbsp; ${review.gName}   &nbsp;|&nbsp; ${review.gColor},${review.gSize}  &nbsp;|&nbsp; ${review.gPrice} </span>
											<p class="header-cart-item-name trans-04" style="font-size:16px; padding-left:20px;">${review.rContent }</p>
										</div>
									</li>
									<hr />
								</c:forEach>
								</ul>
							</div>
						</div>

						<!-- Trigger/Open The Modal -->
    
 
    <!-- The Modal -->
    <div id="myAddModal" class="addModal">
 
      <!-- Modal content -->
      <div class="addModal-content" style="width: 650px; height:auto;">
        <span class="close">&times;</span>                                                               
        
        <h3 style="text-align:center;">주문내역 목록</h3>
        <br /><br />
        <table id="recentlyAddress" style="text-align: center; width:600px;">
        
                  <thead>
                   <tr id="theadtr" style="border-bottom:1px solid black; height: 40px;">
                       <th>주문번호</th>
                       <th>상품명</th>
                       <th>총금액</th>
                       <th>선택</th>
                   </tr>
                  </thead>
                  <tbody id="address">
                  
                  	<c:forEach var="goods" items="${goodsList }">
                  		<tr>
                           <td>
                          		<input type="hidden" id="orderGoodsNo" name="orderGoodsNo" value="${goods.orderGoodsNo }"/>
                               <strong class="receiverName" name="orderNo" >${goods.orderNo}</strong><br />
                               <p>${goods.oDate }</p>
                           </td>
                           <td>
                               <span class="rZipCode">${goods.gName}</span><br />
                               <span class="rAddress1">${goods.gColor}  |  ${goods.gSize}</span>
                           </td>
                           <td>
                           	${goods.gPrice}
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
					
						<div class="p-t-100">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>
							<div id="selectOrderGoods" style="display:inline-block;">
								<input type="hidden" id="userNo" name="userNo" value="${seller.userNo} " />
								<input type="text" class="stext-111 cl2 plh3 p-lr-18 p-tb-15" name="orderGoods" id="orderGoods" placeholder="Goods..."
										style="border:1px solid #d9d9d9; width:300px; height:40px; 
										padding-left:20px; float:left;" readonly />&nbsp;
	
								<button type="button" id="addBtn">Select Ordered Goods</button><br />
							</div>
								
							<div style="display:inline-block; margin-bottom: 10px;">
								<input class="stext-111 cl2 plh3 p-lr-18 p-tb-15"
										type="text" name="rTitle" id="rTitle" placeholder="Title..." 
										style="border:1px solid #d9d9d9; width:500px; height:40px; float:left;"/>&nbsp;&nbsp;
								<select id="rating" name="rating" style="border:1px solid #d9d9d9; width:120px; height:40px;">
									  <option value='' selected>-- 별점선택 --</option>
									  <option value='1'>★☆☆☆☆</option>
									  <option value='2'>★★☆☆☆</option>
									  <option value='3'>★★★☆☆</option>
									  <option value='4'>★★★★☆</option>
									  <option value='5'>★★★★★</option>
								</select>
							</div>
							<br />
							<div class="bor19 m-b-20">
								<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="rContent" id="rContent" placeholder="Comment..."></textarea>
							</div>
							
							<button type="button" id="addBtn" style="width:110px;" onclick="addReview();">Add Review</button>
								
							
						</div>
						
						
						
						
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="of-hidden pos-relative">

						<div class="p-t-55">
							<h4 class="mtext-113 cl2 p-b-12">
								판매자 정보
							</h4>
							
							<hr /><br />
							
							
							<span class="stext-116 cl8 hov-cl1 trans-04">
								판매자 ID : ${seller.userId } <br /><br />
								평균 별점 : ${ratingAverage }  <br /><br />
								판매자홈 : www.recloset.com/ ${member.userId} <br />
							</span>
							
							<hr /><br />

							
						</div>

						<div class="p-t-65">
							<h4 class="mtext-112 cl2 p-b-33">
								Featured Products
							</h4>

							<ul>
							<c:forEach var="sellerGoods" items="${sellerGoodsList }">
								<li class="flex-w flex-t p-b-30">
									<a class="size-214 m-r-20">
										<img src="${ pageContext.request.contextPath }/resources/uploadimg/${sellerGoods.changeName }" style="width:120px;">
									</a>

									<div class="size-215 flex-col-t p-t-8" style="padding-left:50px;">
										<a class="stext-116 cl8 hov-cl1 trans-04">
											${sellerGoods.gName} 
										</a>

										<span class="stext-116 cl6 p-t-20">
											${sellerGoods.gPrice }
										</span>
									</div>
								</li>
								<br />
							</c:forEach>
								
							</ul>
							<div style="text-align:right; color:green; cursor:pointer;">
								<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}"><u>more</u></a>
							</div>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-20">
								Archive
							</h4>

							<ul>
								<li class="p-b-7">
									<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}&cCode=1" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Fashion Item
										</span>

										<span>
											(9)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}&cCode=2" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Accessories
										</span>

										<span>
											(39)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}&cCode=3" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Women
										</span>

										<span>
											(29)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}&cCode=4" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Men
										</span>

										<span>
											(35)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="${pageContext.request.contextPath }/sellerProductList.do?userNo=${seller.userNo}&cCode=5" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Etc
										</span>

										<span>
											(22)
										</span>
									</a>
								</li>

								</ul>
						</div>

						
					</div>
				</div>
			</div>
		</div>
		
		
		
	</section>	
	<c:import url="../common/footer.jsp"/>
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
				var gName = $(obj).parent().siblings().eq(1).children().eq(0).text();
				var gDetail = $(obj).parent().siblings().eq(1).children().eq(2).text();
				
				var innerVal = gName + "(" + gDetail + ")";
				
				$('#orderGoods').val("");
				$('#orderGoods').val(innerVal);
				
				var orderNo = $(obj).parent().siblings().eq(0).children().eq(1).text();
				var orderGoodsNo = $(obj).parent().siblings().eq(0).children().eq(0).val();
				var innerDiv = '<input type="hidden" id="orderNo" name="orderNo" value="' + orderNo + '" /><br />'
							+ '<input type="hidden" id="orderGoodsNo" name="orderGoodsNo" value="' + orderGoodsNo + '" />';
							
				$('#selectOrderGoods').append(innerDiv);
				
				$('.addModal').css('display', 'none');
			}
		
		</script>
		
		<script>
			function addReview(){
				
				var orderNo = $('#orderNo').val();
				var orderGoodsNo = $('#orderGoodsNo').val();
				var rTitle = $('#rTitle').val();
				var rContent = $('#rContent').val();
				var rating = $('#rating').val();
				
				if($('#orderGoods').val() == ""){
					alert("주문하신 상품을 선택하세요.");
					$('#orderGoods').focus();
				} else if ($('#rTitle').val() == ""){
					alert("제목을 입력하세요.");
					$('#rTitle').focus();
				} else if ($('#rating').val() == ""){
					alert("별점을 선택하세요.");
					$('#rating').focus();
				} else if ($('#rContent').val() == ""){
					alert("내용을 입력하세요.");
					$('#rContent').focus();
				} else {
					
					$.ajax({
						url: "${pageContext.request.contextPath}/addReview.do",
			    		dataType: "json",
			    		data: { orderNo : orderNo,
			    				orderGoodsNo : orderGoodsNo,
			    				rTitle : rTitle,
			    				rating : rating,
			    				rContent : rContent
			    		}, success : function(data){
			    			if(data != null){
			    				location.href = "${pageContext.request.contextPath}/sellerInfo.do?userId=${seller.userId }";
			    			}
			    		}
					});
					
				}
			}
		</script>
		
</body>
</html>