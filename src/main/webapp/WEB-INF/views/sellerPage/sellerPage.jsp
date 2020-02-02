
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
		<c:param name="titleName" value="판매자 : 주문정보조회"/>
	</c:import>

  
  <style>
  /*
  #side_left{
  
 	width : 250px;

  
  }
*/

/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
          }
          
         .badge-pill {
         	background-color : black;
         	color : white;
         }

.img-wrap2{
	height : 60px;
	width : 60px; 
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
   		주문내역조회
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		상품관리
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
 		
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
    	<a href="${pageContext.request.contextPath}/seller_Statistics/seller_Statistics.do">매출통계</a>
  		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		 취소/교환/환불조회
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
   		 내정보관리
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
 	</ul>
 </div>
 

   	<div class="col-md-9 content">
  	<div class="panel panel-default">
	<div class="panel-heading">
		${member.userName } 어서오세요~*
	</div>
	<hr>
	<div class="panel-body">
	
	<h6>오늘도 달콤입니다~*</h6>

	</div>
</div>
</div>
 

 
 
 
 <div class="container col-9">
 <div class="form-inline" id="myorderSearch">
 
 <div class="searchBtn_group">
 <button class="orderSearch" id="myorder1m"> 1개월 </button>
 <button class="orderSearch" id="myorder3m"> 3개월 </button>
 <button class="orderSearch" id="myorder6m"> 6개월 </button>
 </div>

 &nbsp;&nbsp;
 
 <input type="date" id="startDate"> ~ <input type="date" id="endDate"> 
 <button class="orderSearch" id="myorderS">날짜 직접 입력</button>
 </div>
 </div>

 
	
 <div class="container col-9">
 <br>  
 
 <p class="text-center"> 주문내역 </p>
 
 <hr>

<div class="menuCard">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col" width="100">주문번호</th>
  <th scope="col">Product</th>
  <th scope="col">Total Price</th>
  <th scope="col" class="text-right">Action</th>
</tr>
</thead>

<tbody>
<c:forEach var="orderedGood" items="${list}">

<tr>
<td>

	<div class="orderNo-wrap">
		<var class="orderNo">${orderedGood.orderNo}</var> 
	</div>
</td>	

<td>
<figure class="media">
	<div class="img-wrap"><img class="img-wrap2" src="${pageContext.request.contextPath }/resources/uploadimg/${orderedGood.changeName}" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate">${orderedGood.gName}</h6>
		<dl class="param param-inline small">
		  <dt>${orderedGood.category}</dt>
		</dl>
<!-- 		<dl class="param param-inline small">
		  <dt>Color: </dt>
		</dl>-->
	</figcaption>
</figure> 
	</td>
	
	<td> 
		<div class="price-wrap"> 
			<fmt:formatNumber value="${orderedGood.gPrice}" pattern="#,###" />
		</div> <!-- price-wrap .// -->
	</td>
	
	
	<td class="text-right"> 
	<!-- <a href="" class="btn btn-outline-danger myButton1"> 배송조회</a> -->
	
	<select class="orderChkNo" name="orderChkNo" for="${ orderedGood.goodNo}" data-status="${ orderedGood.orderChkNo }">
		<option value="0">기본</option>
		<option value="1">결제확인</option>
		<option value="2">결제완료</option>
		<option value="3">배송준비중</option>
		<option value="4">배송중</option>
		<option value="5">배송완료</option>
		<option value="8">취소진행중</option>
		<option value="9">취소완료</option>
		<option value="11">환불진행중</option>
		<option value="12">환불완료</option>
	</select>
	
	&nbsp;
	
	<button class="btn btn-outline-primary" id="changeStatusBtn" onclick="changeStatus(this,'${orderedGood.orderNo}','${ orderedGood.goodNo}');">주문 상태 변경</button>
	&nbsp;
	&nbsp;
	
	<!-- 배송조회 Modal Start -->

	<button class="btn btn-outline-danger shipBtn" name="${ orderedGood.trackingNo }"> 배송 정보 수정 </button>
	<input type="hidden" class="trCodeValue" value="${ orderedGood.trCode}">
	<input type="hidden" class="trNameValue" value="${ orderedGood.trName}">
	<input type="hidden" class="deliveryValue" value="${ orderedGood.deliveryNo}">
	&nbsp;&nbsp;
	</td>
	


</tr>

	</c:forEach>
</tbody>

</table>
</div> <!-- card.// -->



<!-- Modal -->

 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <input type="hidden" id="deliveryNo">
		<label id="tekbeLabel" for="tekbeCompanyName"> 택배 회사 명 : 
			<span id="tekbeCompanyName">
				<select id="tekbeCompanyCode">
				<c:forEach var="track" items="${ trlist }">
					<option value="${ track.trCode }">${track.trName}</option>
				</c:forEach>
				</select>
			</span>
		</label>
		<br/><br/>

		<label id="invoiceLabel" for="invoiceNumber">운송장 번호 : <input type="text" id="invoiceNumber"></label>
		<br/><br/>
		
		<button id="updateBtn">배송 정보 수정</button>
		<button id="myButton1">현재 배송 정보 조회</button>
	<br/>
	<br/>
	<div>
	
	<table id="myPtag"></table>
	</div>
	<br/>
	
	<div>
	<table id="myPtag2"></table>
	</div> 
        
      </div>
 		
    </div>

<!--container end.//-->
</div> 
	
	</section>


	<br><br><br><br><br><br><br><br><br>
	
	
	<c:import url="../common/footer.jsp"/>

<script>
//Get the modal
var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];  

//배송 전용 함수(이걸로 공통 소스 코드를 줄일 수 있어요!)
var myKey = "L9BDBCkGfZb1iAXf07ssLg";
var tekbeSelect = $('#tekbeCompanyName').html();

function searchShipment(myKey, trCode, trackingNo){
	if(trackingNo == '' || trCode == ''){
		
		$('#tekbeCompanyName').html(tekbeSelect);
		$('#updateBtn').show();
	} else {
		$('#updateBtn').hide();
		
		$.ajax({
	        type:"GET",
	        dataType : "json",
	        url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+trCode+"&t_invoice="+trackingNo,
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
	            });['']
	            
	            $("#myPtag2").html(header+myTracking);
	            
	        }
	    });
	}
}

$(function(){
	$('.orderChkNo').each(function(){
		$(this).children('[value=' + $(this).attr('data-status') + ']').prop('selected', true);
	});
	
	$('.shipBtn').on('click', function(){
		//console.log($(this).attr('name'));
		var trackingNo = $(this).attr('name');
		var trCode = $(this).siblings('.trCodeValue').val();
		var trName = $(this).siblings('.trNameValue').val();
		var deliveryNo = $(this).siblings('.deliveryValue').val();
		console.log(trCode);
		console.log(trName);
		console.log(deliveryNo);
		
		if(trackingNo == '') {
			$('#tekbeCompanyName').html(tekbeSelect);
			$('#deliveryNo').val(deliveryNo);
			$('#invoiceNumber').attr('placeholder','운송장 번호를 입력해주세요.');
			$('#updateBtn').show();
		} else {
			$('#deliveryNo').val(deliveryNo);
			$('#tekbeCompanyName').attr('name', trCode);
			$('#tekbeCompanyName').text(trName);
			$('#invoiceNumber').val(trackingNo);
			$('#updateBtn').hide();
			
			searchShipment(myKey, trCode, trackingNo);
		}
		
		//$('#invoiceNumberText').each(function(){
		//	alert($(this).attr('name') + $(this).attr('value'));
		//});
		
		modal.style.display = 'block';
		 
	});
	
});

function changeStatus(obj, orderNo, goodsNo){
	var orderChkNo = $(obj).siblings('.orderChkNo').val();
	$.ajax({
		url : "${pageContext.request.contextPath}/myPage/orderChkUpdate.do",
		data : {
			orderNo : orderNo, 
			goodsNo : goodsNo,
			orderChkNo : orderChkNo
		}, 
		success : function(data){
			if(data == 1){
				alert("주문 정보 변경 완료!");					
			} else {
				alert("주문 정보 변경 실패!");
			}
			
		}, error : function(data){
			alert("주문정보 변경 중 에러 발생!");
		}
	});
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


/* 배송조회 */

 $(document).ready(function(){
	 
	    // 스마트 택배 배송조회에서 발급 받은 APIKEY를 Parameter값에 추가
    
        // 스마트 택배 배송조회 API 에서 제공받은 택배사 목록 코드를 form 창에 mapping
        // 택배사 목록 조회 api
        
        // 택배사 코드와 운송장 번호를 Parameter(파리미터)값에 추가
        // POST 방식으로 URL을 호출

		// 완성된 form 에서 택배회사를 선택하고 운송장 번호를 입력하면 배송정보를 확인가능
    
		
        // 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
			
            searchShipment(myKey, $('#tekbeCompanyName').attr('name'), $('#invoiceNumber').val());

        });
        
        $("#updateBtn").click(function() {
        	var deliveryNo = $('#deliveryNo').val();
        	var trCode = $('#tekbeCompanyCode').val();
			var trackingNo = $('#invoiceNumber').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/myPage/deliveryUpdate.do',
				data : { deliveryNo : deliveryNo, trCode : trCode, trackingNo : trackingNo },
				success : function(data) {
					if(data == 1) {
						alert("정보 수정 성공!");
					} else {
						alert("정보 수정 실패!");
					}
				}, error : function(data) {
					console.log(data);
				}
			});
        });
        
}); 
</script>


</body>
</html>