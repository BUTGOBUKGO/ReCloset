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
    </style>

    <c:import url="../common/commonUtil.jsp">
        <c:param name="titleName" value="상품 문의 수정 페이지" />
    </c:import>

    <c:import url="../common/header.jsp" />
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
</head>

<body>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <br />
    <section>
        <div align="center">
            <div id="yu" class="site-blocks-cover overlay aos-init aos-animate" style="background-image: url('../../resources/imges/icons/favicon.png');">
            </div>
        </div>
        <div class="mb-2" align="center">
            <form id="insertForm" action="${ pageContext.request.contextPath }/help/faqUpdateForm.do?qnaNo=${help.qnaNo}" method="post" >
                <div class="input-group mb-3" style="width:900px;">
                    <br />
                <input type="hidden" name="userNo" value="${member.userNo}" />
                    <input type="text" class="form-control" aria-label="Text input with dropdown button" name="qTitle" placeholder="제목을 입력"value="${help.qTitle}">
                </div>

                <div class="editorArea" style="margin-top:20px;">
                    <textarea id="summernote" name="qContent"> ${help.qContent}</textarea>
                </div>

                <div align="center">
                    <button type="reset" class="btn btn-primary" onclick="cancelbtn();">취소</button>
                    <button type="submit" class="btn btn-primary" onclick="insertbtn();">작성</button>
                	<input type="submit" class="btn btn-outline-info" id="godelete" value="삭제 하기" formaction="${pageContext.request.contextPath }/help/helpDelete.do?qnaNo=${help.qnaNo}" />
                </div>
                
            </form>

        </div>
    </section>
    <br>
    <br>
    <br>
    <br>
    <br>

    <c:import url="../common/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

    <script>
        $(document).ready(function() {

            $('#summernote').summernote({
                placeholder: '내용을 입력하세요.',
                tabsize: 2,
                height: 500,
                width: 900,
                tooltip : false,
                focus: true,
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

        $('.dropdown-toggle').dropdown()

        function sendFile(file, el) {

            var form_data = new FormData();
            form_data.append('file', file);
            // console.log(form_data.file);

            $.ajax({
                data: form_data,
                type: "post",
                url: '/recloset/insert1.tn',
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
        }

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

        }

        function cancelbtn() {
            var answer = confirm("게시글 작성을 취소하시겠습니까?");

            if (answer == true) {
                location.href = "${pageContext.request.contextPath}/help.do";
            }
        }
    </script>

</body>

</html>