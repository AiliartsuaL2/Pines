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
</head>
<style>
.table_product{ 
	border: solid 1px #D5D5D5;
	text-align: center;
	margin-top: 20px; 
}

.div3{
	text-align:center;
	font-size:12pt;
	margin-top:10px;
	margin-left:100px;
}
header {
	margin-left:150px;
    height: 215px;
}
main {
	margin-left:150px;
}
footer {
    height: 310px;
}
a { text-decoration:none }
.table_title{
	margin-top:20px;
	margin-left:100px;
	font-size:15pt;
	font-weight:bold;
    height: 50px;
}

</style>
<body>

<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/topMenu.jsp" %>
	<table class ="table_title">
		<tr>
			<th>꽃/화환</th>
		</tr>
	</table>
	
	<div class="div3">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table class = "table_product" width="850">
	  <c:forEach items="${flowerList}" var="result">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
		<td onClick="location.href='${result.productId}.do'" style="cursor:pointer;"><a href="#" style='align:center'>
				<p><img src="${result.image1}" width="200" height="150" alt""/></p> </a> <p>${result.productName}</p><p>${result.productPrice}원</p></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
</div>
</main>
<footer>
</footer>


<!-- 
<div style="width:600px;margin-top:5px; text-align:right;">
	<button type="button" onclick= "location='boardWrite.do'">글쓰기</button>
</div> -->

</body>
</html>