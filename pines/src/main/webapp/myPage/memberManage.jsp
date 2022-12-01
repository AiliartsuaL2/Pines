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
$(function(){
	  document.getElementById("address_button").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 주소 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("zipCode").value = data.address; // 주소 넣기
	                document.getElementById("vzipCode").value = data.address; // 주소 넣기
	                document.getElementById("vaddress").value = "";
	                document.querySelector("input[name=vaddress]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });	
	
	
	  

	$("#btn_delete").click(function(){
		 if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
			 $(location).attr("href", "deleteMember.do")
		 }else{   //취소
		     return false;
		 }		
	});
	
	
	$("#btn_submit").click(function(){

		var newPass= $("#newPass").val();
	    var newPass2= $("#newPass2").val();
		var vname = $("#vname").val();
		var vphone = $("#vphone").val();
		var vaddress = $("#vaddress").val();

	  	  $('input[name="name"]').attr('value', vname);
	  	  $('input[name="phone"]').attr('value', vphone);
	  	  $('input[name="address"]').attr('value', vaddress);
		
	    
	    if(newPass != "" && newPass2 != ""){ // 데이터가 있으면
		    if(newPass != newPass2){
				  alert("비밀번호가 일치하지 않습니다.");
				  $("#newPass2").focus();
				  return false;
			  }
		    else{
		  	  $('input[name="pass"]').attr('value', newPass);
		    }
	    }
	    else if(newPass != "" && newPass2 == ""){ // 비밀번호 설정에만 값이 있으면
		    alert("비밀번호를 한번 더 입력해주세요.");
	    	return false;
	    }  
	    else if(newPass == "" && newPass2 != ""){ // 비밀번호 확인에만 값이 있으면
		    alert("비밀번호 설정을 해주세요");
	    	return false;
	    }
		
	  	let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	  	
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:frmData,   // json(전송)타입
    		url:"memberModify.do",
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "1") {
    				alert("회원정보가 정상적으로 수정되었습니다.");
    				alert("로그아웃 되었습니다. 다시 로그인해주세요");
    				location="logout.do";
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
    width : 
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
    width: 42%;
    position: absolute;
    left: 40%;
    top: 40%;
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
    top: 93%;
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
<%@ include file="../include/myPageTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 회원정보수정</p>
	</div>
	 <c:forEach items="${memberList}" var="memberVO">
	 <form id="frmData">
	 	<input type="hidden" id="pass" name="pass" value="${memberVO.pass}">
	    <input type="hidden" id="userId" name="userId" value="${memberVO.userId}">
	    <input type="hidden" id="name" name="name" value="${memberVO.name}">
	    <input type="hidden" id="phone" name="phone" value="${memberVO.phone}">
	    <input type="hidden" id="zipCode" name="zipCode" value="${memberVO.zipCode}">
	    <input type="hidden" id="address" name="address" value="${memberVO.address}">
	 </form>
	 <div class="id_input_box">
				<div class = "category_box">
	      				<label class="name_category_case">아이디</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${memberVO.userId}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">이름</label>
	      			<div class = "empty_box">
	      				<input id="vname" class="category_value" value="${memberVO.name}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">휴대폰 번호</label>
	      			<div class = "empty_box">
	      				<input id="vphone" class="category_value" value="${memberVO.phone}">
	      			</div>
				</div>
				<div class = "pass_category_box">
	      				<label class="pass_category_case">비밀번호 변경</label>
	      			<div class = "empty_box">
	      				<input type="password" class="category_value" id="newPass" value="" placeholder="새로운 비밀번호를 입력해주세요">
	      			</div>
	      			<div class = "empty_box">
	      				<input type="password" class="category_value" id="newPass2" value="" placeholder="새로운 비밀번호를 다시 한 번 입력해주세요">
	      			</div>
				</div>
				<div class = "address_box">
	      				<label class="address_category_case">주소지</label>
	      			<div class = "empty_box">
	      				<input type="text" id="vzipCode" name="vzipCode" class="category_value" value="${memberVO.zipCode}" >
						<input type="button" id="address_button" class="address_button" value="주소 찾기">
	      			</div>
	      			<div class = "empty_box">
	      				<input type="text" id="vaddress" name="vaddress" class="category_value" value="${memberVO.address}" >
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">회원탈퇴</label>
	      			<div class = "empty_box">
	      				<input disabled class="exit_value" value="탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.">
						<input type="button" id="btn_delete" class="address_button" value="회원 탈퇴">
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