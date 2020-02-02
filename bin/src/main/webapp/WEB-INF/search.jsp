<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
#SearchRankcontent {
    margin: 20px;
    padding: 10px;
    background: #9EA6E1;
}
#rank-list a {
    color: black;
    text-decoration: none;
}

#rank-list a:hover {
    text-decoration: underline;
}

#rank-list {
    overflow: hidden;
    width: 160px;
    height: 20px;
    margin: 0;
}

#rank-list dt {
    display: none;
}

#rank-list dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
    height: 20px;
    line-height: 20px;
}
</style>
	<c:import url="views/common/commonUtil.jsp">
		<c:param name="titleName" value="메인페이지"/>
	</c:import>
</head>
<body class="animsition">
	<c:import url="views/common/header.jsp"/>
	<c:import url="views/common/cart.jsp"/>
	<br /><br /><br /><br /><br />
<div>
	<form class="form-inline" method="post" id="searchForm">
		<div id="searchFormstyle">
		<div class="form-inline">
		<select class="form-control" id="categorySearch" name="category">
		<option value=1>패션잡화</option>
		<option value=2>악세사리</option>
		<option value=3>여성의류</option>
		<option value=4>남성의류</option>
		<option value=5>기타</option>
		</select>
		<select class="form-control" id="optionSearch" name="optionSearch">
		<option value="gname">이름</option>
		<option value="seller">판매자</option>
		</select>
	   <!--  <div class="bor17 of-hidden pos-relative">
		<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

		<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" type="button" onclick="searchGo()">
		<i class="zmdi zmdi-search"></i>
			</button> -->
		<div class="bor17 of-hidden pos-relative">
			<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchName" placeholder="Search">
			<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchButton" onclick="searchGo();" type="button">
				<i class="zmdi zmdi-search"></i>
			</button>
		</div>
		</div>
    </div>
	</form>
	</div>
	<button type="button" onclick="realTimeSearchRank()">나는 버튼</button>
	   <div id="SearchRankcontent" display : "none">
            <dl id="rank-list">
                <dt>실시간 급상승 검색어</dt>
                <dd>
                    <ol>
                        <li><a href="#">1 순위</a></li>
                        <li><a href="#">2 순위</a></li>
                        <li><a href="#">3 순위</a></li>
                        <li><a href="#">4 순위</a></li>
                        <li><a href="#">5 순위</a></li>
                        <li><a href="#">6 순위</a></li>
                        <li><a href="#">7 순위</a></li>
                        <li><a href="#">8 순위</a></li>
                        <li><a href="#">9 순위</a></li>
                        <li><a href="#">10 순위</a></li>
                    </ol>
                </dd>
            </dl>
        </div>
<script>
$(function() {
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();

    function step(index) {
        $('#rank-list ol').delay(2000).animate({
            top: -height * index,
        }, 500, function() {
            step((index + 1) % count);
        });
    }

    step(1);
});
function searchGo() {

	var category = document.getElementById("categorySearch");
	var optionSearch = document.getElementById("optionSearch");

	console.log(optionSearch.value);
	console.log(categorySearch.value);

	switch (optionSearch.value) {
	case 'gname' :
		$('#searchForm').attr("action", "${pageContext.request.contextPath}/search/gnameSearch.ser");
 
		break;
	case 'seller':
		$('#searchForm').attr("action", "${pageContext.request.contextPath}/search/sellerSearch.ser");
 
		break;
	}
	$('#searchForm').submit();

}

function realTimeSearchRank(){
	$.ajax({
		url : '${pageContext.request.contextPath}/searchRank/searchRank.rank',
		type : 'get',
		dataType : 'json',
		success : function(data){
			console.log(data);
			
			var realTimeRank = [];
			
			for(var i in data){
				
				 realTimeRank.push({Rank : data[i][0], SearchName : data[i][1]});
			}
		}
		
	})
}
</script>

	
	<c:import url="views/common/footer.jsp"/>
</body>
</html>