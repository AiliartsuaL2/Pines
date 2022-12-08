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
<script type="text/javascript" src="/pines/script/RSA/jsbn.js"></script>
<script type="text/javascript" src="/pines/script/RSA/rsa.js"></script>
<script type="text/javascript" src="/pines/script/RSA/prng4.js"></script>
<script type="text/javascript" src="/pines/script/RSA/rng.js"></script>
<script>
$(function(){	  	
	$("#btn_submit").click(function(){

		var vBankName = $("#vBankName").val();
		var vAccountNumber = $("#vAccountNumber").val();
		var vAccountHolder = $("#vAccountHolder").val();

	    if(vBankName == ""){ // 비밀번호 설정에만 값이 있으면
		    alert("은행명을 입력해주세요.");
			  $("#vBankName").focus();
	    	return false;
	    }  
	    if(vAccountNumber == ""){ // 비밀번호 확인에만 값이 있으면
		    alert("계좌번호를 입력해주세요.");
			  $("#vAccountNumber").focus();
	    	return false;
	    }
	    if(vAccountHolder == ""){ // 비밀번호 확인에만 값이 있으면
		    alert("예금주를 입력해주세요.");
			  $("#vAccountHolder").focus();
	    	return false;
	    }
		
	    var rsa = new RSAKey();
		rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
		
		vBankName = rsa.encrypt(vBankName);
		vAccountNumber = rsa.encrypt(vAccountNumber);
		vAccountHolder = rsa.encrypt(vAccountHolder); 
		
	  	$('input[name="bankName"]').attr('value', vBankName);
	  	$('input[name="accountNumber"]').attr('value', vAccountNumber);
	  	$('input[name="accountHolder"]').attr('value', vAccountHolder);
		
	  	let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	  	
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:frmData,   // json(전송)타입
    		url:"sellerInfoModify.do",
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				alert("판매처 정보가 정상적으로 수정되었습니다.");
    				location="sellerCheck.do";
    			} else {
    				alert("오류가 발생하였습니다. \n 관리자에게 연락 바랍니다.");
    			}
    		},
    		error: function() {  // 장애발생
    			alert("오류발생");
    		}
		});
		
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
	float : left;
	font-size:15pt;
	font-weight:bold;
    height: 50px;
}
.div_table_title{
	width : 50%;
	height : 80%;
	position : absolute;    
	left: 40%;
    top: 36%;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.id_input_box{
    width: 38%;
    position: absolute;
    left: 41%;
    top: 46%;
}

.empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:48px;
	width:78%;
	font-size : 18px;
	font-wight : bold;
}
.category_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;
}
.pass_category_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;

}
.address_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;
}



.name_category_case{
	text-align : center;
	height:36px;
	width:20%;
	padding-top : 12px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}


.pass_category_case{
	text-align : center;
	height:65px;
	width:20%;
	padding-top : 33px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}

.address_category_case{
	text-align : center;
	height:65px;
	width:20%;
	padding-top : 33px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}


.address_button{
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




.category_value{
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    margin-left: 20px;
    background-color : white;
    width: 95%;
    font-size: 16px;
}
.exit_value{
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    color : #BABABA;
    background-color : white;
    margin-left: 20px;
    width: 95%;
    font-size: 16px;
}


.find-btn{
	position : absolute;    
	left: 57%;
    top: 80%;
	text-align: center;
}
#btn_submit{
	border : 0;
    background-color: #FA6A6A;
    color : #FFFFFF;
    width: 150px;
    height : 50px;
    font-size : 18px;
    font-weight: bold;
    cursor : pointer;
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
<body>
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



<div class = "whole_wrap">
<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/sellerSettingTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 판매처 정보 수정</p>
	</div>
	 <c:forEach items="${sellerList}" var="seller">
	 <form id="frmData">
	 	<input type="hidden" id="bankName" name="bankName" value="${seller.bankName}">
	    <input type="hidden" id="accountNumber" name="accountNumber" value="${seller.accountNumber}">
	    <input type="hidden" id="accountHolder" name="accountHolder" value="${seller.accountHolder}">
		<input type="hidden" id="RSAModulus" value="${RSAModulus}">
		<input type="hidden" id="RSAExponent" value="${RSAExponent}">
	 </form>
	 <div class="id_input_box">
				<div class = "category_box">
	      				<label class="name_category_case">업종</label>
	      			<div class = "empty_box">
	      				<c:if test="${seller.sellerType eq 'farm'}">
	      					<input disabled class="category_value" value="농원">
	      				</c:if>
	      				<c:if test="${seller.sellerType eq 'flower'}">
	      					<input disabled class="category_value" value="꽃집">
	      				</c:if>
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">상점명</label>
	      			<div class = "empty_box">
	      				<input disabled  class="category_value" value="${seller.storeName}">
	      			</div>
				</div>				
				<div class = "category_box">
	      				<label class="name_category_case">은행</label>
	      			<div class = "empty_box">
	      				<input id="vBankName" class="category_value" value="${seller.bankName}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">계좌번호</label>
	      			<div class = "empty_box">
	      				<input id="vAccountNumber" class="category_value" value="${seller.accountNumber}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">예금주</label>
	      			<div class = "empty_box">
	      				<input id="vAccountHolder" class="category_value" value="${seller.accountHolder}">
	      			</div>
				</div>

	</div>
	</c:forEach>
			<div class="find-btn">
				<input type="button" id="btn_submit" class="btn_submit" value="수정하기">
			</div>

</main>
<footer>
</footer>
</div>
</body>
</html>