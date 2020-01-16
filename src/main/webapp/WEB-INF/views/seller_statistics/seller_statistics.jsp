<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/commonUtil.jsp">
	<c:param name="titleName" value="통계 페이지"/>
</c:import>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


input[type="number"] {
	min-width: 50px;
}
/* 원형 차트 */
.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}
/* 월별 매출액 */


</style>
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>

   <section class="bg0 m-t-50 p-t-23 p-b-140">
		<div class="container">
			<figure class="highcharts-figure">
			    <div id="container1"></div>
			</figure>
			<figure class="highcharts-figure">
			    <div id="container2"></div>
			    <p class="highcharts-description">
			    	매출액이 0원인 달은 표시되지 않습니다.
			    </p>
			</figure>
		</div>
    </section>
    
    <c:import url="../common/footer.jsp"/>
    <!-- 월별 매출액 그래프 -->
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <script>
    
    function fn_nvl(obj){
    	if(obj == null) {
    		return 0;
    	}
    	 return obj;
    }
    
    $(function(){
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/seller_Statistics/seller_Statistics.stat',
    		type : 'get',
    		dataType: 'json',
    		success : function(data){
    			console.log(data);
    			
    			var pieChart = [];
    			
    			for (var i in data.gender){
    				var gen = data.gender[i][0] == 'M' ? '남성' : '여성';
    				
    				pieChart.push({name : gen, y : Number(data.gender[i][1])}); 
    			}
    			
    			var columnType = []; // 월 기준
    			var columnChart = []; // 월 별 매출액

    			for(var i in data.month){
    				if(data.month[i][0] != null){
	    				columnType.push(data.month[i][0]);
	    				columnChart.push(Number(data.month[i][1]));
    				}
    			}
    			
    			Highcharts.chart('container1', {
    			    chart: {
    			        plotBackgroundColor: null,
    			        plotBorderWidth: null,
    			        plotShadow: false,
    			        type: 'pie'
    			    },
    			    title: {
    			        text: '구매자 성비'
    			    },
    			    tooltip: {
    			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    			    },
    			    accessibility: {
    			        point: {
    			            valueSuffix: '%'
    			        }
    			    },
    			    plotOptions: {
    			        pie: {
    			            allowPointSelect: true,
    			            cursor: 'pointer',
    			            dataLabels: {
    			                enabled: true,
    			                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
    			            }
    			        }
    			    },
    			    series: [{
    			        name: '성별',
    			        colorByPoint: true,
    			        data: pieChart
    			    }]
    			});
    			
    			Highcharts.chart('container2', {
    			    chart: {
    			        type: 'column'
    			    },
    			    title: {
    			        text: '월 별 매출액'
    			    },
    			    subtitle: {
    			        text: 'Source: https://www.recloset.com '
    			    },
    			    xAxis: {
    			        categories: columnType,
    			        crosshair: true
    			    },
    			    yAxis: {
    			        min: 0,
    			        title: {
    			            text: '단위 (원)'
    			        }
    			    },
    			    tooltip: {
    			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
    			            '<td style="padding:0"><b>￦{point.y:.0f}</b></td></tr>',
    			        footerFormat: '</table>',
    			        shared: true,
    			        useHTML: true
    			    },
    			    plotOptions: {
    			        column: {
    			            pointPadding: 0.2,
    			            borderWidth: 0
    			        }
    			    },
    			    series: [{
    			        name: '월 별 매출액',
    			        data: columnChart

    			    }]
    			});

    			
    			
    		}
    	// highcharts-tooltip / top_n
    	});
    
    });
    </script>
</body>
</html>