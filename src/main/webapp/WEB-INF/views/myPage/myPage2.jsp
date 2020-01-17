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
		<c:param name="titleName" value="마이페이지"/>
	</c:import>

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/resume.min.css">
  
  
  <!------ Shopping list template ------>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  
  <style>
  
  /* Shopping list css */
  .divider_row{
  border-bottom:1px solid #aaa; 
  margin-bottom:10px;}
  			   
  .even_tab .divider_row:last-child{
  border-bottom:none;}
  
  th{
  		width: 200px !important;
  		align: center;
  	}
  </style>
	
</head>


<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
  
	
	<br><br><br><br><br><br><br><br><br>
	

<div class="container-fluid p-0">
  <div class="row">
     <div class="col-3">  
     
    <!-- SideBar Start --> 
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav"
 		style="margin-top: 200px !important; margin-bottom:800px !important; margin-left: 150px;">
 		
    <!-- <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none">Clarence Taylor</span>
      <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt="">
      </span>
    </a> -->
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#orderList">주문내역전체보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#">loremipsum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#">loremipsum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#">loremipsum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#">loremipsum</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#member">회원정보관리</a>
        </li>
      </ul>
    </div>
  </nav>
</div>

<!-- SideBar END-->




<div class="col-9">
   <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">

    
     
<!-- Shoping List Start -->
	    

<div class="container even_tab" >
	<div class="row divider_row" >
	
  			<div> <!-- style="width: 1500px;"-->
  			
            <div class="" style="float:left; margin-right: 40px;">
                <h4 class="">주문일자</h4>                      
            </div>
            <div class="" style="float:left; margin-right: 50px;">
                <h4 class="">주문번호</h4>                      
            </div>
            <div class="" style="float:left; margin-right: 60px;">
                <h4 class="">주문상품</h4>                      
            </div>
            <div class="" style="float:left; margin-right: 60px;">
                <h4 class="">주문금액</h4>                      
            </div>
            <div class="" style="float:left; margin-right: 60px;">
                <h4 class="">배송조회</h4>                      
            </div>
            <div class="" style="float:left; margin-right: 1px;">
                <h4 class="">취소/반품</h4>                      
            </div>
            </div>
	</div> 
	    
	
		<div class="row divider_row ">
  			
  			<c:forEach items="list" var="gol">
  			
            <div class="" style="float:left; margin-right: 10px;">
                "{gol.ODATE }"                
            </div>
            
            <div class="" style="float:left; margin-right: 10px;">
                "{gol.ORDERNO }"                  
            </div>
            
            <div class="" style="float:left; margin-right: 10px;">
                 "{gol.GNAME }"                 
            </div>
            
            <div class="" style="float:left; margin-right: 10px;">
                 "{gol.GTOTAL}"                    
            </div>
            
            <div class="" style="float:left; margin-right: 10px;">
                 "{gol.ORDERCHKNO}"                    
            </div>
            
            <div class="" style="float:left; margin-right: 10px;">
                <button class="btn btn-default btn-sm center-block">취소/반품</button>                  
            </div>
            </c:forEach>
            
	    </div>
	</div>

				
	<!--  -->
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="experience">
	<!--  -->

    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
	<!-- -->
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="skills">
	<!--  -->
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="interests">
	<!--  -->
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="awards">
	<!--   -->
    </section>
     </div>
  </div>
    
	</div>
	<br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp"/>
	
	<script>
	
	
	
	</script>

</body>
</html>











