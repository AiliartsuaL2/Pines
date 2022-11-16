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

</head>
<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement1 = document.getElementById('totalPoint');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement1.value;
	  
	  // 더하기/빼기
	  if(type === 'man') {
	    number = parseInt(number) + 10000;
	  }
	  else if(type === 'man5')  {
	    number = parseInt(number) + 50000;
	  }
	  else if(type=== 'man10'){
		number = parseInt(number) + 100000;
	  }
	  // 결과 출력
	  resultElement1.value = number;
	  $("label[for = 'valueLabel']").text(number+"P");
	  $('input[name="totalPoint"]').attr('value', number);
	}
	
$(function(){
	$("#btn_submit").click(function(){
		
	    var totalPoint= $("#totalPoint").val();
	    
	    
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data:"chargePoint="+totalPoint,   // json(전송)타입
    		url:"memberPointCharge.do",
    		dataType:"text",     // 리턴 타입

    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "1") {
    				alert(totalPoint+"포인트가 정상적으로 충전되었습니다.");
    				location="paymentManage.do";
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

.cur_point_box{
    width: 35%;
    position: absolute;
    left: 46%;
    top: 45%;
}
.id_input_box{
    width: 52%;
    position: absolute;
    left: 46%;
    top: 52.7%;
}
.btn_box{
    width: 50%;
    position: absolute;
    left: 45.3%;
    top: 66.3%;

}
.cur_point{
	text-align : center;
	border : 0;
    background-color: #FFFFFF;
    border: solid 1px #D5D5D5;
    margin-left:-10px;
    color : #BABABA;
    width: 89.7%;
    height : 70px;
    font-size : 18px;
    font-weight: bold;
}


.btn_point{
	border : 0;
    background-color: #FFFFFF;
    border: solid 1px #D5D5D5;
    margin-left:-10px;
    color : #BABABA;
    width: 20.63%;
    height : 100%;
    font-size : 18px;
    font-weight: bold;
    cursor : pointer;
}
.input_point{
	text-align : center;
	border : 0;
    background-color: #FFFFFF;
    border: solid 1px #D5D5D5;
    margin-left:-10px;
    width: 60.3%;
    height : 100%;
    font-size : 18px;
    font-weight: bold;
    cursor : pointer;
}
.point_value{
	margin-top : -1px;
    height : 64px;

}
.btn_submit{
	border : 0;
    background-color: #FA6A6A;
	border: 1px solid #FFFFFF;
    color : #FFFFFF;
    width: 63.8%;
    height : 70px;
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
	color:#A5A5A5;
    cursor: pointer;
}
.category_btn_payment{
	width:90%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#FA6A6A;
    cursor: pointer;
}
.cur_point_label{
    width: 84.1%;
    text-align:center;
    padding:20px;
    height: 26px;
    display: inline-block;
    margin-left: -10px;
	border: 1px solid #D5D5D5;
	font-size : 20px;
	font-weight : bold;
	background-color:white;
	margin-top:6px;
}
.point_label{
    width: 56.6%;
    text-align:center;
    padding:20px;
    height: 26px;
    display: inline-block;
    margin-left: -10px;
	border: 1px solid #D5D5D5;
	font-size : 20px;
	font-weight : bold;
	background-color:white;
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
		<p class = "table_title"> 포인트 충전</p>
	</div>
	<c:forEach items="${memberList}" var="memberVO">
	<div class="cur_point_box">
		<div class="point_box">
					<label class="cur_point_label">보유 포인트 : ${memberVO.point}P</label>
		</div>
	</div>
	<div class="id_input_box">
			<div class="point_box">
				<div class="point_value">
					<input type="button" class="btn_point" onclick='count("man")' value="+10,000원">
					<input type="button" class="btn_point" onclick='count("man5")' value="+50,000원">
					<input type="button" class="btn_point" onclick='count("man10")' value="+100,000원">
				</div>
				<div class="point_value">
					<label class="point_label" for="valueLabel" name="valueLabel">0P</label>
					<input type="hidden" class="input_point" id="totalPoint" name="totalPoint" value="0">
				</div>
			</div>
	</div>
	</c:forEach>
	<div class="btn_box">
			<input type="button" class="btn_submit" id="btn_submit" value="충전하기">
	</div>

</main>
<footer>
</footer>
</div>
</body>
</html>