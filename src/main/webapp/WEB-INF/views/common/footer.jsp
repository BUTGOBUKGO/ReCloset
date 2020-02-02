<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Terms and Conditions
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="${pageContext.request.contextPath}/service.do" class="stext-107 cl7 hov-cl1 trans-04">
								서비스 이용약관
							</a>
						</li>

						<li class="p-b-10">
							<a href="${pageContext.request.contextPath}/termsofUse.do" class="stext-107 cl7 hov-cl1 trans-04">
								사이트 이용 약관
							</a>
						</li>

						<li class="p-b-10">
							<a href="${pageContext.request.contextPath}/userterms.do" class="stext-107 cl7 hov-cl1 trans-04">
								사용자 이용약관
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Track Order
							</a>
						</li>

						<li class="p-b-10">
							<a href="${pageContext.request.contextPath }/help.do" class="stext-107 cl7 hov-cl1 trans-04">
								FAQs
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Call
					</h4>

					<p class="stext-107 cl7 size-201">
					고객 센터 / 전자 금융 거래 분쟁 처리 담당 <br />
					Tel. (02) 2222 - 3333 <br />
					파트너 센터 <br />
					Tel. (02) 1111 - 4374 <br />
					</p>

					<div class="p-t-27">
						<a href="https://www.facebook.com/" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="https://www.instagram.com/?hl=ko" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="https://twitter.com/?lang=ko" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-twitter"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Company Information
					</h4>

					
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" value="(주) RE-CLOSET 대표 이사  Daniel Yu" readonly>
							<div class="focus-input1 trans-04"></div>
						</div>
						<br />
						<div class="stext-107 cl7 size-201">
							<p>서울특별시 강남구 테헤란로 130 호산빌딩 <br />
								5F 352CLASS <br />
								사업자 등록번호 : 111-11-111111 <br />
								통신판매업신고 : 2020-서울강남-1111</p>
						</div>
					
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="https://www.paypal.com/kr/home" class="m-all-1">
						<img src="${pageContext.request.contextPath}/resources/images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="https://usa.visa.com/" class="m-all-1">
						<img src="${pageContext.request.contextPath}/resources/images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="https://usa.visa.com/" class="m-all-1">
						<img src="${pageContext.request.contextPath}/resources/images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="${pageContext.request.contextPath}/resources/images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="${pageContext.request.contextPath}/resources/images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

		

	



<!--===============================================================================================-->	
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	
	
	<script>
		$('.js-show-cart').on('click',function(){
		
	    	var userNo = '${member.userNo}';
	    	console.log("userNo : " + userNo);
			$.ajax({
				url: "/recloset/cart/cartList.do",
	    		dataType: "json",
	    		data: { userNo : userNo },
	    		success : function(data){
	    			console.log("data : " + data);
	    			if(data.length == 0) {
	    			
	    			} else {
	    				$('.cartHeader').empty();
		    			for(var i in data){
		    				var gprice = data[i].gPrice;
		    				var innerDiv1 = '<li class="header-cart-item flex-w flex-t m-b-12">'
										+ '<div class="header-cart-item-img">'
										+ '<img src="${ pageContext.request.contextPath }/resources/uploadimg/' + data[i].changeName + '" alt="IMG">'
										+ '</div>'
										+ '<div class="header-cart-item-txt p-t-8" style="padding-left:20px;">'
										+ '<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">'
										+ data[i].gName + '</a>'
										+ '<span class="header-cart-item-info">'
										+ gprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원'
										+ '</span>'
										+ '</div>'
										+ '</li>';
							$('.cartHeader').append(innerDiv1);
		    			}
		    			$('.cartFooter').empty();
		    			var totalAmount = 0;
		    			for(var i in data){
		    				totalAmount += data[i].gPrice;
		    			}
		    			var innerDiv2 = '<div class="header-cart-total w-full p-tb-40">'
									+ 'Total : ' + totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원'
									+ '</div>'
									+ '<div class="header-cart-buttons flex-w w-full">'
									+ '<a href="/recloset/cart/features.do" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">'
									+ 'View Cart</a>'
									+ '<a href="/recloset/order/orderForm.do?userNo=' + userNo + '" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">'
									+ 'Check Out</a>'
									+ '</div>';
						$('.cartFooter').append(innerDiv2);
	    			}
	    		}	
			});
		});
		
		$(function(){
			var userNo = '${member.userNo}';
			$.ajax({
				url: "/recloset/cart/cartQty.do",
	    		dataType: "json",
	    		data: { userNo : userNo },
	    		success : function(data){
	    			console.log(data);
	    			$('.js-show-cart').attr("data-notify", data);
	    		}
			});
		});
	
	</script>