<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="회원 가입 창"/>
	</c:import>
	<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		/*중복아이디체크관련*/
		div#userId-container {position:relative; padding:0px;}
		div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		div#userId-container span.ok{color:green;}
		div#userId-container span.error, span.invalid{color:red;}
		.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		
		    position: fixed;
		    left:0;
		    right:0;
		    top:0;
		    bottom:0;
		    background: rgba(0,0,0,0.2); /*not in ie */
		    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
			z-index:5000;
		}
    .wrap-loading div{ /*로딩 이미지*/

        position: fixed;
        top:50%;
        left:50%;
        margin-left: -20px;
        margin-top: -21px;
    }

    .display-none{ /*감추기*/
        display:none;
    }
	</style>
</head>
<body class="animsition">
	
<div class="wrap-loading display-none">
    <div><img style="z-index:5001;" src="${pageContext.request.contextPath}/resources/images/loading3.gif" /></div>
</div>    

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
			<div id="container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return validate();" >
				<!-- Tab01 -->
				<div class="tab01">
				
					<!-- Tab panes -->
					<div class="tab-content p-t-43">

						<!--  -->
						<div class="tab-pane fade active show" id="reviews" role="tabpanel" aria-expanded="true">
							<div class="row">
								<div class="col-10 m-lr-auto" >
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68" >
											<div class="row p-b-25">
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userId">User ID</label>
												</div>
												<div class="col-6 p-b-7" id="userId-container">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10 m-l-13" id="userId_" type="text" name="userId">
														&nbsp;
														<span  class="p-lr-26 guide ok">사용 가능</span>
									            		<span  class="p-lr-26 guide error">사용 불가</span>
									            		<span  class="p-lr-26 guide invalid">4글자 미만</span>
														<!-- <input name="idDuplicateCheck" id="idDuplicateCheck" value="0"/> -->
									            	
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userPwd">Password</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userPwd_" type="password" name="userPwd">
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="userPwd2">Password Check</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userPwd2" type="password" name="userPwd2">
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
												<label class="stext-102 cl3" for="userName">이름</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="userName" type="text" name="userName">
												</div>
												<div class="col-2 p-b-7"></div>
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
												<label class="stext-102 cl3" for="phon">연락처(-제외)</label>
												</div>
												<div class="col-6 p-b-7">
													 <select class="size-102 bor8" style="min-width: 13px;" id="phon" name="phon">
														<option value="010" selected>010</option>
														<option value="011">011</option>
														<option value="016">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>
													<input id="phon2" class="size-102 bor8" style="width:30px; display:inline-block;" name="phon2" type="text" value="" maxlength="8" autocomplete="off">
													</div>
												<div class="col-2 p-b-7"></div>
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="Email">Email</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8" style="width: 50px; display:inline-block;" type="text" id="Email" name="Email" size="20" maxlength="20"
											  		 value="" autocomplete="off"><span>@</span>	
											  		<input style="display:inline-block;" id="Email02" name="Email02" list="domains" placeholder="도메인입력/선택">									
													<datalist id="domains">
										                <option value="naver.com">
										                <option value="hanmail.net">
										                <option value="gmail.com">
										                <option value="yahoo.co.kr">
										                <option value="nate.com">
										            </datalist>
										            <input id="emailAuthCode" type="hidden" name="emailAuthCode">
												</div>
												
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
												</div>
												<div class="col-6 p-b-7">
													<button class="btn btn-primary" type="button" id="emailBtn" onclick="sendEmail();">인증 번호 발송</button>
												</div>
												<div class="col-2 p-b-7"></div>	
												
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="emailAuth">Email 인증코드</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8" style="display:inline-block;" type="text" id="emailAuth" name="emailAuth" autocomplete="off" disabled>
											  		 
										            <button class="btn btn-primary" type="button" id="emailAuthBtn" onclick="authEmail();" disabled>인증하기</button>
												</div>
												
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="birthday">BirthDay</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 stext-102 cl2 p-lr-10" id="birthday" type="date" name="birthday">
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="address">Address</label>
												</div>
												<div class="col-6 p-b-7">
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10" id="zipCode"  type="text" name="zipCode" onclick="addrSearch();" 
													       placeholder="클릭하세요!" style="background: lightgoldenrodyellow;" readonly>
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10" id="address1"   type="text" name="address1" placeholder="시군구">
													<input class="size-102 bor8 m-b-7 stext-102 cl2 p-lr-10" id="address2"   type="text" name="address2" placeholder="상세 주소">
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-2 p-b-7">
													<label class="stext-102 cl3" for="gender">Gender</label>
												</div>
												<div class="col-6 p-b-8">
													<input class=" bor8 "style="display : inline;" id="gender" type="radio" name="gender" value="M"> 남성 &nbsp;
													<input class=" bor8 " style="display : inline;" id="gender" type="radio" name="gender" value="F"> 여성
												</div>
												<div class="col-2 p-b-7"></div>	
												<!--  -->
												<div class="col-2"></div>
												<div class="col-10 p-b-7">
													<button type="submit" class="stext-101 cl1 size-112 bg7 bor11 hov-btn3 p-lr-5 trans-04 m-b-10">
														가입
													</button> &nbsp;
													<button type="reset" class="stext-101 cl1  size-112 bg7 bor11 hov-btn3 p-lr-5 trans-04 m-b-10" data-dismiss="Member">
														취소
													</button>
												</div>
												<div class="col-2 p-b-7"></div>	
											</div>
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

			$(function(){
				
				$("#userPwd2").blur(function(){
					var p1=$("#userPwd_").val(), p2=$("#userPwd2").val();
					if(p1!=p2){
						alert("패스워드가 일치하지 않습니다.");
						$("#userPwd_").focus();
					}
				});
				
				/* 아이디 중복검사 이벤트 추가 */
				$("#userId_").on("keyup", function(){
			        var userId = $(this).val().trim();
			       
			        if(userId.length<4) {
			        	$(".guide.error").hide();
			        	$(".guide.ok").hide();
			        	$(".guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
				            data : {userId:userId},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $(".guide.error").hide();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $(".guide.error").show();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     //console.log(userId);
				});
			});
			
			function validate(){
				var userId = $("#userId_");
				if(userId.val().trim().length<4){
					alert("아이디는 최소 4자리이상이어야 합니다.");
					userId.focus();
					return false;
				}
				
				//아이디중복체크여부
			    if($("#idDuplicateCheck").val()==0){
			        alert("사용가능한 아이디를 입력해주세요.");
			        return false;
			    }
				
				if($('#emailAuthCode').val() == 0) {
					alert("이메일 인증을 시도해 주세요!");
					return false;
				}
				
				return true;
			}
			
			/* 이메일 */
	function sendEmail(){
		var userId = $("#userId_");
		
		if(userId.val().trim().length<4 || $("#idDuplicateCheck").val()==0){
			alert('아이디를 먼저 확인해주세요');
		} else {
			var email =  $("#Email").val() + '@' + $('#Email02').val();
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/email/checkEmail.do",
				data:{ userId : userId.val(), email : email},
				success:function(data){
					if(data == 2) {
						alert("사용가능한 이메일입니다. 전송된 인증번호를 입력해주세요.");
						$('#emailAuth').attr('disabled', false);
						$('#emailAuthBtn').attr('disabled', false);
					} 
				},
				error: function(data){
					alert("에러가 발생했습니다.");
					return false;
				} ,beforeSend:function(){
	                $('.wrap-loading').removeClass('display-none');
	            },complete:function(){
	                $('.wrap-loading').addClass('display-none');
	            }
			});		
		}
	};
	
	function authEmail(){
		var email_ =  $("#Email").val() + '@' + $('#Email02').val();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/email/emailConfirm.do",
			data:{email : email_, key : $('#emailAuth').val() },
			success:function(data){
				console.log(data);
				if(data == 1) {
					alert("인증이 완료되었습니다.");
					$('#emailAuth').attr('disabled', true);
					$('#emailAuthBtn').attr('disabled', true);
					$('#emailAuthCode').val(1);
				} 
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			} ,beforeSend:function(){
                $('.wrap-loading').removeClass('display-none');
            },complete:function(){
                $('.wrap-loading').addClass('display-none');
            }
		});
	}

			
			
			</script>
</body>
</html>