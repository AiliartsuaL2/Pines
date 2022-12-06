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

<script>


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
	color:#A5A5A5;
    cursor: pointer;
}
.category_btn_payment{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#FA6A6A;
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
.bank_head{
	width:101.6%;
	margin-top:-0.1%;
}
.bank_account{
	width:101.6%;
	margin-bottom:5%;
	margin-top:-0.5%;
}


.userInfo{
	color: black;
    background: #FCDDDC;
    width: 27%;
    border: 1px solid #A8A5A5;
    font-size: 11pt;
    font-weight: bold;
    text-align: center;
    height: 25px;

}
.userData{
    color: black;
    background: white;
    border: 1px solid #A8A5A5;
    width: 15%;
    font-size: 11pt;
    text-align: center;
    font-weight: bold;
    margin-left: -1.05%;
    height: 25px;	
}
.bankInfo{
    color: black;
    border: 1px solid #A8A5A5;
    background: #FCDDDC;
    width: 26.9%;
    text-align: center;
    margin-left: -1%;
    font-size: 11pt;
    font-weight: bold;
    height: 25px;
}
.bankName{
	color: black;
    background: white;
    border: 1px solid #A8A5A5;
    width: 26.9%;
    margin-left: -1%;
    text-align: center;
    font-size: 11pt;
    font-weight: bold;
    height: 25px;
}
.accountNum{
	color: black;
    background: white;
    border: 1px solid #A8A5A5;
    width: 70%;
    margin-left: -1%;
    text-align: center;
    font-size: 14pt;
    height: 25px;
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
		<p class = "table_title"> 정산 내역 조회</p>
	</div>
	<div class="id_input_box">
	<form id="frmData">
		<c:forEach items="${revenueList}" var="revenue" varStatus="status">
		<table class = "product_table">
		<tr>
			<th class="table_head" width="7%">매출 일자</th>
			<th class="table_head" width="4%">매출 건수</th>
			<th class="table_head" width="7%">매출액</th>
			<th class="table_head" width="7%">정산일자</th>
		</tr>
		<tr class="pr_tr" align="center">
			<td class="table_cell"><input class="val" id="salesDate" name="salesDate" type="text" disabled value="${revenue.salesDate}"></td>
			<td class="table_cell"><input class="val" id="numOfOrder" name="numOfSales" type="text" disabled value="${revenue.numOfSales}">건</td>
			<td class="table_cell"><input class="val" id="settleAmount" name="dayAmount" type="text" disabled value="${revenue.settleAmount}">원</td>
			<td class="table_cell"><input class="val" id="settleDate" name="dayAmount" type="text" disabled value="${revenue.settleDate}"></td>
		</tr>
		</table>
		
		<div class="bank_head">
			<input class="userInfo" disabled type="text" value="예금주">
			<input class="userData" disabled type="text" value="${revenue.accountHolder}">
			
			<input class="bankInfo" disabled type="text" value="은행명">
			<input class="bankName" disabled type="text" value="${revenue.bankName}">
		</div>
		<div class="bank_account">
			<input class= "userInfo" disabled type="text" value="계좌번호">
			<input disabled class="accountNum" type="text" value="${revenue.accountNumber}">
		</div>
		
		
		</c:forEach>
		<c:if test="${empty revenueList }">
    		<span> 정산을 완료한 일자가 존재하지 않습니다.</span>
		</c:if>
	</form>
	
	</div>
</main>
<footer>
</footer>
</div>
</body>
</html>