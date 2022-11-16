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
<script>
$(function(){
	$(document).ready( function() { 
		alert("판매자만 사용 가능한 페이지입니다.");
		return false;
		});
	});
</script>
</head>
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
	margin-top:20px;
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
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("잘못된 접근입니다.");
  document.location.href="mainList.do";
 </script>
<%
  return;
 }
%>


<body>

<div class = "whole_wrap">
<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/topMenu.jsp" %>

<div class = "div_table_title">
	<table class ="table_title">
		<tr>
			<th>판매자 등록 신청</th>
		</tr>
	</table>
</div>
	<div class = "div_Wrap">
		<div class="div3">
	
		</div>
	</div>
</main>
<footer>
</footer>


<!-- 
<div style="width:600px;margin-top:5px; text-align:right;">
	<button type="button" onclick= "location='boardWrite.do'">글쓰기</button>
</div> -->
</div>

</body>
</html>