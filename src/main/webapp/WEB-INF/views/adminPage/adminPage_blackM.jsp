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
		<c:param name="titleName" value="관리자페이지"/>
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
	  	<li class="list-group-item d-flex justify-content-between align-items-center">
   		<a href="${pageContext.request.contextPath }/adminPage_M.do" class="adminInfoSide">회원관리</a>
   		
  		</li>
  		
  		<!-- 신고상세관리 -->
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<a href="" class="adminInfoSide">신고관리</a>
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
 		
 		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<a href="${pageContext.request.contextPath}/admin_Statistics/admin_Statistics.do">통계관리</a>
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
<br>  <p class="text-center"> 블랙회원관리 </p>
<hr>

   <form method="post" id="searchForm">
   <div class="container">
      <div class="row">
        
         <div class="form-inline justify-content-center col-sm-12 col-md-9" style="height: 50px;">
         
<!--             <select class="form-control" id="filter" name="">
               <option value="mem" id="mem">일반회원</option>
               <option value='sell' id="sell">판매자</option>
               <option value="all" id=all>모든회원</option>
            </select> -->
            
            <div class="bor17 of-hidden pos-relative">
               <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="" id="searchId" placeholder="검색할아이디입력">
                 <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchIdBtn" type="button">
                  <i class="zmdi zmdi-search"></i>
               </button>
            </div>
            
             <div class="container col-9">
			 <div class="form-inline" id="myorderSearch">

 			<input type="date" id="startDate"> ~ <input type="date" id="endDate"> 
 			<button class="orderSearch" id="blackS">날짜 직접 입력</button>
 			</div>
 			</div>
            
         </div>
        </div>
 	</div>
 	</form>
 	
 	<br>
 	<br>



<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col" width="100">신고번호</th>
  <th scope="col" width="100">신고한회원</th>
  <th scope="col" width="120">신고내용</th>
  <th scope="col" width="100">신고당한회원</th>
  <th scope="col" width="100">회원등급복구</th>
</tr>
</thead>

<tbody>
<c:forEach var="adminPage" items="${BlackSearch}">

<tr>
	<!-- 신고번호 -->
	<td>
	<var class="orderNo">${BlackSearch.mReportNo}</var> 
	</td>
	
	<!-- 신고한회원 -->
	<td> 
	<var class="orderNo">${BlackSearch.mReporter}</var> 
	</td>
	
	<!-- 신고내용 -->
	<td>
	<var class="orderNo">${BlackSearch.mrReason}</var> 
	</td>
	
	<!-- 신고당한회원 -->
	<td>
	<var class="orderNo">${BlackSearch.mDefendant}</var> 
	</td>
	
	<!-- 신고당한회원 등급 -->
	<td>
	<var class="orderNo">${BlackSearch.memType}</var> 
	</td>

	<td class="text-right"> 
	<button class="btn btn-outline-danger memChange"> 회원등급복구 </button>
	</td>

</tr>

</c:forEach>
</tbody>

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










