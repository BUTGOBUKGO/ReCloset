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
      
   .img-wrap2{
	width: 60px;
    height: 60px;
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
  
  		<li class="list-group-item d-flex justify-content-between align-items-center">
    	<a href="${pageContext.request.contextPath }/myPage_O.do" class="myInfoSide">주문내역상세조회</a>
 		</li>
 		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<a href="" class="myInfoSide">취소/교환/환불</a>
  		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<a href="" class="myInfoSide">내정보관리</a>
  		</li>
  		
 	</ul>
 </div>
 


 <div class="container col-9">
 <div class="form-inline" id="myorderSearch">
 
 <div class="searchBtn_group">
 <button class="orderSearch" id="myorder1m"> 1개월 </button>
 <button class="orderSearch" id="myorder3m"> 3개월 </button>
 <button class="orderSearch" id="myorder6m"> 6개월 </button>
 </div>

 &nbsp;&nbsp;<input type="date" id="startDate"> ~ <input type="date" id="endDate"> 
 <button class="orderSearch" id="myorderS">날짜 직접 입력</button>
 </div>
 </div>
 
	
 <div class="container col-9">
 <br>  
 
 <p class="text-center"> 취소내역조회 </p>
 
 <hr>

<div class="menuCard">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col" width="100">주문번호</th>
  <th scope="col">Product</th>
  <th scope="col" width="120">Price</th>
  <th scope="col" width="120">진행상황</th>
  <th scope="col" width="200" class="text-right">Action</th>
</tr>
</thead>

<tbody>
<c:forEach var="MyPage" items="${myList}">

<tr>
<td>

	<div class="orderNo-wrap">
		<var class="orderNo">${MyPage.orderNo}</var> 
	</div>
</td>	

<td>
<figure class="media">

	<div class="img-wrap">
	<img src="${ pageContext.request.contextPath }/resources/uploadimg/${MyPage.changeName }" class="img-wrap2">
	</div>

	<figcaption class="media-body">
		<h6 class="title text-truncate">${MyPage.gName}</h6>
		<dl class="param param-inline small">
		  <dt>${MyPage.gName}</dt>
		</dl>
<!-- 		<dl class="param param-inline small">
		  <dt>Color: </dt>
		</dl>-->
	</figcaption>
</figure> 
	</td>
	<td></td>
	
	<td> 
		<div class="price-wrap"> 
			<var class="price"><fmt:formatNumber value="${MyPage.gPrice}" pattern="#,###" /></var> 
		</div> <!-- price-wrap .// -->
	</td>
	
	
	<td class="text-right"> 
	<!-- <a href="" class="btn btn-outline-danger myButton1"> 배송조회</a> -->
	
	
	
	<!-- 배송조회 Modal Start -->

	<button class="btn btn-outline-danger shipBtn" name="${ MyPage.trackingNo }"> 배송조회 </button>
	&nbsp;&nbsp;
	<a href="" class="btn btn-outline-danger"> 취소/반품 </a>
	</td>
	


</tr>

	</c:forEach>
</tbody>

</table>
</div> <!-- card.// -->





</div> 
<!--container end.//-->
	</div>
	
	
	</section>


	<br><br><br><br><br><br><br><br><br>
	
	
	<c:import url="../common/footer.jsp"/>

<script>


</script>


</body>
</html>










