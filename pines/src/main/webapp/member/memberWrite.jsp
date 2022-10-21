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
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true
    });

    $("#address_button").click(function(){
    	var w = 500;
    	var h = 100;
    	var url = "post1.do";
    	window.open(url,'zipCode','width='+w,'height'+h);
    	
    });
    $("#btn_idcheck").click(function(){
      var userId = $("#userId").val();
      userId = $.trim(userId);
	  if(userId == ""){
		  alert("아이디를 입력해주세요.");
		  $("#userId").focus();
		  return false;
	  } // idcheck.do로 데이터 전송 ,, ajax방식
	  
	  $.ajax({
		    type:"POST",
			data:"userId="+userId, // json설정
			url:"idcheck.do",
			dataType:"text",
			
			success: function(result){
				if(result == "ok"){
					alert("사용 가능한 아이디 입니다.");
				} else{
					alert("이미 사용중인 아이디 입니다.");
				}
			},
			error: function(){
				alert("오류발생");
			}
		  
	  });
      
    });
    
    $("#btn_submit").click(function(){//데이터 유효성 검사
      var userId = $("#userId").val();
      var pass= $("#pass").val();
      var name = $("#name").val();
      
      
      userId = $.trim(userId);
      pass = $.trim(pass);
      name = $.trim(name);  
	  if(userId == ""){
		  alert("아이디를 입력해주세요.");
		  $("#userId").focus();
		  return false;
	  }
	  if(pass == ""){
		  alert("비밀번호를 입력해주세요.");
		  $("#pass").focus();
		  return false;
	  }
	  if(name == ""){
		  alert("이름을 입력해주세요.");
		  $("#name").focus();
		  return false;
	  }
	  $("#userId").val(userId);
	  $("#pass").val(pass);
	  $("#name").val(name);
	  
	  var formData = $("#frm").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	  
	  $.ajax({
			type:"POST",
			data:formData,
			url:"memberWriteSave.do",
			dataType:"text",
			
			success: function(result){
				if(result == "ok"){
					alert("저장 완료");
					location="loginWrite.do"
				} else{
					alert("저장실패. \n 관리자에게 연락해주세요");
				}
			},
			error: function(){
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
.subject{
	text-align: center;	
	margin: 50px 0;	
    
}
.subject span{
    cursor:pointer;
}

/* 아이디 영역 */
.id_wrap{
	width: 100%;
    margin-top: 20px;
}
.id_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
    width: 800;
	
}
.id_input{
	width:80%;
	height:100%;
	border:none;
	font-size:28px;
}
/*아이디 찾기영역*/
.btn_idcheck{
	position: absolute;
    border: 1px solid #A5A5A5;
    height: 40px;
    width: 6%;
    float: right;
    font-size: 14px;  
    line-height: 40px;
    text-align : center;
    font-weight: 900;
    color: #BFBFBF;
    background-color: #FFFFFF;
    cursor: pointer;	
    margin-left : 670px;
	margin-top : -48px;
	}
/* 비밀번호 영역 */
.pw_wrap{
    margin-top: -1px;
	width: 100%;
}
.pw_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.pw_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 비밀번호 확인 영역 */
.pwck_wrap{
	width: 100%;
    margin-top: -1px;
}
.pwck_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.pwck_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 이름 영역 */
.user_wrap{
	width: 100%;
    margin-top: -1px;
}
.user_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.user_input{
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
}/* 휴대폰 번호 영역 */
.phone_wrap{
	width: 100%;
    margin-top: -1px;
}
.phone_input_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.phone_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}
/* 주소 영역 */
.address_wrap{
	width: 100%;
    margin-top: -1px;
}
.address_input_1_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
    width: 800;
}
.address_input_1{
	width:80%;
	height:100%;
	border:none;
	font-size:28px;	
}
.address_button{
	position: absolute;
    border: 1px solid #A5A5A5;
    height: 40px;
    width: 6%;
    float: right;
    font-size: 14px;  
    line-height: 40px;
    text-align : center;
    font-weight: 900;
    color: #BFBFBF;
    background-color: #FFFFFF;
    cursor: pointer;	
    margin-left : 675px;
	margin-top : -48px;
}


.address_input_2_wrap{
	margin-top: -1px;
}
.address_input_2_box{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
	
}
.address_input_2{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 가입하기 버튼 */

.first_page_button_wrap{
	margin: 20px;
	text-align: center;
}

.join_button{
	border: 1px solid #A5A5A5;
	width: 45%;
    height: 80px;
    background-color: #FA6A6A;
    font-size: 20px;
    font-weight: 900;
    color: white;
    margin-left : 20px;
    cursor:pointer;
}

.first_page_button{
	border: 1px solid #A5A5A5;
	width: 45%;
    height: 80px;
    color: #FA6A6A;
    background-color: #FFFFFF;
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


<form name ="frm" id="frm">
<div class="wrapper">
	<div class="wrap">
			<div class="subject">
			<span onClick="location.href='productList.do'">
				<img src="images/pines.JPG" alt=""  width="100px" height="100px"/>
			</span>
			</div>
			<div class="id_wrap">
				<div class="id_input_box">
					<input id="userId" name="userId" class="id_input" placeholder="아이디 설정">
				</div>
					<input type="button" id="btn_idcheck" class="btn_idcheck" value="중복 확인">
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input id="pass" name="pass" class="pw_input" placeholder="비밀번호 설정">
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_input_box">
					<input class="pwck_input" placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_input_box">
					<input id="name" name="name" class="user_input" placeholder="이름">
				</div>
			</div>
			<div class="birth_wrap">
				<div class="birth_input_box">
					<input id="birth" name="birth" class="birth_input" placeholder="생년월일 (8자리)">
				</div>
			</div>
			
			<div class="phone_wrap">
				<div class="phone_input_box">
					<input id="phone" name="phone" class="phone_input" placeholder="휴대폰 번호(010-1234-5678)">
				</div>
			</div>
			
			<div class="address_wrap">
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input id="zipCode" name="zipCode" class="address_input_1" placeholder="우편 번호">
					</div>
						<input type="button" id="address_button" class="address_button" value="우편번호 찾기">
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input id="address" name="address" class="address_input_2" placeholder="상세 주소">
					</div>
				</div>
			</div>
			<div class="first_page_button_wrap">
				<input type="button" class="first_page_button" value="이전" OnClick="location.href='loginWrite.do'">
				<input type="button" id="btn_submit" class="join_button" value="가입하기">
			</div>
		</div>
</div>
</form>


</body>
</html>