<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#searchForm{
   padding : 25px;
   background : white;
   border : 1px solid rgb(204, 204, 204);
} 
#SearchRankcontent {
    padding: 10px;
    background: #white;
    padding-left : 20px;
    padding-top : 15px;
    
}
#rank-list a {
    color: #9EA6E1;
    text-decoration: none;
}


#rank-list {
    overflow: hidden;
    width: 160px;
    height: 20px;
    margin: 0;
}

#rank-list dt {
    display: none;
}

#rank-list dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
    height: 20px;
    line-height: 20px;
}
#rank-list2 a {
   color : rgb(204, 204, 204);
}
#SearchRankcontent2{
    width: 200px;
    height: 200px;
    background : white;
    z-index : 5;
}
#SearchRankcontent2 dt {
   padding: 8px;
    text-align: center;
    color: gray;
    font-weight : lighter;
    padding-bottom : 5px;
    
}
#SearchRankcontent2 a {
   text-align: left;
    padding-left: 7px;
    padding-top: 7px;
    color: gray;
    font-weight : lighter;
    padding-buttom : 5px;
    
}
#SearchRankForm {
   width : auto;
   height : auto;
}
#categorySearch {
   /* margin-left: 130px; */
    margin-right: 10px;
}
#optionSearch {
   margin-right: 20px;
}
#searchForm {
width: auto;
    height: 120px;
}
#searchRankBackground {
   background : white;
}
</style>
</head>


<body class="animsition">
   <br /><br /><br /><br /><br /> 
   
<div>

   <form method="post" id="searchForm">
   <div class="container">
      <div class="row">
         <div class="form-inline justify-content-center col-sm-12 col-md-9" style="height: 50px;">
            <select class="form-control" id="categorySearch" name="category">
               <option value=1>패션잡화</option>
               <option value=2>악세사리</option>
               <option value=3>여성의류</option>
               <option value=4>남성의류</option>
               <option value=5>기타</option>
            </select>
            <select class="form-control" id="optionSearch" name="optionSearch">
               <option value="gname">이름</option>
               <option value="seller">판매자</option>
            </select>
            <!--  <div class="bor17 of-hidden pos-relative">
            <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">
      
            <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" type="button" onclick="searchGo()">
            <i class="zmdi zmdi-search"></i>
               </button> -->
            <div class="bor17 of-hidden pos-relative">
               <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchName" placeholder="Search">
               <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchButton" onclick="searchGo();" type="button">
                  <i class="zmdi zmdi-search"></i>
               </button>
            </div>
         </div>
         
         <div class="justify-content-center col-sm-12 col-md-3">
            <div class="bor17 of-hidden pos-relative" id="searchRankBackground" style="background:  white; z-index:100 ;">
               <div id="SearchRankcontent" class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55">
               <div class="form-inline">
                     <dl id="rank-list">
                         <dt>실시간 급상승 검색어</dt>
                         <dd>
                             <ol style= "text-align:left">
                                 <li id="rank-list-1"><a href="#">1 순위</a></li>
                                 <li id="rank-list-2"><a href="#">2 순위</a></li>
                                 <li id="rank-list-3"><a href="#">3 순위</a></li>
                                 <li id="rank-list-4"><a href="#">4 순위</a></li>
                                 <li id="rank-list-5"><a href="#">5 순위</a></li>
                                 <li id="rank-list-6"><a href="#">6 순위</a></li>
                                 <li id="rank-list-7"><a href="#">7 순위</a></li>
                                 <li id="rank-list-8"><a href="#">8 순위</a></li>
                                 <li id="rank-list-9"><a href="#">9 순위</a></li>
                                 <li id="rank-list-10"><a href="#">10 순위</a></li>
                             </ol>
                         </dd>
                     </dl>
                        <button id="SearchRankBtn" style= "text-align:right; color:gray" type="button" onclick="BtnShow();">▼</button>
                     
               </div>               
                 </div>
                  <div id="SearchRankcontent2" style="position: inherit; display: none; background: white; height: auto; z-index: 100;" >
                     <dl id="rank-list2">
                         <dt>실시간 급상승 검색어</dt>
                         <dd>
                             <ol style= "text-align:left">
                                 <li id="rank-list-1"><a href="#">1 &nbsp;</a></li>
                                 <li id="rank-list-2"><a href="#">2 &nbsp;</a></li>
                                 <li id="rank-list-3"><a href="#">3 &nbsp;</a></li>
                                 <li id="rank-list-4"><a href="#">4 &nbsp;</a></li>
                                 <li id="rank-list-5"><a href="#">5 &nbsp;</a></li>
                                 <li id="rank-list-6"><a href="#">6 &nbsp;</a></li>
                                 <li id="rank-list-7"><a href="#">7 &nbsp;</a></li>
                                 <li id="rank-list-8"><a href="#">8 &nbsp;</a></li>
                                 <li id="rank-list-9"><a href="#">9 &nbsp;</a></li>
                                 <li id="rank-list-10"><a href="#">10 &nbsp;</a></li>
                             </ol>
                         </dd>
                     </dl>
                    
               </div>
                 </div>
         </div>
      </div>
   </div>
   </form>
   </div>
   
   
   
   
<script>

function searchGo() {

   var category = document.getElementById("categorySearch");
   var optionSearch = document.getElementById("optionSearch");

   console.log(optionSearch.value);
   console.log(categorySearch.value);

   switch (optionSearch.value) {
   case 'gname' :
      $('#searchForm').attr("action", "${pageContext.request.contextPath}/search/gnameSearch.ser");
 
      break;
   case 'seller':
      $('#searchForm').attr("action", "${pageContext.request.contextPath}/search/sellerSearch.ser");
 
      break;
   }
   $('#searchForm').submit();

}

   $(function(){
      
      $.ajax({
         url : '${pageContext.request.contextPath}/searchRank/searchRank.rank',
         type : 'get',
         dataType : 'json',
         async : false,
         success : function(data){
            
         var realTimeRank = [];
         var list = document.getElementById("SearchRankcontent").getElementsByTagName("li");
         var list2 = document.getElementById("SearchRankcontent2").getElementsByTagName("li");
         var j = 0;
         // console.log(list);
         // console.log(data);
         for(var i in data){
            realTimeRank.push({Rank : data[i][0], SearchName : data[i][1]});
         }
         // console.log(realTimeRank);
         
         for(var i in realTimeRank){
            // console.log(realTimeRank[i].SearchName);
            if(realTimeRank[i].SearchName != null){
               $(list[j]).append(" " + realTimeRank[i].SearchName);
               $(list2[j]).append(" " + realTimeRank[i].SearchName);

            }
            j++;
         }
         var count = $('#rank-list li').length;
         var height = $('#rank-list li').height();
         
         function step(index) {
            $('#rank-list ol').delay(2000).animate({
               top: -height * index,
            }, 500, function(){
               step((index + 1) % count);
            });
         }
         
         step(1);
      
         
         
      }
   
      
      })
})
function BtnShow(){
            var con = document.getElementById("SearchRankcontent2");
            if(con.style.display=='none'){
               con.style.display = 'block';
            } else {
               con.style.display = 'none';
            }
            
            }

</script>

   
</body>
</html>