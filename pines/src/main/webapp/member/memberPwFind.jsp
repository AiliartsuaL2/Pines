<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script>
  $( function() {  
    $("#btn_submit").click(function(){//데이터 유효성 검사
      var userId= $("#userId").val();
      var name = $("#name").val();
      var phone= $("#phone").val();
      var birth = $("#birth").val();
      
      userId = $.trim(userId);
      name = $.trim(name);
      phone = $.trim(phone);
      birth = $.trim(birth);  
      
	  if(userId == ""){
		  alert("아이디을 입력해주세요.");
		  $("#userId").focus();
		  return false;
	  }
	  else if(name == ""){
		  alert("이름을 입력해주세요.");
		  $("#name").focus();
		  return false;
	  }
	  else if(phone == ""){
		  alert("휴대폰 번호를 입력해주세요.");
		  $("#phone").focus();
		  return false;
	  }
	  else if(birth == ""){
		  alert("생년월일을 입력해주세요.");
		  $("#birth").focus();
		  return false;
	  }

	  $("#userId").val(userId);
	  $("#name").val(name);
	  $("#phone").val(phone);
	  $("#birth").val(birth);
	  
	  var formData = $("#frm").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	  
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:formData,   // json(전송)타입
    		url:"pwCheck.do",
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
   				  	document.frm.submit();
    			}
    			else{
    				alert("회원 정보가 올바르지 않습니다.");
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
/* 아이디 영역 */
.input_userId_wrap{
	width: 100%;
    margin-top: -1px;
}
.input_userId_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.input_userId{
	width:100%;
	height:100%;
	border:none;
	font-size:25px
}


/* 이름 영역 */
.input_name_wrap{
	width: 100%;
    margin-top: -1px;
}
.input_name_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.input_name{
	width:100%;
	height:100%;
	border:none;
	font-size:25px
}

/* 휴대폰번호 영역 */
.input_phone_wrap{
	width: 100%;
    margin-top: -1px;
}
.input_phone_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.input_phone{
	width:100%;
	height:100%;
	border:none;
	font-size:25px
}
/* 생년월일 영역 */
.birth_wrap{
	width: 100%;
    margin-top: -1px;
}
.birth_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.birth_input{
	width:100%;
	height:100%;
	border:none;
	font-size:25px
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
    font-size: 25px;
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
    font-size: 25px;
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

<form name ="frm" id="frm" action="pwSub.do" >
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
			<div class="input_userId_wrap">
				<div class="input_userId_box">
					<input id="userId" name="userId" class="input_userId" placeholder="아이디를 입력하세요.">
				</div>
			</div>
			<div class="input_name_wrap">
				<div class="input_name_box">
					<input id="name" name="name" class="input_name" placeholder="이름을 입력하세요.">
				</div>
			</div>
			<div class="input_phone_wrap">
				<div class="input_phone_box">
					<input id="phone" name="phone" class="input_phone" placeholder="휴대폰 번호를 입력하세요.(010-1234-5678)">
				</div>
			</div>
			<div class="birth_wrap">
				<div class="birth_input_box">
					<input id="birth" name="birth" class="birth_input" placeholder="생년월일 8자리를 입력하세요.">
				</div>
			</div>
			<div class="button_wrap">
				<input type="button" class="prev_page_button"onclick= "location='loginWrite.do'" value="이전">
				<input type="button" id="btn_submit" class="submit_button" value="다음">
			</div>
		</div>
</div>
</form>
</div>

</body>
</html>