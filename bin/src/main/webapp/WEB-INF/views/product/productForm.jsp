<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .mb-3 {
            display: inline-block;
        }
        [alt="IMG-PRODUCT"] {
        	width : 100%;
        	height: 600px;
        }
    </style>

    <c:import url="../common/commonUtil.jsp">
        <c:param name="titleName" value="제품 등록 페이지" />
    </c:import>

    <c:import url="../common/header.jsp" />
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
</head>

<body>
    <br />
    <br />
    
    <!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<form action="${ pageContext.request.contextPath }/product/productInsert.do" method="post" enctype="multipart/form-data" id="insertForm">
			<input type="hidden" name="userNo" value="${member.userNo}"/>	
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/default.png">
									<div class="wrap-pic-w pos-relative">
										<img id="mainImg" src="${pageContext.request.contextPath}/resources/images/default.png" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/default.png">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/default.png">
									<div class="wrap-pic-w pos-relative">
										<img id="productImg1" src="${pageContext.request.contextPath}/resources/images/default.png" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/default.png">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/default.png">
									<div class="wrap-pic-w pos-relative">
										<img id="productImg2" src="${pageContext.request.contextPath}/resources/images/default.png" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/default.png">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/default.png">
									<div class="wrap-pic-w pos-relative">
										<img id="productImg3" src="${pageContext.request.contextPath}/resources/images/default.png" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/default.png">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
							<div id="fileArea">
								<input type="file" id="productImgFile1" name="productImgFile" onchange="LoadImg(this,1)">
								<input type="file" id="productImgFile2" name="productImgFile" onchange="LoadImg(this,2)">
								<input type="file" id="productImgFile3" name="productImgFile" onchange="LoadImg(this,3)">
								<input type="file" id="productImgFile4" name="productImgFile" onchange="LoadImg(this,4)">
							</div>
						</div>
					</div>
				</div>
				
				<div class="bor10 col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-30 p-lr-0-lg">
						<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									상품명
								</div>
	
								<div class="size-204 respon6-next">
									<h4 class="mtext-105 cl2 js-name-detail p-b-14">
										<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="text" name="gName"/>
									</h4>
								</div>
							</div>
						
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								상품 종류
							</div>

							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<select class="js-select2" name="categoryCode">
										<option value="1">패션잡화</option>
										<option value="2">악세사리</option>
										<option value="3">여성의류</option>
										<option value="4">남성의류</option>
										<option value="5">기타</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								판매희망가
							</div>

							<div class="size-204 respon6-next">
								<h4 class="mtext-105 cl2 js-name-detail p-b-14">
									<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="number" name="gPrice" value="1000" min="1000" step="100"/>
								</h4>
							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								색상
							</div>

							<div class="size-204 respon6-next">
								<h4 class="mtext-105 cl2 js-name-detail p-b-14">
									<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="text" name="gColor" />
								</h4>
							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								사이즈
							</div>

							<div class="size-204 respon6-next">
								<h4 class="mtext-105 cl2 js-name-detail p-b-14">
									<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="text" name="gSize"/>
								</h4>
							</div>
						</div>
						
						<div class="flex-w flex-r-m p-b-10">
							<div class="col-12 p-b-5">
								<label class="stext-102 cl3" for="gSimple">참고사항</label>
								<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="gEtc" type="text" name="gSimple" placeholder="간단 설명 (EX. 옷의 재질등과 이염 여부)" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bor10 m-t-50 p-t-43 p-b-40" id="detail">
				<div class="flex-w flex-r-m p-b-10">
					<div class="col-12 p-b-5">
					   <h3 class="ltext-106 cl5 txt-center">제품 상세 설명</h3>
		              <div class="editorArea" style="margin-top:20px;">
		                  <textarea id="summernote" name="gDetail"></textarea>
		              </div>
						<br>
		              <div align="center">
		                  <button type="submit" class="btn btn-primary" onclick="insertbtn();">작성</button>
		                  <button type="reset" class="btn btn-primary" onclick="cancelbtn();">취소</button>
		              </div>
                    </div>
               </div>
			</div>
			</form>
		</div>
	</section>
	
    <c:import url="../common/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

    <script>
    	
    	
        $(document).ready(function() {

            $('#summernote').summernote({
                placeholder: '내용을 입력하세요.',
                tabsize: 2,
                height: 500,
                tooltip : false,
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            sendFile(files[i], this);
                        }
                    }
                }
            });
            
            $('.note-modal').css('z-index', '10000');
        });

        $('.dropdown-toggle').dropdown();

        function sendFile(file, el) {

            var form_data = new FormData();
            form_data.append('file', file);
            // console.log(form_data.file);

            $.ajax({
                data: form_data,
                type: "post",
                url: '/recloset/insert.tn',
                cache: false,
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function(url) {
                    console.log('----------------------------');
                    console.log(url);
                    console.log('----------------------------');
                    url.replace("\/", "/");
                    $(el).summernote('editor.insertImage', url);
                },
                error: function() {
                    console.log("실패실패");
                }
            });
        };

        function insertbtn() {
            if ($('#title').val() == "") {
                alert("제목을 입력하세요.");
                $('#title').focus();
            } else if ($('#summernote').val() == "") {
                alert("내용을 입력해 주세요.");
                $('#summernote').focus();
            } else {
                $('#insertForm').submit();
            }
            event.preventDefault();

        };

        function cancelbtn() {
            var answer = confirm("게시글 작성을 취소하시겠습니까?");

            if (answer == true) {
                location.href = "${pageContext.request.contextPath}/product/productList.do";
            }
        };
        
		// 사진을 추가하였을 때, 이미지 태그와 연동하여 바로 보이도록
		// '미리보기'기능 구현하기
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
	
		function LoadImg(value, num) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e){
					switch(num){
					case 1: 
						$('#mainImg').attr('src', e.target.result);
						$('#mainImg').parents('.item-slick3').attr('data-thumb', e.target.result);
						$('#mainImg').next().attr('href', e.target.result);
						break;
					case 2: $('#productImg1').attr('src', e.target.result);
							$('#productImg1').parents('.item-slick3').attr('data-thumb', e.target.result);
							$('#productImg1').next().attr('href', e.target.result);
					
						break;
					case 3: $('#productImg2').attr('src', e.target.result);
							$('#productImg2').parents('.item-slick3').attr('data-thumb', e.target.result);
							$('#productImg2').next().attr('href', e.target.result);
							
						break;
					case 4: $('#productImg3').attr('src', e.target.result);
							$('#productImg3').parents('.item-slick3').attr('data-thumb', e.target.result);
							$('#productImg3').next().attr('href', e.target.result);
							
						break;
					}
					
					$('.slick-active > img').attr('src', e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>

</html>