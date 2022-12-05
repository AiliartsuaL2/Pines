<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pines</title>
<link href="images/pines.JPG" rel="shortcut icon" type="image/x-icon">
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
</head>
<script>
$(function(){
	var categoryId =$("#categoryId").val();
	var parentCategoryId =$("#parentCategoryId").val();
	if(parentCategoryId == ""){
		if(categoryId == 'seed'){
			$(".btn_seed").css({"color":"#FA6A6A","font-weight":"bold"});	
		}
		else if(categoryId == 'airplant'){
			$(".btn_airplant").css({"color":"#FA6A6A","font-weight":"bold"});	
		}
		else if(categoryId == 'potted'){
			$(".btn_potted").css({"color":"#FA6A6A","font-weight":"bold"});	
		}
		else if(categoryId == 'succulents'){
			$(".btn_succulents").css({"color":"#FA6A6A","font-weight":"bold"});	
		}
		else if(categoryId == 'orchid'){
			$(".btn_orchid").css({"color":"#FA6A6A","font-weight":"bold"});	
		}
		else if(categoryId == 'herb'){
			$(".btn_herb").css({"color":"#FA6A6A","font-weight":"bold"});	
		}	
	}
});
</script>
<style>
.div_Wrap{
  display: flex;
  justify-content: center;
   width:1920px;
}
.table_product{ 
	border: solid 1px #D5D5D5;
	text-align: center;
	margin-top: 20px; 
}

.div3{
	margin-left:5%;
	text-align:center;
	font-size:12pt;
	margin-top:10px;
}
header {
    height: 215px;
}
main {
}
footer {
    height: 310px;
}
a { text-decoration:none }
.table_title{
	margin-left:31%;
	margin-top: 2%;
    margin-bottom: -1%;
	font-size:15pt;
	font-weight:bold;
    height: 50px;
}
.div_table_title{
	width : 1920px;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
</style>
<body>
<div class = "whole_wrap">

<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/topMenu.jsp" %>
<%@ include file="../include/navigationBar.jsp" %>

	<div class = "div_table_title">
		<p class = "table_title"> 식물</p>
	</div>
	<div class = "div_Wrap">
	<div class="div3">
	<input type="hidden" id="parentCategoryId" value="${parentCategoryId.parentCategoryId}">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table class = "table_product" width="850">
	  <c:forEach items="${plantList}" var="result">
	  <input type="hidden" id="categoryId" value="${result.categoryId}">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
		<td onClick="location.href='productDetail.do?productId=${result.productId}'" style="cursor:pointer;"><a href="#" style='align:center'>
				<p><img src="${result.image1}" width="200" height="150" alt""/></p> </a> <p>${result.productName}</p><p>${result.productPrice}원</p></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
</div>
</div>
</main>
<footer>
	<div style="width:600px;margin-top:5px; text-align:center;">
		<c:choose> 
			<c:when test="${totalPage > 1}">
			<c:forEach var="i" begin="1" end="${totalPage}">
				<a href="plantList.do?viewPage=${i}">${i}</a>
			</c:forEach>
			</c:when> 
		</c:choose> 
	</div>
</footer>


<!-- 
<div style="width:600px;margin-top:5px; text-align:right;">
	<button type="button" onclick= "location='boardWrite.do'">글쓰기</button>
</div> -->
</div>
</body>
</html>