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
		/* The Modal (background) */
        .modal {
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
        .modal-content {
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
				대 주제
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				소 주제
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
			${member.userId } <!-- 상호명으로 바꾸기 -->
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
								<ul>
									<li class="header-cart-item flex-w flex-t m-b-12">
										<div class="header-cart-item-img">
										<img src="${ pageContext.request.contextPath }/resources/uploadimg/">
										</div>
										<div class="header-cart-item-txt p-t-8">
											<span class="header-cart-item-name hov-cl1 trans-04" style="font-size:17px;">리뷰제목 &nbsp; ★★★★☆</span>
											<span class="header-cart-item-info m-b-18" style="padding-left:10px;">userId &nbsp;|&nbsp; 리뷰작성일 &nbsp;&nbsp;&nbsp; 제품명  &nbsp;|&nbsp; 제품간단정보 &nbsp;|&nbsp; 제품가격</span>
											<p class="header-cart-item-name hov-cl1 trans-04" style="font-size:16px;">너무 예뻐요!</p>
										</div>
									</li>
									<hr />
									
								</ul>
							</div>
							<!-- <p class="stext-117 cl6 p-b-26">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							</p>

							<p class="stext-117 cl6 p-b-26">
								Praesent vel mi bibendum, finibus leo ac, condimentum arcu. 
							</p> -->
						</div>
						<br /><br />
						 <!-- Trigger/Open The Modal -->
					    <button id="myBtn" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Add Review</button>
					 
					    <!-- The Modal -->
					    <div id="myModal" class="modal ">
					 
					      <!-- Modal content -->
					      <div class="modal-content">
					        <span class="close">&times;</span>                                                               
					        	                               
						        <h3 style="text-align:center;">주문내역 목록</h3>
						        <br /><br />
						        <table id="recentlyAddress" style="text-align: center; width:auto;">
						        
				                    <thead>
					                    <tr id="theadtr" style="border-bottom:1px solid black; height: 40px;">
					                        <th>주문번호</th>
					                        <th colspan="3">상품명</th>
					                        <th colspan="2">총금액</th>
					                        <th>선택</th>
					                    </tr>
				                    </thead>
				                    <tbody id="address">
				                    
				                    	<%-- <c:forEach var="delivery" items="${deliveryList }"> --%>
				                    		<tr>
					                            <td>
					                                <strong class="receiverName">${delivery.receiver}</strong>
					                            </td>
					                            <td colspan="3">
					                                <span class="rZipCode">${delivery.zipCode}</span><br />
					                                <span class="rAddress1">${delivery.address1}</span><br />
					                                <span class="rAddress2">${delivery.address2}</span><br />
					                            </td>
					                            <td colspan="2">
					                            	<span class="telNo">${delivery.phone}</span>
					                            </td>
					                            <td>
					                                <button type="button" class="addSelectBtn" onclick="addSelect(this);">선택</button>
					                            </td>
					                        </tr>
				                    	<%-- </c:forEach> --%>
				                    
				                     </tbody>
						        </table>
						      </div>
					        	
					      </div>
					 
					    </div>
						

						<script>
						// Get the modal
				        var modal = document.getElementById('myModal');
				 
				        // Get the button that opens the modal
				        var btn = document.getElementById("myBtn");
				 
				        // Get the <span> element that closes the modal
				        var span = document.getElementsByClassName("close")[0];                                          
				 
				        // When the user clicks on the button, open the modal 
				        $('#modalBtn').click(function() {
				            $('#myModal').css("display", "block");
				        });
				 
				        // When the user clicks on <span> (x), close the modal
				        span.onclick = function() {
				            modal.style.display = "none";
				        }
				 
				        // When the user clicks anywhere outside of the modal, close it
				        window.onclick = function(event) {
				            if (event.target == modal) {
				                modal.style.display = "none";
				            }
				        }

						</script>





						<!-- <div class="flex-w flex-t p-t-16">
							<span class="size-216 stext-116 cl8 p-t-4">
								Tags
							</span>

							<div class="flex-w size-217">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div> -->

						<!--  -->
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>

							<p class="stext-107 cl6 p-b-40">
								Your email address will not be published. Required fields are marked *
							</p>

							<form action="${pageContext.request.contextPath } " class="addComment">
								<input type="hidden" name="" />
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
								</div>
								
								<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
									Add Review
								</button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<!-- <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button> -->
						</div>

						<div class="p-t-55">
							<h4 class="mtext-113 cl2 p-b-12">
								판매자 정보
							</h4>
							
							<hr /><br />
							
							<span class="stext-116 cl8 hov-cl1 trans-04">
								판매자 ID : ${member.userId} <br /><br />
								평균 별점 : ★★★★☆ <br /><br />
								판매자홈 : www.recloset.com/ ${member.userId} <br />
							</span>
							
							<hr /><br />

							<!-- <ul>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Fashion
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Beauty
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Street Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Life Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										DIY & Crafts
									</a>
								</li>
							</ul> -->
						</div>

						<div class="p-t-65">
							<h4 class="mtext-112 cl2 p-b-33">
								Featured Products
							</h4>

							<ul>
								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="${pageContext.request.contextPath}/resources/images/product-min-01.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											White Shirt With Pleat Detail Back
										</a>

										<span class="stext-116 cl6 p-t-20">
											$19.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="${pageContext.request.contextPath}/resources/images/product-min-02.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Converse All Star Hi Black Canvas
										</a>

										<span class="stext-116 cl6 p-t-20">
											$39.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="${pageContext.request.contextPath}/resources/images/product-min-03.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Nixon Porter Leather Watch In Tan
										</a>

										<span class="stext-116 cl6 p-t-20">
											$17.00
										</span>
									</div>
								</li>
							</ul>
							<div style="text-align:right; color:green; cursor:pointer;">
								<u>more</u>
							</div>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-20">
								Archive
							</h4>

							<ul>
								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Top
										</span>

										<span>
											(9)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Bottom
										</span>

										<span>
											(39)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Bag
										</span>

										<span>
											(29)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Shoes
										</span>

										<span>
											(35)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											Accessories
										</span>

										<span>
											(22)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											etc
										</span>

										<span>
											(32)
										</span>
									</a>
								</li>

							</ul>
						</div>

						<!-- <div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>	
	<c:import url="../common/footer.jsp"/>
</body>
</html>