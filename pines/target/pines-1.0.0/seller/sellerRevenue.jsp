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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	float : left;
	font-size:15pt;
	font-weight:bold;
    height: 50px;
}
.div_table_title{
	width : 50%;
	height : 80%;
	position : absolute;    
	left: 38%;
    top: 32%;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.id_input_box{
    width: 38%;
    position: absolute;
    left: 40%;
    top: 40%;
}


.product_table{
	border: 1px solid #A5A5A5;
	width:100%;
	border-collapse : collapse;
	border-spacing : 0;
	
}
.table_head{
	border: 1px solid #A5A5A5;
	background-color : #FCDDDC;

}
.table_cell{
	border: 1px solid #A5A5A5;
}

.btn_wrap{
	margin-left:41%;
	margin-top:5%;
}
.btn_submit{
	background-color : #FA6A6A;
	color:white;
	margin-top:1.5%;
	border : 0;
	cursor : pointer;
	font-size:13px;
	width:36%;
	height:10%;
	font-weight:bold;
}


.category_btn_order{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#A5A5A5;
    cursor: pointer;
}
.category_btn_info{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#FA6A6A;
    cursor: pointer;
}
.category_btn_payment{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#A5A5A5;
    cursor: pointer;
}

.val{    
	width: 50%;
	color : black;
    font-size: 11pt;
    text-align: center;
    border: none;
    background-color: white;
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
<%@ include file="../include/sellerOrderTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 정산</p>
	</div>
	<div class="id_input_box">
	<form id="frmData">
	<table class = "product_table">
		<c:forEach items="${revenueList}" var="revenue" varStatus="status">
		<tr>
			<th class="table_head" width="10%">날짜</th>
			<th class="table_head" width="7%">판매 건수</th>
			<th class="table_head" width="10%">판매 금액</th>
			<th class="table_head" width="5%">정산</th>
		</tr>
		<tr class="pr_tr" align="center">
			<td class="table_cell"><input class="val" id="salesDate_${status.index}" name="salesDate" type="text" disabled value="${revenue.salesDate}"></td>
			<td class="table_cell"><input class="val" id="numOfOrder_${status.index}" name="numOfSales" type="text" disabled value="${revenue.numOfSales}">건</td>
			<td class="table_cell"><input class="val" id="settleAmount_${status.index}" name="dayAmount" type="text" disabled value="${revenue.dayAmount}">원</td>
			<td class="table_cell"><input type="button" class="btn_submit" id="btn_submit" value="정산" onclick="location='revenueDetail.do?salesDate=${revenue.salesDate}'"></td>
		</tr>
		</c:forEach>
		<c:if test="${empty revenueList }">
    		<span> 정산 가능한 매출일이 없습니다.</span>
		</c:if>
	</table>
	</form>
	
	</div>
</main>
<footer>
</footer>
</div>
</body>
</html>