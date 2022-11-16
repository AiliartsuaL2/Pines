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
	$("#btn_submit").click(function(){
		
		var userId = $("#userId").val();
		var pass = $.trim($("#pass").val());
		if( pass == "" ) {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:"pass="+pass,   // json(전송)타입
    		url:"memberCheckSub.do",
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				location="memberManage.do";
    			} else {
    				alert("비밀번호를 다시 확인해주세요.");
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
    width : 
}
.div_table_title{
	width : 50%;
	height : 80%;
	position : absolute;    
	left: 38%;
    top: 32%;
}

.table_sub_title{
	color : #A5A5A5;
	font-size:10pt; 
    position: absolute;
    left: 2%;
    top: 6%;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.id_input_box{
	width: 86%;
    position: absolute;
    left: 2%;
    top: 15%;
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


.category_value{
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    /* padding-top: 12px; */
    margin-left: 20px;
    width: 95%;
    font-size: 16px;
}


.find-btn{
	position : absolute;    
	left: 57%;
    top: 55%;
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
<%@ include file="../include/myPageTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 회원정보확인</p>
		<br>
		<p class = "table_sub_title">회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.</p>
			<div class="id_input_box">
				<div class = "category_box">
	      				<label class="name_category_case">아이디</label>
	      			<div class = "empty_box">
	      				<input type="text" id="userId" name="userId" class="category_value" value="${mainVO.userId}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">비밀번호</label>
	      			<div class = "empty_box">
	      				<input type="password" id="pass" name="pass" class="category_value" placeholder="비밀번호를 입력해주세요.">
	      			</div>
				</div>
	</div>
	</div>
			<div class="find-btn">
				<input type="button" id="btn_submit" class="btn_submit" value="확인">
			</div>

</main>
<footer>
</footer>
</div>
</body>
</html>