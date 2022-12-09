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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="images/pines.JPG" rel="shortcut icon" type="image/x-icon">
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


$(function(){
	$("#btn_submit").click(function(){
		let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 

		$.ajax({
			url:"revenueSub.do", // 보낼 url
			data : frmData,
			type : 'POST',
			dataType:"text",
			success : function(data){
				if(data == "ok"){
					alert("정산이 완료되었습니다.");
					location="sellerRevenue.do"
				} else{
					alert("정산에 실패하였습니다. \n 관리자에게 연락해주세요");
				}
		 	},
			error : function(data){
				alert("정산에 실패하였습니다. \n 관리자에게 연락해주세요");
	    	}
		}); 
	});
});

</script>
</head>
<style>
header {
    height: 215px;
}
main {
	width:1920px;
}
footer {
    height: 310px;
}
a { text-decoration:none }

.div_table_title{
	width : 1920px;
}

.table_title{
	position : absolute;
	left:40%;
	top:27%;
	font-size:15pt;
	font-weight:bold;
    height: 30px;
}

/* 상품등록 area */
.id_input_box2{
    width: 54%;
	position : absolute;
	left:40%;
	top:35%;
}

.name_box{
	margin-top : -10px;
	text-align : center;
	height:60px;
	width:75%;
    font-weight: bold;
}
.name_case{
	text-align : center;
	height:79.5%;
	width:20%;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}

.empty_box{
	float: left;
    display: inline-block;
    text-align: center;
    border: 1px solid #BABABA;
    height: 60.5%;
    width: 70%;
    font-size: 18px;
    padding-top: 1.8%;
}
.category_value{
	float:left;
	margin-left:5%;
	background-color:white;
	font-size:20px;
	border:0;
}

.btn_submit{
	display :inline-block;
	border-radius: 4px;
	height: 36px;
    width: 19%;
	margin-top: 5%;
	margin-left : 10%;
	border : 0;
	font-size : 17px;
    cursor: pointer;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.find-btn{
	text-align: center;
	width:68%;
}
#btn_cancle{
    background-color: #FFFFFF;
    color : #FA6A6A;
    border : 1px solid #b3b3b3;
	
}
#btn_submit{
    background-color: #FA6A6A;
    color : #FFFFFF;
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

<main>
<%@ include file="../include/searchBar.jsp" %>
<%@ include file="../include/sellerOrderTopMenu.jsp" %>

		<c:forEach items="${revenueList}" var="revenueVO">
		<p class = "table_title">${revenueVO.salesDate}일자 매출</p>
		<form id="frmData">
			<input type="hidden" id=numOfSales name="numOfSales" value="${revenueVO.numOfSales}">
			<input type="hidden" id=dayAmount name="dayAmount" value="${revenueVO.dayAmount}">
			<input type="hidden" id=salesDate name="salesDate" value="${revenueVO.salesDate}">
		</form>
		<div class="id_input_box2">
				<div class = "name_box">
						<input type="text" disabled class="name_case" value="매출 건수">
	      			<div class = "empty_box">
						<input type="text" disabled class="category_value" value="${revenueVO.numOfSales}건">
	      			</div>
				</div>
				<div class = "name_box">
						<input type="text" disabled class="name_case" value="매출 총액">
	      			<div class = "empty_box">
						<input type="text" disabled class="category_value" value="${revenueVO.dayAmount}원">
	      			</div>
				</div>
				<div class = "name_box">
						<input type="text" disabled class="name_case" value="은행">
	      			<div class = "empty_box">
						<input type="text" disabled class="category_value" value="${revenueVO.bankName}">
	      			</div>
				</div>
				<div class = "name_box">
						<input type="text" disabled class="name_case" value="계좌번호">
	      			<div class = "empty_box">
						<input type="text" disabled class="category_value" value="${revenueVO.accountNumber}">
	      			</div>
				</div>
				<div class = "name_box">
						<input type="text" disabled class="name_case" value="예금주">
	      			<div class = "empty_box">
						<input type="text" disabled class="category_value" value="${revenueVO.accountHolder}">
	      			</div>
				</div>
	
				
			<div class="find-btn">
				<input type="button" id="btn_cancle" class="btn_submit" onclick= "location='sellerRevenue.do'" value="이전">
				<input type="button" id="btn_submit" class="btn_submit" value="정산하기">
			</div>
				
		</div>
	</c:forEach>
	
</main>
</div>
</body>
</html>