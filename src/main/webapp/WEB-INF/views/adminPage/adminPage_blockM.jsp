
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
	<c:param name="titleName" value="관리자:블랙리스트 관리" />
</c:import>


<style>
.badge-pill {
	background-color: black;
	color: white;
}
</style>

</head>


<body class="animsition">
	<c:import url="../common/header.jsp" />
	<c:import url="../common/cart.jsp" />


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>




	<!-- 시작 -->
	<section class="container">
		<div class="row">
			<div id="side_left" class="col-3">
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
			<div class="p-t-33 col-9">
				<div class="row">
					<div class="col-4">
						<div class="respon6-next">
							<div class="rs1-select2 bor8 bg0">
								<select class="js-select2" name="filter" id="filter">
									<option value="4">정지회원</option>
									<option value="0">모든회원</option>
								</select>
								<div class="dropDownSelect2"></div>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55"
								type="text" name="userId" id="searchId" placeholder="회원 검색...">

							<button
								class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchIdBtn">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="container">
						<br>

						<hr>



						<div class="card">
							<table class="table table-hover shopping-cart-wrap">
								<thead class="text-muted">
									<tr>
										<th scope="col">회원번호</th>
										<th scope="col">회원이름</th>
										<th scope="col">회원등급</th>
										<th scope="col" class="text-center">회원정지 관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="adminPage" items="${MemSearch}">
								
									<tr>
										<td>
											${MemSearch.userId}
										</td>
										
										<td> 
											${MemSearch.memType}
										</td>
										
										<td>
											${MemSearch.status}
										</td>
									
										<td> 
										
										</td>
									
									</tr>
									
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--container end.//-->

	</section>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<c:import url="../common/footer.jsp" />

	<script>
		$(document).ready(function(e) {
			$('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();

				var param = $(this).attr("href").replace("#", "");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
			});
		});
		
		// 회원조회하기

		$(function(){
			$('#searchIdBtn').on('click', function(){
				
				var filter = $("#filter").val();
				var searchId = $("#searchId").val();
				
				var mem = $("#mem");
				var sell = $("#sell");
				var all = $("#all");
				
				if (searchId == '') {
					
					alert("ID를 입력해주세요!");
					
				} else {
					
					$.ajax({
						url : '${pageContext.request.contextPath}/admin/memSearch.do',
						data: {
							userId : searchId,
							userCodeNo : filter
						},
						dataType : 'json',
						success : function(data){
							
							var tbody = $('tbody');
							
							tbody.empty();
							
							console.log(data);
							for(var i in data){
								var tr1 = $('<tr>');
								
								var td1 = $('<td>').text(data[i].userNo);
								
								var td2 = $('<td>').text(data[i].userId);
								
								var td3 = $('<td>').text(data[i].memType);
								
								var td4 = $('<td class="text-right">');
								
								if (data[i].memType != '정지회원'){
									td4.append('<button class="btn btn-dark memBlock">회원 정지</button>&nbsp&nbsp');									
								} else {
									td4.append('<button class="btn btn-primary memUnBlock">정지 취소</button>&nbsp&nbsp');									
								}
								
								tr1.append(td1).append(td2).append(td3).append(td4);
								
								tbody.append(tr1);
							}
							
							$('.memBlock').on('click', function(){                                             
								var userId = $($(this).parent().parent().children()[1]).text();
								
								$.ajax({
									url :  '${pageContext.request.contextPath}/admin/memBlock.do',
									type : 'post',
									data : { userId : userId},
									success : function(data){
										
										if(data == 1){
											tbody.empty();
											alert("회원 정지 상태 변경 완료!");
											
										} else {
											alert("변경에 실패하였습니다");
										}
										
									}, error : function(data){
										console.log(data);
									}
								});	
							});
							
							$('.memUnBlock').on('click', function(){                                             
								var userId = $($(this).parent().parent().children()[1]).text();
								
								$.ajax({
									url :  '${pageContext.request.contextPath}/admin/memUnBlock.do',
									type : 'post',
									data : { userId : userId},
									success : function(data){
										
										if(data == 1){
											tbody.empty();
											alert("회원 정지 상태 변경 완료!");
											
										} else {
											alert("변경에 실패하였습니다");
										}
										
									}, error : function(data){
										console.log(data);
									}
								});	
							});
						}
					});
				}
			});
		});

	</script>


</body>
</html>










