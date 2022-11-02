<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.div_Wrap{
  display: flex;
  justify-content: center;
}
.table1{
	margin-left:100px;
	height:50px;
	width:950px;
    background: #FA6A6A;
	font-size:15pt;
	color : #FFFFFF;
}
	.a1:link {text-decoration: none; color: white;}
	.a1:visited {text-decoration: none; color: white;}
	.a1:hover {text-decoration: none; color: white;}
</style>
<body >
<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>
<div class="div_Wrap">

<table class="table1">
	<tr>
		<th width="80" align="left" ><a class="a1" href="/pines/plantList.do" style="text-decoration:none; margin-left:50px;">식물</a></th>
		<th width="80" align="left"><a class="a1" href="/pines/flowerList.do" style="text-decoration:none">꽃 / 화환</a></th>
		<th width="80" align="left"><a class="a1" href="/pines/discountList.do" style="text-decoration:none">할인상품</a></th>
		
	<%	
		if(USERID == null){ // 로그인 안했을경우
			
	%>
		<th width="80" align="right"><a class="a1" href="/pines/loginWrite.do" style="text-decoration:none; font-size:11pt; margin-left:100px;">로그인</a></th>
		<th width="80" align="right"><a class="a1" href="/pines/memberWrite.do" style="text-decoration:none; font-size:11pt; margin-right:50px;">회원가입</a></th>
	<%
		} else { // 로그인 성공시
	%>
		<th width="80 align="right"><a class="a1" href="/pines/logout.do" style="text-decoration:none; font-size:11pt; margin-left:100px;">로그아웃</a></th>
		<th width="80 align="right"><a class="a1" href="/pines/memberOrder.do" style="text-decoration:none; font-size:11pt; margin-right:50px;">마이 페이지</a></th>
	<%
		}
	%>
	</tr>
</table>
</div>
</body>
</html>