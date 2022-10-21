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
      var name = $("#name").val();
      var phone= $("#phone").val();
      var birth = $("#birth").val();
      var userId= $("#userId").val();
      
      name = $.trim(name);
      phone = $.trim(phone);
      birth = $.trim(birth);  
	  if(name == ""){
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
	  else{
		  var url = "";
		  var windowTargetName = "targetName";
		  var features = "scrollbars=yes,width=500,height=300,location=no, resizable=yes";
		  window.open(url, windowTargetName, features);

		  // 2.POST로 데이터 전달
		  frm.action="idFindOk.do"; // 이동
		  frm.method="post";
		  frm.target=windowTargetName;
		  frm.submit();
		  //document.frm.submit();
	  }
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
	
}
.find_title_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
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
	font-size:28px;
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
	font-size:28px;
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


/* float 속성 해제 */
.clearfix{
	clear: both;
}
</style>
<body>


<form name ="frm" method="post" id="frm" action="idFindOk.do">
<div class="wrapper">
	<div class="wrap">
			<div class="subjecet">
			<span>
				<img src="images/pines.JPG" alt=""  width="100px" height="100px"/>
			</span>
			</div>

			<div class="find_title_wrap">
				<div class="find_title_box">
					<span class="find_title_input">아이디 찾기</span> 
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
				<input type="button" id="btn_submit" class="submit_button" value="확인">
			</div>
		</div>
</div>
</form>


</body>
</html>