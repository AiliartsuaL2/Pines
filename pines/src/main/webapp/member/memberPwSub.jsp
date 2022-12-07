<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pines</title>
<link href="images/pines.JPG" rel="shortcut icon" type="image/x-icon">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
<script type="text/javascript" src="/pines/script/RSA/jsbn.js"></script>
<script type="text/javascript" src="/pines/script/RSA/rsa.js"></script>
<script type="text/javascript" src="/pines/script/RSA/prng4.js"></script>
<script type="text/javascript" src="/pines/script/RSA/rng.js"></script>



<script>
$(function(){

	$("#btn_submit").click(function(){
		var rawUserId = $("#userId").val();
		var pass = $.trim($("#pass").val());
		var pw2nd = $.trim($("#pw2nd").val());
		
		if( pass == "" ) {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if( pw2nd == "" ) {
			alert("비밀번호를 확인해주세요.");
			$("#pw2nd").focus();
			return false;
		}

		if (pass!=pw2nd){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pw2nd").focus();
			return false;
		}
		
		var rsa = new RSAKey();
		rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
		
		var userId = rsa.encrypt(rawUserId); //암호화
		pass = rsa.encrypt(pass);
		pw2nd = rsa.encrypt(pw2nd);
		
		
		$("#userId").val(userId);
		$("#pass").val(pass);
		$("#pw2nd").val(pw2nd);
		
		var formData = $("#frm").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
		
		$.ajax({
	    	type:"POST",
	    	data: formData,   // json(전송)타입
	    	url:"pwCheck2.do",
	    	dataType:"text",     // 리턴 타입
	    	success: function(result) {
	    		if(result == "prePass"){
    				alert("기존에 사용중인 비밀번호입니다. 새로운 비밀번호를 입력 바랍니다.");
    				$("#userId").val(rawUserId);
    				$("#pass").val("");
    				$("#pw2nd").val("");
	    		}
	    		else if(result == "ok") {
	    			alert("비밀번호를 성공적으로 변경하였습니다.");
	    			location="loginWrite.do";
	    		}
    			else if(result == "false"){
    				alert("회원 정보가 올바르지 않습니다.");
    			}
    			else if(result == "error"){
    				alert("에러가 발생하였습니다. 관리자에게 문의 바랍니다.");
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

/* 화면 전체 렙 */
.wrapper{
	width: 1900px;	
}

/* content 랩 */
.wrap{
	width : 800px;
	margin: auto;
}
/* 페이지 제목 */
.subjecet{
	text-align: center;	
	margin: 50px 0;	
    
}
.subjecet span{
}

/* 타이틀 영역*/
.find_title_wrap{
    margin-top: -1px;
	width: 100%;
}
.find_title_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
    color: white;
    background-color: #FA6A6A;
}
.find_title_input{
	width:100%;
	height:100%;
	border:none;
	font-size:25px
}
/* 비밀번호 */
.input_pw1st_wrap{
	width: 100%;
    margin-top: -1px;
}
.input_pw1st_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.input_pw1st{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 비밀번호 확인*/
.input_pw2nd_wrap{
	width: 100%;
    margin-top: -1px;
}
.input_pw2nd_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.input_pw2nd{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 가입하기 버튼 */

.button_wrap{
	margin: 20px;
	text-align: center;
}

.prev_page_button{
	border: 1px solid #A5A5A5;
	width: 45%;
    height: 80px;
    font-size: 20px;
    font-weight: 900;
    color: #FA6A6A;
    background-color: #FFFFFF;
    margin-left : 20px;
    cursor:pointer;
}

.submit_button{
	border: 1px solid #A5A5A5;
	width: 45%;
    height: 80px;
    color: white;
    background-color: #FA6A6A;
    font-size: 20px;
    font-weight: 900;
    cursor:pointer;
}

.button1{
	border : 0;
	outline : 0;
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
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("잘못된 접근입니다.");
  document.location.href="loginWrite.do";
 </script>
<%
  return;
 }
%>

<body>
<div class = "whole_wrap">


<form name ="frm" id="frm">
<input type="hidden" id="RSAModulus" value="${RSAModulus}">
<input type="hidden" id="RSAExponent" value="${RSAExponent}">
<input type="hidden" id="userId" name="userId" value="${userId}">
<div class="wrapper">
	<div class="wrap">
			<div class="subjecet">
				<button type="button" class="button1" onclick= "location='mainList.do'" ><img src="images/pines.JPG" width="100px" height="100px"></button>
			</div>

			<div class="find_title_wrap">
				<div class="find_title_box">
					<span class="find_title_input">비밀번호 재설정</span> 
				</div>
			</div>
			
			<div class="input_pw1st_wrap">
				<div class="input_pw1st_box">
					<input type="password" name="pass" class="input_pw1st" id="pass" placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div class="input_pw2nd_wrap">
				<div class="input_pw2nd_box">
					<input type="password" name="pw2nd" class="input_pw2nd" id="pw2nd" placeholder="비밀번호를 한번 더 입력해주세요.">
				</div>
			</div>
			<div class="button_wrap">
				<input type="button" class="prev_page_button"onclick= "location='pwFind.do'" value="이전">
				<input type="button" id="btn_submit" class="submit_button" value="확인">
			</div>
		</div>
</div>
</form>

</div>
</body>
</html>