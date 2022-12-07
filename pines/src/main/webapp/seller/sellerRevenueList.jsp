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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script>
$(function(){
	var settingDate = new Date();
	var todayDate = new Date().toLocaleDateString();
	settingDate.setMonth(settingDate.getMonth()-1); //한달 전;
	var aMonthAgoDate = settingDate.toLocaleDateString();
	var today = todayDate.toString();
	var aMonthAgo = aMonthAgoDate.toString(); 
	
	
	aMonthAgo = aMonthAgo.replaceAll(".","");
	aMonthAgo = aMonthAgo.replaceAll(" ","-");
	
	var aMonthArr = aMonthAgo.split("-");	
	if(parseInt(aMonthArr[1])<10){
		aMonthArr[1] = "0"+aMonthArr[1];
	}
	if(parseInt(aMonthArr[2])<10){
		aMonthArr[2] = "0"+aMonthArr[2];
	}
	aMonthAgo = aMonthArr[0]+"-"+aMonthArr[1]+"-"+aMonthArr[2];
	
	today = today.replaceAll(".","");
	today = today.replaceAll(" ","-");
	
	var todayArr = today.split("-");
	if(parseInt(todayArr[1])<10){
		todayArr[1] = "0"+todayArr[1];
	}
	if(parseInt(todayArr[2])<10){
		todayArr[2] = "0"+todayArr[2];
	}

	today = todayArr[0]+"-"+todayArr[1]+"-"+todayArr[2];
	
	$("#startOrderPeriod").val(aMonthAgo);
	$("#endOrderPeriod").val(today);
	
    $( "#startOrderPeriod" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
    $( "#endOrderPeriod" ).datepicker({
        changeMonth: true,
        changeYear: true
      });
    
	$("#btn_submit").click(function(){ // 1개월 버튼
		$("#ajaxDiv").empty();// 요소 내용 제거	
		ajaxLoad();
	});
	
	$(document).on("click","#btn_viewPage",function(){
		var btnValue = this.value;
		$('#hidden_viewPage').val(btnValue);
		$("#ajaxDiv").empty();// 요소 내용 제거	
		ajaxLoad();
	});
	
	function ajaxLoad(){
		var formData2 = $("#frmData").serialize(); 
		// 비동기 전송방식,, (화면 이동이 없음)의 jquery 함수,, ajax
		$.ajax({
			url:"sellerRevenueListSearch.do", // 보낼 url
			data:formData2, //폼 자체
			dataType:"json",
			success: function(data){
				var html = "";
				for(var i=0; i<data['obj1'].length;i++){
					html+="<table class = 'product_table'>";
					html+="<tr>";
					html+="<th class='table_head' width='7%'>매출 일자</th>";
					html+="<th class='table_head' width='4%'>매출 건수</th>";
					html+="<th class='table_head' width='7%'>매출액</th>";
					html+="<th class='table_head' width='7%'>정산일자</th>";
					html+="<tr>";
					html+="<tr class='pr_tr' align='center'>";
					html+="<td class='table_cell'><input class='val' id='salesDate' name='salesDate' type='text' disabled value='"+JSON.stringify(data['obj1'][i]['salesDate']).replace(/\"/gi, "")+"'></td>";
					html+="<td class='table_cell'><input class='val' id='numOfOrder' name='numOfSales' type='text' disabled value='"+JSON.stringify(data['obj1'][i]['numOfSales']).replace(/\"/gi, "")+"'>건</td>";
					html+="<td class='table_cell'><input class='val' id='settleAmount' name='dayAmount' type='text' disabled value='"+JSON.stringify(data['obj1'][i]['settleAmount']).replace(/\"/gi, "")+"'>원</td>";
					html+="<td class='table_cell'><input class='val' id='settleDate' name='dayAmount' type='text' disabled value='"+JSON.stringify(data['obj1'][i]['settleDate']).replace(/\"/gi, "")+"'></td>";
					html+="<tr>";
					html+="</table>";
					html+="<div class='bank_head'>";
					html+="<input class='userInfo2' disabled type='text' value='예금주'>";
					html+="<input class='userData2' disabled type='text' value='"+JSON.stringify(data['obj1'][i]['accountHolder']).replace(/\"/gi, "")+"'>";
					html+="<input class='bankInfo2' disabled type='text' value='은행명'>";
					html+="<input class='bankName' disabled type='text' value='"+JSON.stringify(data['obj1'][i]['bankName']).replace(/\"/gi, "")+"'>";
					html+="</div>";
					html+="<div class='bank_account'>";
					html+="<input class= 'userInfo2' disabled type='text' value='계좌번호'>";
					html+="<input disabled class='accountNum' type='text' value='"+JSON.stringify(data['obj1'][i]['accountNumber']).replace(/\"/gi, "")+"'>";
					html+="</div>";
				}
					var totalPage = parseInt(JSON.stringify(data['obj2'][0]['totalPage']));
					if(totalPage > 1 ){
						html += "<div class='btn_page'>";
						for(var i=1; i<=totalPage; i++){
							html +="<input type='button' class='btn_viewPage' id='btn_viewPage' value='"+i+"'>";
						}
						html += "</div>";
					}
					$("#ajaxDiv").append(html);
			},	
			error: function(request,status,error){	// 시스템적인 에러..SQL이라던지 등,,
				alert("오류발생");
			}
		});//
	}
  	
});

</script>


</head>

<style>
.div_Wrap{
  display: flex;
  justify-content: center;
   width:1920px;
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
    top: 45%;
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
	margin-top:-0.2%;
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

.userInfo2{
	color: black;
    background: #FCDDDC;
    width: 27.8%;
    border: 1px solid #A8A5A5;
    font-size: 11pt;
    font-weight: bold;
    text-align: center;
    height: 25px;

}
.userData2{
    color: black;
    background: white;
    border: 1px solid #A8A5A5;
    width: 15.8%;
    font-size: 11pt;
    text-align: center;
    font-weight: bold;
    margin-left: -1.05%;
    height: 25px;	
}
.bankInfo2{
    color: black;
    border: 1px solid #A8A5A5;
    background: #FCDDDC;
    width: 27.7%;
    text-align: center;
    margin-left: -1%;
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
.date_btn{
	background-color : white;
	font-weight:bold;
    margin-top: 2%;
    margin-left: 15%;
    border : 1px solid #8F8F8F;
	cursor : pointer;
	
}
.period_input{
	width: 25%;
	height: 60%;
    margin-right: 3%;
    margin-left: 3%;
    color : #8f8f8f;
    background-color : #FCDDDC;
    border : 1px solid #8F8F8F;
    text-align : center;
    font-size : 15px;
}
.periodInput{
	width:78%;
	height:45px;
	margin-top:-1px;
	margin-left:-1px;
	float:left;
    border : 1px solid #8F8F8F;
	display:block;
}

.periodBox{
    width: 20%;
    height:35px;
    padding-top:10px;
    background-color:#FCDDDC;
    color:#8F8F8F;
    font-size:12pt;
    font-weight:bold;
    text-align : center;
    display:inline;
    border : 1px solid #8F8F8F;
    float:left;
    margin-top:-1px;
}


.searchWrap{
    width: 38.5%;
    height:13%;
    position: absolute;
    left: 40%;
    top: 39%;
}

.btn_page{
	margin-top : 5%; 
    text-align: center;
    margin-bottom : 10%;
}

.btn_viewPage{
	background-color:white;
	color:#A5A5A5;
	cursor : pointer;
	border:0;
	
}

.btn_viewPage:hover{
	background:#A5A5A5;
	color:white;
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
	<form id="frmData">
		<div id = "searchWrap" class="searchWrap">
		    <div class="periodBox">
				<label class="period_title">매출일 기간 선택</label>
			</div>
			<div class="periodInput">
				<input id="startOrderPeriod" name="startOrderPeriod" class="period_input" value="">
				<label>-</label>
				<input id="endOrderPeriod" name="endOrderPeriod" class="period_input" value="">
				<input type = "button" id="btn_submit" name="btn_submit" class="date_btn" value="조회">
			</div>
			<input type='hidden' id='hidden_viewPage' name='viewPage' value="1">
		</div>
	</form>
	<div id="ajaxDiv" class="id_input_box">
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
		<div class="btn_page">
			<c:choose> 
				<c:when test="${totalPage > 1}">
					<c:forEach var="i" begin="1" end="${totalPage}">
						<input type="button" class="btn_viewPage" value="${i}" onclick="location='sellerRevenueList.do?viewPage=${i}'">
					</c:forEach>
				</c:when> 
			</c:choose> 
		</div>
		<c:if test="${empty revenueList }">
    		<span> 정산을 완료한 일자가 존재하지 않습니다.</span>
		</c:if>
	
	</div>
</main>
<footer>
</footer>
</div>
</body>
</html>