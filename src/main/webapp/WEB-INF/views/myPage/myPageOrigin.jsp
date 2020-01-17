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
</head>


<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br><br><br><br><br><br><br>
	
	<section>
	

	<!-- Shoping List -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl"> 
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">주문일자</th>
									<th class="column-2">주문번호</th>
									<th class="column-3">주문상품</th>
									<th class="column-4">주문금액</th>
									<th class="column-5">배송조회</th>
									<th class="column-6">취소/반품</th>
								</tr>

								<tr class="table_row">
									<td class="column-1">20201010</td>
									<td class="column-2">11</td>
									<td class="column-3">
										<div class="how-itemcart1">
											<img src="${pageContext.request.contextPath}/resources/images/item-cart-04.jpg" alt="IMG">
											${Goods.gname }
										</div>
									</td>
									<td class="column-4">50,000</td>
									<td class="column-5">배송중</td>
									
									<!-- 여기에 버튼 만들기 -->
									<!-- 배송전 : 주문취소, 배송완료 : 반품 -->
									<td class="column-6">취소/반품</td>
								</tr>

								<tr class="table_row">
									<td class="column-1">20201010</td>
									<td class="column-2">12</td>
									<td class="column-3">
										<div class="how-itemcart1">
											<img src="${pageContext.request.contextPath}/resources/images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-4">70,000</td>
									<td class="column-5">배송완료</td>
									<td class="column-6">취소/반품</td>
								</tr>
							</table>
						</div>

						</div>
					</div>
				</div>
				
				
				
				
				<!-- Sidebar -->
				
		<div class="col-xs-6 col-md-4">
          <aside class="aa-sidebar">
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
              <h3>나의 페이지</h3>
              <ul class="aa-catg-nav">      
             <li><a href="MacaronicsServlet?command=cart_list">주문내역</a></li>
              <li><a href="MacaronicsServlet?command=mypage">loremipsum</a></li>
              <li><a href="MacaronicsServlet?command=order_all">loremipsum</a></li>              
              </ul>
            </div>
         </aside>         
        </div>



						</div>
					</div>
				</div>
			</div>
		</div>
	</form>	
	
	
	</section>
	
	<br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp"/>

</body>
</html>