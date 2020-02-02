     <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="관리자페이지:신고관리"/>
	</c:import>

  
  <style>
  /*
  #side_left{
  
 	width : 250px;

  
  }
*/

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
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href="${pageContext.request.contextPath }/adminPage_M.do"
						class="adminInfoSide">회원관리</a>

					</li>

					<!-- 신고상세관리 -->
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href="${pageContext.request.contextPath }/adminPage_R.do" class="adminInfoSide">신고관리</a> <span
						class="badge badge-primary badge-pill">14</span>
					</li>

					<!-- 통계관리  -->
					<li class="list-group-item d-flex justify-content-between align-items-center">
       				 <a href="${pageContext.request.contextPath}/admin_Statistics/admin_Statistics.do">통계관리</a>
       				 </li>
		
					<!-- 블랙리스트 관리 -->
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href="${pageContext.request.contextPath }/adminPage_B.do" class="adminInfoSide">블랙리스트관리</a> <span
						class="badge badge-primary badge-pill">14</span>
					</li>

					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href="" class="adminInfoSide">관리자정보관리</a>

					</li>
  		
 	</ul>
 </div>
 
   	<div class="col-md-9 content">
  	<div class="panel panel-default">
	<div class="panel-heading">
		관리자님 어서오세요~*
	</div>
	<hr>
	<div class="panel-body">
	
	<h6>오늘도 달콤입니다~*</h6>
	</div>
</div>
</div>
 

 
 <div class="container col-9">
 <div class="form-inline" id="myorderSearch">

 <input type="date" id="startDate"> ~ <input type="date" id="endDate"> 
 <button class="orderSearch" id="blackS">날짜 직접 입력</button>
 </div>
 </div>
 
 
 
	
	<div class="container col-9">
<br>  <p class="text-center"> 신고내역확인 </p>
<hr>



<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col" width="100">신고번호</th>
  <th scope="col" width="100">신고한회원</th>
  <th scope="col" width="120">신고내용</th>
  <th scope="col" width="100">신고당한회원</th>
  <th scope="col" width="100">신고글상세보기</th>
</tr>
</thead>

<c:forEach var="report" items="${list }">
<tbody>
<tr>
	<td>
		${report.reportNo }
	</td>
	
	<td> 
		${report.rreporter }
	</td>
	
	<td> 
		${report.rreason}
	</td>
	
	<td>
		${report.defendant }
	</td>
	
	<td class="text-right"> 
	<a href="" class="btn btn-outline-danger"> 신고글상세보기 </a>
	</td>
	
	

</tr>
</tbody>
</c:forEach>
</table>
</div> 





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










