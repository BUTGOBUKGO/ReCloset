<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="제품 상세 페이지"/>
	</c:import>
	
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br>
	
	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<form method="post" enctype="multipart/form-data" id="productView">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
							<div class="slick3 gallery-lb">
							 <c:forEach items="${attachmentList}" var="a" varStatus="vs"> 
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/uploadimg/${a.changename}">
									<div class="wrap-pic-w pos-relative">
										<img id="mainImg" src="${pageContext.request.contextPath}/resources/uploadimg/${a.changename}" >

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/uploadimg/${a.changename}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
						 </c:forEach>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="userno" value="${member.userNo}"/>	
				<div class="bor10 col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-30 p-lr-0-lg">
						<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									<h4>상품명</h4>
								</div>
								<div class="size-204 respon6-next">
									<h4 class="mtext-105 cl2 js-name-detail p-b-5">
										<input type="text" name="gname" style="font-size:13pt;" value="${goods.gname}" readonly required/>
									</h4>
								</div>
							</div>
						<hr />
						
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								<h4>가격</h4>
							</div>

							<div class="size-204 respon6-next">
								<h4 class="mtext-105 cl2 js-name-detail p-b-5">
									<input type="number" name="gprice" style="font-size:13pt;" value="${goods.gprice}"  readonly required/>
								</h4>
							</div>
						</div>
						
						<hr />
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6" >
								<h4 align="left">색상</h4>
							</div>

							<div class="size-204 respon6-next">
								<h3 class="mtext-105 cl2 js-name-detail p-b-5">
									<input  type="text" name="gcolor" style="font-size:13pt;" value="${goods.gcolor}" readonly required/>
								</h3>
							</div>
						</div>
						
						<hr />
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6" >
								<h4>사이즈</h4>
							</div>

							<div class="size-204 respon6-next">
								<h4 class="mtext-105 cl2 js-name-detail p-b-5">
									<input type="text" name="gsize" style="font-size:13pt;" value="${goods.gsize}" readonly required/>
								</h4>
							</div>
						</div>
						<hr />
						<div class="flex-w flex-r-m p-b-10">
							<div class="col-12 p-b-5">
								<label class="stext-102 cl3" for="gSimple" align="left">참고사항</label>
								<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="gEtc" type="text" name="gsimple" placeholder="간단 설명 (EX. 옷의 재질등과 이염 여부)" 
								value="${goods.gsimple }" readonly required/>
							</div>
						</div>
						<br />
						<!-- 카트 , 구매 버튼 -->
						<div>
							<center>
					<input type="submit" class="btn btn-outline-info" id="gocart" value="Add to cart" formaction=""  /> 
					<input type="submit" class="btn btn-outline-info" id="gobuy" value="Buy Now" formaction="/product/payGo.do" />
							</center>
						</div>	
					</div>
						<!-- 카트 버튼 끝 -->
						
						
						<!-- sns 태그들 -->
						<div class="flex-w flex-m p-l-170 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>
							<a href="https://www.facebook.com/" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook" target="_blank">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="https://twitter.com/?lang=ko" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter" target="_blank">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="https://aboutme.google.com/" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus" target="_blank">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					
						<!-- sns 태그 끝 -->
					</div>
				</div>
			<div class="bor10 m-t-50 p-t-43 p-b-40" id="detail">
				<div class="flex-w flex-r-m p-b-10">
					<div class="col-12 p-b-5">
					   <h3 class="ltext-106 cl5 txt-center">제품 상세 설명</h3>
		              <div class="ContentArea" style="margin-top:20px; "name="gdetail">
		                  
		                  ${goods.gdetail}
		              </div>
						<br>
		             
                    </div>
               </div>
               
               
			</div>
			
			
			</form>
		</div>
	</section>
	
	
	
	<c:import url="../common/footer.jsp"/>
	

	
	
	
	<script>
	
	/* $("feat").on("click", function(){
		$.ajax({
			url: "${pageContext.request.contextPath}",
			data: {
				"누른사람 정보" : //
				"해당 상품 정보" : //
			}, success: function(data){
				// data 는 성공했으면 1 실패했으면 0 이런식으로 갖고오게하셔서 그에 따른 알럿창을 띄우시거나 필요없음 없애도 되요
				if(data == 1){
					alert("장바구니에 추가됨");
					// 버튼 색깔 바꿔주시면 될듯용? 핑요없음 말구용
				} 
			}
		});
	}); */
	
	
	
	$(function(){
		$('#fileArea').hide();
		
		// $('#titleImgArea').on('click',function(){ });
		$('#mainImg').click(() => {
			$('#productImgFile1').click();
		});
		
		$('#productImg1').click(() => {
			$('#productImgFile2').click();
		});
		
		$('#productImg2').click(() => {
			$('#productImgFile3').click();
		});
		
		$('#productImg3').click(() => {
			$('#productImgFile4').click();
		});
		
		$('.arrow-slick3').each(function(){
			$(this).attr('type', 'button');
		});
	});
	
	</script>
</body>
</html>