<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="회원 정보 페이지"/>
	</c:import>
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

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<form name="memberUpdateFrm" id="memberUpdateForm" action="" method="post">
				<!-- Tab01 -->
				<div class="tab01">
				
					<!-- Tab panes -->
					<div class="tab-content p-t-43">

						<!-- - -->
						<div class="tab-pane fade active show" id="reviews" role="tabpanel" aria-expanded="true">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto" >
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68" >
											<div class="row p-b-25">
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userId">User ID</label>
												</div>
												<div class="col-6 p-b-7" id="userId-container">
													<span>${ member.userId }</span>
													<input type="hidden" name="userId" value="${ member.userId }" />
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userPwd">변경할 Password</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userPwd_" type="password" name="userPwd">
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userPwd2">Password Check</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userPwd2" type="password" name="userPwd2">
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
												<label class="stext-102 cl3" for="userName">이름</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userName" type="text" name="userName" value="${ member.userName }">
												</div>
												<div class="col-2 p-b-7"></div>
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="email">Email</label>
												</div>
												<div class="col-6 p-b-7">
													<span>${ member.email }</span>
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="birthday">BirthDay</label>
												</div>
												<div class="col-6 p-b-7">
													<span>${ member.birthday }</span>
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="address">Address</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10"  id="zipCode" type="text" value="${ member.zipCode }" name="zipCode" onclick="addrSearch();" 
													       placeholder="클릭하세요!" style="background: lightgoldenrodyellow;" >
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10"  id="address1" type="text" value="${ member.address1 }"name="address1" placeholder="시군구">
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10"  id="address2" type="text" value="${ member.address2 }" name="address2" placeholder="상세 주소">
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="gender">Gender</label>
												</div>
												<div class="col-6 p-b-7">
													<span>${ member.gender == 'M' ? '남성' : '여성' }</span>
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-10 p-b-7">
													<button id="updateBtn" type="button" class="stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
														수정하기
													</button> &nbsp;
													<button id="deleteBtn" type="button" class="stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
														탈퇴하기
													</button> &nbsp;
													<button id="loginBtn" type="reset" class="stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" data-dismiss="Member">
														취소
													</button>	
												</div>
												<div class="col-2 p-b-7"></div>	
											</div>
											<!-- go to home (숙제) -->									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>				
			</form>
		</div>
	</section>	
	<c:import url="../common/footer.jsp"/>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
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

		$('#updateBtn').on('click', function(){
			$('#memberUpdateForm').attr('action', 'memberUpdate.do');
			$('#memberUpdateForm').submit();
		});
		$('#deleteBtn').on('click', function(){
			$('#memberUpdateForm').attr('action', 'memberDelete.do');
			$('#memberUpdateForm').submit();
		});
		$('#loginBtn').don('click', function(){
			$('#memberLoginForm').attr('action', 'memberLoginForm.do');
			$('#memberLoginForm').submit();
		})
		
	</script>
</body>
</html>