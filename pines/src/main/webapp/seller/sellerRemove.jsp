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

var confirmInfo = false;
var checkInfo = false;

$("#hint").change(function(){
    if($("#hint").is(":checked")){
		checkInfo = true;
    }else{
		checkInfo = false;
    }
});

$("#btn_confirm").click(function(){		
    var userId = $("#userId").val();	
    var storeName= $("#storeName").val();	
    var businessRegNum = $("#businessRegNum").val();	

	  if(userId == ""){
		  alert("아이디를 입력해주세요.");
		  $("#userId").focus();
		  return false;
	  }
	  if(storeName == ""){
		  alert("상점명을 입력해주세요.");
		  $("#storeName").focus();
		  return false;
	  }
	  if(businessRegNum == ""){
		  alert("사업자 등록번호를 입력해주세요.");
		  $("#businessRegNum").focus();
		  return false;
	  }
	  
	  let inputFrm = $("#inputFrm").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
		
	  $.ajax({
			url:"sellerDeleteCheck.do", // 보낼 url
			data : inputFrm,
			type : 'POST',
			dataType:"text",
			success : function(data){
						if(data == "ok"){
							alert("본인 확인이 완료되었습니다");
							confirmInfo = true;
						}
						else if(data == "notEqualId"){
							alert("입력하신 ID가 로그인한 ID와 다릅니다.");
						}
						else{
							alert("입력 정보를 다시 확인해주세요.");
						}
					},
			error : function(data){
				    		alert("에러 발생 \n 관리자에게 연락해주세요");
			 		}
			}); 
	});
	
$("#btn_submit").click(function(){
	if(checkInfo == false){
		alert("안내 사항에 동의가 되지 않았습니다.");
		return false;	
	}
	if(confirmInfo == false){
		alert("본인 확인이 완료되지 않았습니다.");
		return false;	
	}
	
	let inputFrm = $("#inputFrm").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 	
	
	 $.ajax({
			url:"sellerDeleteSub.do", // 보낼 url
			data : inputFrm,
			type : 'POST',
			dataType:"text",
			success : function(data){
						if(data == "ok"){
							alert("판매자 탈퇴가 완료되었습니다.");
		    				location="sellerWrite.do";
						}
					},
			error : function(data){
				    		alert("에러 발생 \n 관리자에게 연락해주세요");
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

.table_title{   
	 margin-left: 13%;
    font-size: 15pt;
    font-weight: bold;
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
	top:32%;
	left:35%;	
}
.name_box{
    border: 1px solid #BABABA;
    margin-top: 10px;
    text-align: center;
    margin-left: 10%;
    width: 80%;
    display: block;
    float: left;
}

.btn_check_box{
	margin-top: 20px;
    width: 100%;
    height: 50px;
    display: block;
    float: left;
    text-align: center;
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
    float: left;
    display: block;
    text-align: left;
    border-bottom: 1px solid #BABABA;
    width: 100%;
    font-size: 18px;
}
.input_name_box{
	text-align : left;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left: 4%;
	height:45px;
	width:76%;
	font-size : 18px;
	font-wight : bold;
}
.input_id_box{
	text-align : left;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left: 4%;
	height:45px;
	width:76%;
	font-size : 18px;
	font-wight : bold;
}
.input_pw_box{
	text-align : left;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left: 4%;
	height:45px;
	width:62%;
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
    margin-bottom: 5%;
}
.btn_confirm{
	display :inline-block;
	border-radius: 4px;
    height: 40px;
    width: 15%;
    margin-top: 3%;
    margin-bottom: 3%;
	border : 0;
	font-size : 15px;
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
.labelClass{
	margin-left:5%;
}
.labelClass2{
    margin-left: 5%;
    float: left;
    font-size: 18px;
    font-weight: bold;
    padding-top: 10px;
}
.hint{
	cursor:pointer;
}
.input_title{    
	font-size: 18px;
    float: left;
    margin-left: 6%;
	
}

.input_info_box{
	display:block;
	margin-top:2%;
}
.title_wrap{
	display:block;
    height: 30px;
    margin-top: 5%;
}


.category_btn_order{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#FA6A6A;
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
<%@ include file="../include/sellerSettingTopMenu.jsp" %>

		<div class="id_input_box">
	<p class = "table_title"> 판매자 해지</p>
			<div class = "name_box">
	      			<div class = "empty_box">
						<label class="labelClass"><b>판매처 해지 전, 유의사항을 확인해주시기 바랍니다.</b></label><br>
						<label class="labelClass">- 판매처 해지 시, 판매처용 웹 서비스 이용이 불가능합니다.</label><br>	
						<label class="labelClass">- 거래정보가 있는 경우, 전자상거래등에서의 소비자 보호에 관한</label><br>
						<label  class="labelClass">&nbsp; 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화</label><br>
						<label  class="labelClass">&nbsp; 등의 공급에 관한 기록은 5년동안 보존됩니다.</label><br>
						<label  class="labelClass">- 이미 결제가 완료된 건은 해지로 취소되지 않습니다.</label><br>
	      			</div>
				<div class="btn_check_box">
	 					<label class="hint" for="hint"><input type="checkbox" id="hint" /> 상기 처리사항 안내를 확인하였음에 동의합니다.</label>
	   			</div>
			</div>
			<div class = "name_box">
				<div class="title_wrap">
	      			<label class="input_title"><b>보안을 위해 회원님의 이름, 아이디, 비밀번호를 확인합니다.</b></label>
	      		</div>	
	      		<form id="inputFrm">
	      		<div class = "input_info_box">
	      				<label class="labelClass2">아이디 :</label>
						<input type="text" id="userId" name="userId" class="input_name_box" value = "" placeholder="아이디">
	      		</div>
	      			<div class = "input_info_box">
	      				<label class="labelClass2">상점명 : </label>
						<input type="text" id="storeName" name="storeName" class="input_id_box" value = "" placeholder="상점명">
	      			</div>
	      			<div class = "input_info_box">
	      				<label class="labelClass2">사업자 등록번호 : </label>
						<input type="text" id="businessRegNum" name="businessRegNum" class="input_pw_box" value = "" placeholder="사업자 등록번호 / 숫자만 입력해주세요">
	      			</div>
	      		</form>
				<div class="confirm_wrap">
					<input type="button" id="btn_confirm" class="btn_confirm" value="본인확인">
				</div>
			</div>
			
			<div class="find-btn">
				<input type="button" id="btn_submit" class="btn_submit" value=	"해지하기">
			</div>
			
		</div>		
	</div>
	
	
</main>
</div>
</body>
</html>