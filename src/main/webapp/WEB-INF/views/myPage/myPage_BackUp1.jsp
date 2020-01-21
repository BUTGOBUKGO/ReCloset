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
		<c:param name="titleName" value="마이페이지"/>
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
         
         
         /* 기간검색 css */
         
         .orderSearch{
         
         border: 1px solid skyblue; 
         background-color: rgba(0,0,0,0); 
         color: skyblue; 
         padding: 5px;
         
         }
         
         #myorder1m{
         border-top-left-radius: 5px; 
         border-bottom-left-radius: 5px; 
         margin-right:-3px;
         
         }
         
         #myorder3m{
         
         margin-left:-3px;

         }
         
         #myorder6m{
         
         border-top-right-radius: 5px; 
         border-bottom-right-radius: 5px; 
         margin-left:-4px;
         
         }
         
         #searchBtn_group{
         border: 1px solid skyblue; 
         background-color: rgba(0,0,0,0); 
         color: skyblue; 
         padding: 5px;
		  }
         
         #myorderSearch{
         
         border-top-right-radius: 5px; 
         
         }
         
         
         .panel {
		 	border : 1px solid gainsboro;
		    width: 700px;
            height: 150px;
		 }
		 

		 

         
         
/*          #searchBtn_group:hover{ 
         color:white; 
         background-color: skyblue; } */

         
         
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
  		<button class="myInfoSide" id="orderDetail"> 주문내역상세조회 </button>
    	<span class="badge badge-primary badge-pill">14</span>
 		</li>
 		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<button class="myInfoSide" id="cancleThing"> 취소/교환/환불 </button>
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
  		<li class="list-group-item d-flex justify-content-between align-items-center">
  		<button class="myInfoSide" id="myInfo"> 내정보관리 </button>
    	<span class="badge badge-primary badge-pill">2</span>
  		</li>
  		
 	</ul>
 </div>
 
 
  	<div class="col-md-9 content">
  	<div class="panel panel-default">
	<div class="panel-heading">
		이서안님 어서오세요~*
	</div>
	<hr>
	<div class="panel-body">
	
	 <button class="myInfoBar" id="cupon"> 내쿠폰 </button>
 	 <button class="myInfoBar" id="myorder"> 주문내역조회 </button>
 	 <button class="myInfoBar" id="saving"> 적립금 </button>
	
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

 &nbsp;&nbsp;<input type="date" id="startDate"> ~ <input type="date" id="endDate"> 
 <button class="orderSearch" id="myorderS">날짜 직접 입력</button>
 </div>
 </div>

 
	
 <div class="container col-9">
 <br>  
 
 <p class="text-center">
 More bootstrap 4 components on 
 <a href="http://bootstrap-ecommerce.com/" target="_blank">
 Bootstrap-ecommerce.com</a> </p>
 
 <hr>

<div class="menuCard">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Product</th>
  <th scope="col" width="120">Quantity</th>
  <th scope="col" width="120">Total Price</th>
  <th scope="col" width="200" class="text-right">Action</th>
</tr>
</thead>
<tbody>
<c:forEach var="MyPage" items="${myList}">
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
	<td></td>
	<td> 
		<div class="price-wrap"> 
			<var class="price"><fmt:formatNumber value="${MyPage.gPrice}" pattern="#,###" /></var> 
			<!-- <small class="text-muted">(USD5 each)</small>  -->
		</div> <!-- price-wrap .// -->
	</td>
	
	
	<td class="text-right"> 
	<!-- <a href="" class="btn btn-outline-danger myButton1"> 배송조회</a> -->
	
	<!-- 배송조회 Modal Start -->

	<button class="btn btn-outline-danger shipBtn" name="${ MyPage.trackingNo }"> 배송조회 </button>
	<%-- <input type="hidden" value="${ MyPage.shipCompnay}"> --%>
	&nbsp;&nbsp;
	<a href="" class="btn btn-outline-danger"> 취소/반품 </a>
	</td>
	


</tr>

	</c:forEach>
</tbody>
<%-- </c:forEach> --%>
</table>
</div> <!-- card.// -->



<!-- Modal -->

 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>
        
<span id="tekbeCompnayName">택배회사명: </span>
<select id="tekbeCompnayList" name="tekbeCompnayList"></select><br/><br/>

<span id="invoiceNumber">운송장번호: </span>
<input type="text" id="invoiceNumberText" name="invoiceNumberText"><br/><br/>
<button id="myButton1">택배 조회하기 </button>
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

</div> 
<!--container end.//-->
	</div>
	<!-- 
	<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
	 -->
	</section>


	<br><br><br><br><br><br><br><br><br>
	
	
	<c:import url="../common/footer.jsp"/>

<script>

/* 모달창 */

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
// var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

// When the user clicks on the button, open the modal 
$(function(){
	$('.shipBtn').on('click', function(){
		//console.log($(this).attr('name'));
		 
		$('#invoiceNumberText').val($(this).attr('name'));
		 
		//$('#invoiceNumberText').each(function(){
		//	alert($(this).attr('name') + $(this).attr('value'));
		//});
		
		
		
		modal.style.display = 'block';
		 
	});
});

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
    var myKey = "L9BDBCkGfZb1iAXf07ssLg";
    
        // 스마트 택배 배송조회 API 에서 제공받은 택배사 목록 코드를 form 창에 mapping
        // 택배사 목록 조회 api
        
        
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
        
        // 택배사 코드와 운송장 번호를 Parameter(파리미터)값에 추가
        // POST 방식으로 URL을 호출

		// 완성된 form 에서 택배회사를 선택하고 운송장 번호를 입력하면 배송정보를 확인가능
    
        // 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
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
                    });['']
                    
                    $("#myPtag2").html(header+myTracking);
                    
                }
            });
        });
        
}); 

	$('#myorder1m').click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/myPage/myorder1m.do',
			dataType : 'json',
			success : function(data){
				console.log(data);
				var tbody = $('tbody');
				
				tbody.empty();
				
				for(var i in data){
					var tr1 = $('<tr>');
					var td1_1 = $('<td>');
					td1_1.append('<figure class="media">'+
							'<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>'+
							'<figcaption class="media-body">'+
								'<h6 class="title text-truncate">' + data[i].gName + '</h6>'+
								'<dl class="param param-inline small">'+
								 '<dt>뭐냐: </dt>'+
								'</dl>'+
							'</figcaption>'+
						'</figure>');
					
					var td1_2 = $('<td>');
					td1_2.append('<div class="price-wrap">'+
						'<var class="price">' + numberWithCommas(data[i].gPrice) + '</var>'+
					'</div>');
					
					var td1_3 = $('<td>');
					
					var td1_4 = $('<td class="text-right">');
					td1_4.append('<button class="btn btn-outline-danger shipBtn" name="' + data[i].trackingNo + '"> 배송조회 </button>' +
							'&nbsp;&nbsp;' +
							'<a href="" class="btn btn-outline-danger"> 취소/반품 </a>');
					
					tr1.append(td1_1).append(td1_2).append(td1_3).append(td1_4);
					
					tbody.append(tr1);
				}
				
				$('.shipBtn').on('click', function(){
					console.log($(this).attr('name'));
					$('#invoiceNumberText').val($(this).attr('name'));
					
					modal.style.display = 'block';
					 
				});
				
			}, error : function(data){
				console.log(data);
			}
		});
	});
	
	$('#myorder3m').click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/myPage/myorder3m.do',
			dataType : 'json',
			success : function(data){
				console.log(data);
				var tbody = $('tbody');
				
				tbody.empty();
				
				for(var i in data){
					var tr1 = $('<tr>');
					var td1_1 = $('<td>');
					td1_1.append('<figure class="media">'+
							'<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>'+
							'<figcaption class="media-body">'+
								'<h6 class="title text-truncate">' + data[i].gName + '</h6>'+
								'<dl class="param param-inline small">'+
								 '<dt>뭐냐: </dt>'+
								'</dl>'+
							'</figcaption>'+
						'</figure>');
					
					var td1_2 = $('<td>');
					td1_2.append('<div class="price-wrap">'+
						'<var class="price">' + numberWithCommas(data[i].gPrice) + '</var>'+
					'</div>');
					
					var td1_3 = $('<td>');
					
					var td1_4 = $('<td class="text-right">');
					td1_4.append('<button class="btn btn-outline-danger shipBtn" name="' + data[i].trackingNo + '"> 배송조회 </button>' +
							'&nbsp;&nbsp;' +
							'<a href="" class="btn btn-outline-danger"> 취소/반품 </a>');
					
					tr1.append(td1_1).append(td1_2).append(td1_3).append(td1_4);
					
					tbody.append(tr1);
				}
				
				$('.shipBtn').on('click', function(){
					console.log($(this).attr('name'));
					$('#invoiceNumberText').val($(this).attr('name'));
					
					modal.style.display = 'block';
					 
				});
				
			}, error : function(data){
				console.log(data);
			}
		});
	});
	
	$('#myorder6m').click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/myPage/myorder6m.do',
			dataType : 'json',
			success : function(data){
				console.log(data);
				var tbody = $('tbody');
				
				tbody.empty();
				
				for(var i in data){
					var tr1 = $('<tr>');
					var td1_1 = $('<td>');
					td1_1.append('<figure class="media">'+
							'<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>'+
							'<figcaption class="media-body">'+
								'<h6 class="title text-truncate">' + data[i].gName + '</h6>'+
								'<dl class="param param-inline small">'+
								 '<dt>뭐냐: </dt>'+
								'</dl>'+
							'</figcaption>'+
						'</figure>');
					
					var td1_2 = $('<td>');
					td1_2.append('<div class="price-wrap">'+
						'<var class="price">' + numberWithCommas(data[i].gPrice) + '</var>'+
					'</div>');
					
					var td1_3 = $('<td>');
					
					var td1_4 = $('<td class="text-right">');
					td1_4.append('<button class="btn btn-outline-danger shipBtn" name="' + data[i].trackingNo + '"> 배송조회 </button>' +
							'&nbsp;&nbsp;' +
							'<a href="" class="btn btn-outline-danger"> 취소/반품 </a>');
					
					tr1.append(td1_1).append(td1_2).append(td1_3).append(td1_4);
					
					tbody.append(tr1);
				}
				
				$('.shipBtn').on('click', function(){
					console.log($(this).attr('name'));
					$('#invoiceNumberText').val($(this).attr('name'));
					
					modal.style.display = 'block';
					 
				});
				
			}, error : function(data){
				console.log(data);
			}
		});
	});
	
	$('#myorderS').click(function(){
		var startDate = new Date($('#startDate').val());
		var endDate = new Date($('#endDate').val());
		$.ajax({
			url : '${pageContext.request.contextPath}/myPage/myorderS.do',
			data : {
				startDate : startDate.format("yyMMdd"),
				endDate : endDate.format("yyMMdd")
			},
			dataType : 'json',
			success : function(data){
				console.log(data);
				var tbody = $('tbody');
				
				tbody.empty();
				
				for(var i in data){
					var tr1 = $('<tr>');
					var td1_1 = $('<td>');
					td1_1.append('<figure class="media">'+
							'<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>'+
							'<figcaption class="media-body">'+
								'<h6 class="title text-truncate">' + data[i].gName + '</h6>'+
								'<dl class="param param-inline small">'+
								 '<dt>뭐냐: </dt>'+
								'</dl>'+
							'</figcaption>'+
						'</figure>');
					
					var td1_2 = $('<td>');
					td1_2.append('<div class="price-wrap">'+
						'<var class="price">' + numberWithCommas(data[i].gPrice) + '</var>'+
					'</div>');
					
					var td1_3 = $('<td>');
					
					var td1_4 = $('<td class="text-right">');
					td1_4.append('<button class="btn btn-outline-danger shipBtn" name="' + data[i].trackingNo + '"> 배송조회 </button>' +
							'&nbsp;&nbsp;' +
							'<a href="" class="btn btn-outline-danger"> 취소/반품 </a>');
					
					tr1.append(td1_1).append(td1_2).append(td1_3).append(td1_4);
					
					tbody.append(tr1);
				}
				
				$('.shipBtn').on('click', function(){
					console.log($(this).attr('name'));
					$('#invoiceNumberText').val($(this).attr('name'));
					
					modal.style.display = 'block';
					 
				});
				
			}, error : function(data){
				console.log(data);
			}
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	Date.prototype.format = function(f) {
		if (!this.valueOf()) return " ";

		var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		var d = this;
		
		return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
			switch ($1) {
				case "yyyy": return d.getFullYear();
				case "yy": return (d.getFullYear() % 1000).zf(2);
				case "MM": return (d.getMonth() + 1).zf(2);
				case "dd": return d.getDate().zf(2);
				case "E": return weekName[d.getDay()];
				case "HH": return d.getHours().zf(2);
				case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
				case "mm": return d.getMinutes().zf(2);
				case "ss": return d.getSeconds().zf(2);
				case "a/p": return d.getHours() < 12 ? "오전" : "오후";
				default: return $1;
			}
		});
	};

	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
</script>


</body>
</html>










