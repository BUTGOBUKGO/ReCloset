     <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="관리자:회원관리"/>
	</c:import>

  
  <style>

   .badge-pill {
    background-color : black;
    color : white;
      }
      

  </style>
	
</head>


<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
  
	
	<br><br><br><br><br><br><br><br><br>

	
  
 
 <!-- 시작 -->
	<section class="container">
	<div class="row">
	<div id = "side_left" class="col-3">
	<ul class="list-group">
		
		<!-- 전체 회원조회 및 권한부여 -->
	  	<li class="list-group-item d-flex justify-content-between align-items-center">
   		<a href="${pageContext.request.contextPath }/adminPage_M.do" class="adminInfoSide">회원관리</a>
   		
  		</li>
  		
  		<!-- 신고상세관리 -->
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<a href="" class="adminInfoSide">신고관리</a>
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
 		
 		<!-- 블랙리스트 관리 -->
 		<li class="list-group-item d-flex justify-content-between align-items-center">
 		<a href="" class="adminInfoSide">블랙리스트관리</a>
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		<a href="" class="adminInfoSide">관리자정보관리</a>
   
  		</li>
  		
 	</ul>
 </div>
 

 

 
 <div class="container col-9">
 <div class="form-inline" id="memberSearch">
 
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">Filter</span> <span class="caret"></span>
                    </button>
                    
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="">일반회원</a></li>
                      <li><a href="">판매자</a></li>
                      <li><a href="">모든회원</a></li>
                    </ul>
                    
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="검색할아이디 입력">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                    <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>

</div>
 
 </div>
 </div>
 
 
 
	
	<div class="container col-9">
<br>  <p class="text-center"> 회원관리 </p>
<hr>



<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col" width="100">회원번호</th>
  <th scope="col" width="100">회원이름</th>
  <th scope="col" width="100">회원등급</th>
  <th scope="col" width="100">회원등급조정</th>
</tr>
</thead>

<%-- <c:forEach var="" items=""> --%>
<tbody>
<tr>
	<td>

	</td>
	
	<td> 

	</td>
	
	<td> 

	</td>
	
	<td class="text-right"> 
	<a href="" class="btn btn-outline-danger"> 회원등급조정 </a>
	</td>
	
	

</tr>
</tbody>
<%-- </c:forEach> --%>
</table>
</div> 





</div> 
<!--container end.//-->
	</div>
	
	
	</section>


	<br><br><br><br><br><br><br><br><br>
	
	
	<c:import url="../common/footer.jsp"/>

<script>

$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		
		var param = $(this).attr("href").replace("#","");
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
		$('.input-group #search_param').val(param);
	});
});



</script>


</body>
</html>










