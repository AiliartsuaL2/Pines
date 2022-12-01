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

var dulName = false;
var dulBusNum = false;

$("#btn_name").click(function(){		
    var storeName = $("#storeName").val();	
    storeName = $.trim(storeName);	
	$.ajax({
		url:"storeNameCheck.do", // 보낼 url
		data : "storeName="+storeName,
		type : 'POST',
		dataType:"text",
		success : function(data){
					if(data == "ok"){
						alert("사용 가능한 상호명 입니다.");
						dulName = true;
					} else{
						alert("이미 사용중인 상호명 입니다.");
					}
				},
		error : function(data){
			    		alert("관리자에게 연락해주세요");
		 		}
		}); 
	});
	
$("#btn_busNum").click(function(){		
    var businessRegNum = $("#businessRegNum").val();	
    businessRegNum = $.trim(businessRegNum);	
	$.ajax({
		url:"storeBusNumCheck.do", // 보낼 url
		data : "businessRegNum="+businessRegNum,
		type : 'POST',
		dataType:"text",
		success : function(data){
					if(data == "ok"){
						alert("등록 가능한 사업자 등록번호 입니다.");
						dulBusNum = true;
					} else{
						alert("이미 등록된 사업자 등록번호 입니다.");
					}
				},
		error : function(data){
			    		alert("관리자에게 연락해주세요");
		 		}
		}); 
	});
	
$("#btn_submit").click(function(){
    var bankName = $("#bankName").val();	
    var accountNumber = $("#accountNumber").val();	
    var accountHolder = $("#accountHolder").val();	
    
	if(dulName == false){
		alert("상호명 중복 확인이 되지 않았습니다.");
		return false;	
	}

	if(dulBusNum == false){
		alert("사업자 등록번호 중복 확인이 되지 않았습니다.");
		return false;	
	}

	
	  if(bankName == ""){
		  alert("은행명을 입력해주세요.");
		  $("#bankName").focus();
		  return false;
	  }
	
	  if(accountNumber == ""){
		  alert("계좌번호를 입력해주세요.");
		  $("#accountNumber").focus();
		  return false;
	  }
	
	  if(accountHolder == ""){
		  alert("예금주를 입력해주세요.");
		  $("#accountHolder").focus();
		  return false;
	  }
	
	
	let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	
	console.log(frmData);
	$.ajax({
		url:"sellerWriteSub.do", // 보낼 url
		data : frmData,
		type : 'POST',
		dataType:"text",
		success : function(data){
					if(data == "ok"){
						alert("판매자 등록이 완료되었습니다.");
						location="sellerCheck.do"
					} else{
						alert("판매자 등록에 실패하였습니다. \n 관리자에게 연락해주세요");
					}
				},
		error : function(data){
			    		alert("판매자 등록에 . \n 관리자에게 연락해주세요");
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
    margin-left: 30%;
    margin-top: 2%;
	font-size:15pt;
	font-weight:bold;
    height: 30px;
}

.table_sub_title{
	margin-left:32%;
	margin-top : -1%;
	color : #A5A5A5;
	font-size:10pt;
    height: 30px;
}


/* 상품등록 area */
.id_input_box{
	border: 0;
	position : absolute;
	width : 48%;
	top:38%;
	left:30%;	
}
.name_box{
	margin-top : -10px;
	text-align : center;
	height:60px;
	width:100%;
}
.name_case{
	text-align : center;
	height:35px;
	width:20%;
	padding-top : 13px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:48px;
	width:79%;
	font-size : 18px;
	font-wight : bold;
}
.input_box{
	text-align : left;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left: 4%;
	height:45px;
	width:94%;
	font-size : 18px;
	font-wight : bold;
}
.name_input_box{
	text-align : left;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left: 4%;
	height:45px;
	width:60%;
	font-size : 18px;
	font-wight : bold;
}
.select_box{
	float:left;
    width: 20%;
    font-size: 20px;
    height: 100%;
    margin-left: 3%;
}



.dul_button{
    border: 1px solid #A5A5A5;
    height: 40px;
    width: 20%;
    font-size: 14px;
    line-height: 40px;
    text-align: center;
    font-weight: 900;
    color: #BFBFBF;
    background-color: #FFFFFF;
    cursor: pointer;
    margin-left: 400px;
    margin-top: -43px;
}

.btn_submit{
	display :inline-block;
	border-radius: 4px;
	height: 50px;
	width: 20%;
	margin-top: 5%;
	border : 0;
	font-size : 20px;
	font-wight : bold;
    cursor: pointer;
    background-color: #FA6A6A;
    color : #FFFFFF;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.find-btn{
	text-align: center;
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
<%@ include file="../include/sellerTopMenu.jsp" %>
<div class = "div_table_title">
	<p class = "table_title"> 판매자 등록</p>
</div>
	
	
	<form id="frmData">
		<div class="id_input_box">
			<div class = "name_box">
	      			<label class="name_case">상호명</label>
	      			<div class = "empty_box">
						<input type="text" id="storeName" name="storeName" class="name_input_box" value = "" placeholder="Pines에서 사용할 상호명을 입력해주세요." >
						<input type="button" id="btn_name" class="dul_button" value="중복 확인">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">사업자 등록번호</label>
	      			<div class = "empty_box">
						<input type="text" id="businessRegNum" name="businessRegNum" class="name_input_box" value = "" placeholder="-를 제외한 숫자만 입력해주세요." >
						<input type="button" id="btn_busNum" class="dul_button" value="중복 확인">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">은행명</label>
	      			<div class = "empty_box">
						<input type="text" id="bankName" name="bankName" class="input_box" value = "" placeholder="계좌의 은행명을 입력해주세요">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">계좌번호</label>
	      			<div class = "empty_box">
						<input type="text" id="accountNumber" name="accountNumber" class="input_box" value = "" placeholder="-를 제외한 숫자만 입력해주세요.">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">예금주</label>
	      			<div class = "empty_box">
						<input type="text" id="accountHolder" name="accountHolder" class="input_box" value = "" placeholder="예금주를 입력해주세요.">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">업종 분류</label>
	      			<div class = "empty_box">
							<select class="select_box" name="sellerType" id="sellerType" >
								<option value="farm"  >농원 </option>
								<option value="flower" >꽃집</option>
							</select>
	      			</div>
			</div>
			
		
			<div class="find-btn">
				<input type="button" id="btn_submit" class="btn_submit" value="등록하기">
			</div>
			
	</div>
	</form>
				
				
		</div>
	
	
</main>
</div>
</body>
</html>