<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Pines</title>
<link href="images/pines.JPG" rel="shortcut icon" type="image/x-icon">
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
<script>
$(function(){
	
	$("#btn_submit").click(function(){
		
		var userId = $.trim($("#userId").val());
		var pass = $.trim($("#pass").val());
	
		if( userId == "" ) {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if( pass == "" ) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:"userId="+userId+"&pass="+pass,   // json(전송)타입
    		url:"loginWriteSub.do",
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				alert(userId+"님 로그인 되었습니다.");
    				location="mainList.do";
    			} else {
    				alert("로그인 정보를 다시 확인해주세요.");
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
*{
	margin: 0;
	padding:0;
}
.button1{
	margin : 0px;
	border : 0;
	outline : 0;
	cursor:pointer;
	background-color : white;
}
/* 화면 전체 렙 */
.wrapper{
	width: 1900px;	
}

/* content 랩 */
.wrap{
	width : 800px;
	margin: auto;
}

/* 페이지 로고 */
.logo_wrap{
	text-align: center;	
	margin: 80px 0;	
}
.logo_wrap>span{
}


/* 로그인 area */
.id_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	display: block;
	width : 60%;
	margin : auto;	
}
.id_input{
	width:100%;
	height:100%;
	border:none;
}


.pw_wrap{
}
.pw_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	display: block;
	width : 60%;
	margin : auto;	
}
.pw_input{
	width:100%;
	height:100%;
	border:none;
}
.find_button_wrap{
	font-size : 10px;
	margin-top: 5px;
}
.find_id_button{
	margin-right: 15px;
	float : right;
    cursor:pointer;
    background-color: #FFFFFF;
    border : 0;
    outline : 0;
	font-weight: bold;
}
.find_pw_button{
	margin-right: 145px;
	float : right;
    cursor:pointer;
    background-color: #FFFFFF;
    border : 0;
    outline : 0;
	font-weight: bold;
}


.login_button_wrap{
	margin-top: 40px;
	text-align: center;
}
.login_button{
	width: 64%;
    height: 80px;
    background-color: #FA6A6A;
    font-size: 30px;
    color: white;
    margin : auto;
    cursor:pointer;
}

.reg_button_wrap{
	margin-top: 10px;
	text-align: center;
}
.reg_button{
	width: 64%;
    height: 80px;
    background-color: #FFFFFF;
    font-size: 30px;
    color: #FA6A6A;
    margin : auto;
    cursor:pointer;
}
.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
/* float 속성 해제 */
.clearfix{
	clear: both;
}
</style>



<body>
<div class = "whole_wrap">


<form name="frm" id="frm">
<div class="wrapper">
	<div class="wrap">
		<div class="logo_wrap">
		<button type="button" class="button1" onclick= "location='mainList.do'" ><img src="images/pines.JPG" width="150px" height="150px"></button>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					<input type="text" name="userId" class="id_input" id="userId" placeholder="아이디">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input type="password" name="pass" class="pw_input" id="pass" placeholder="비밀번호">
				</div>
			</div>
	
			<div class="find_button_wrap">
				<input onClick="location.href='pwFind.do'" type="button" class="find_pw_button"  value="비밀번호 재설정" >
				<input onClick="location.href='idFind.do'" type="button" class="find_id_button"  value="아이디 찾기">
			</div>		
			
			<div class="login_button_wrap">
				<input type="button" class="login_button" id="btn_submit" value="로그인">
			</div>	
				
			<div class="reg_button_wrap">
				<input type="button" class="reg_button" value="회원가입" onclick= "location='memberWrite.do'">
			</div>	
		</div>
	</div>
</div>
</form>
</div>
</body>
</html>

