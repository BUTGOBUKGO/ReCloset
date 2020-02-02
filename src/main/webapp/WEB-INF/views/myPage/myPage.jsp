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

  
  <style>
  /*
  #side_left{
  
 	width : 250px;

  
  }
*/
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
   		주문내역상세조회
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
 		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		 취소/교환/환불
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		 내정보관리
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
 	</ul>
 </div>
 
	
	<div class="container col-9">
<br>  <p class="text-center">More bootstrap 4 components on <a href="http://bootstrap-ecommerce.com/" target="_blank"> Bootstrap-ecommerce.com</a></p>
<hr>



<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Product</th>
  <th scope="col" width="120">Quantity</th>
  <th scope="col" width="120">Total Price</th>
  <th scope="col" width="200" class="text-right">Action</th>
</tr>
</thead>
<c:forEach var="MyPage" items="${myList}">
<tbody>
<tr>
<td>

<figure class="media">
	<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate">${MyPage.gName}</h6>
		<dl class="param param-inline small">
		  <dt>뭐냐: </dt>
		</dl>
<!-- 		<dl class="param param-inline small">
		  <dt>Color: </dt>
		</dl>-->
	</figcaption>
</figure> 
	</td>
	<td> 
<!-- 		<select class="form-control">
			<option>1</option>
			<option>2</option>	
			<option>3</option>	
			<option>4</option>	
		</select>  --> 
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price">${MyPage.gPrice}</var> 
			<!-- <small class="text-muted">(USD5 each)</small>  -->
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
	<a href="" class="btn btn-outline-danger myButton1"> 배송조회</a>
	</td>
	<td class="text-right"> 
	<a href="" class="btn btn-outline-danger"> 취소/반품 </a>
	</td>

</tr>
</tbody>
</c:forEach>
</table>
</div> <!-- card.// -->
            

</div> 
<!--container end.//-->
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
	
	</section>


	<br><br><br><br><br><br><br><br><br>
	
	
	<c:import url="../common/footer.jsp"/>

<script>
$(document).ready(function(){
    var myKey = "L9BDBCkGfZb1iAXf07ssLg"; // sweet tracker에서 발급받은 자신의 키 넣는다.
    
        // 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
                    
                    // 방법 1. JSON.parse 이용하기
                    var parseData = JSON.parse(JSON.stringify(data));
                     console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
                    
                    // 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
                    var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
                    console.log(CompanyArray); 
                    
                    var myData="";
                    $.each(CompanyArray,function(key,value) {
                            myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');                        
                    });
                    $("#tekbeCompnayList").html(myData);
            }
        });
    
        // 배송정보와 배송추적 tracking-api
        $(".myButton1").click(function() {
            var t_code = $('#tekbeCompnayList option:selected').attr('value');
            var t_invoice = $('#invoiceNumberText').val();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                    console.log(data);
                    var myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }else{
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"보내는사람"+'</td>');                     
                        myInvoiceData += ('<th>'+data.senderName+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
                        myInvoiceData += ('<th>'+data.itemName+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
                        myInvoiceData += ('</tr>');                                       
                    }
                    
                    
                    $("#myPtag").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;
                    
                    
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });
                    
                    $("#myPtag2").html(header+myTracking);
                    
                }
            });
        });
        
});
</script>


</body>
</html>











