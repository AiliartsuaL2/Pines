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
.topBar{
	background-color : #FA6A6A;
	width:49.4%;
	height:50px;
	margin-left : 5.2%;
}
.pointLabel{
	text-align : center;
	padding-top : 15px;
	float : right;
	background-color : #FA6A6A;
	width:20%;
	height:35px;
	color : white;
	font-size : 15px;
	font-weight : bold;
}
.page_btn{
	text-align : center;
	padding-top : 12px;
	float : left;
	background-color : #FA6A6A;
	border : 0;
	width:18%;
    font-size: 20px;
	font-weight : bold;
	color : white;
	cursor : pointer;
}
.category_wrap{
  	display: flex;
  	justify-content: center;
	width:10%;
	height:200px;
	margin-left : 27.9%;
	display: flex;
	flex-direction : column;
	margin-top : -10px;
	
}

.sub_category{
	width:100%;
	height:30%;

}


.login_btn{
	text-align : center;
	padding-top : 15px;
	float : left;
	background-color : #FA6A6A;
	border : 0;
	width:10%;
    font-size: 15px;
	font-weight : bold;
	color : white;
	cursor : pointer;
    margin-left: 14%;

}
.myPage_btn{
	text-align : center;
	padding-top : 15px;
	float : left;
	background-color : #FA6A6A;
	border : 0;
	width:10%;
    font-size: 15px;
	font-weight : bold;
	color : white;
	cursor : pointer;
    margin-left: 5%;

}

</style>
<body >
<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>
	<div class="div_Wrap">
		<div class="topBar">
			<input type="button" class="page_btn" value="식물" onclick="location='plantList.do?parentCategoryId=plant'">
			<input type="button" class="page_btn" value="꽃 / 화환" onclick="location='flowerList.do?parentCategoryId=flower'">
			<input type="button" class="page_btn" value="할인상품" onclick="location='discountList.do'">
		<%	
		if(USERID == null){ // 로그인 안했을경우
		%>
			<input type="button" class="login_btn" value="로그인" onclick="location='loginWrite.do'">
			<input type="button" class="myPage_btn" value="회원가입" onclick="location='memberWrite.do'">
		<%
		} else { // 로그인 성공시
		%>
			<input type="button" class="login_btn" value="로그아웃" onclick="location='logout.do'">
			<input type="button" class="myPage_btn" value="마이페이지" onclick="location='memberCheck.do'">
		
		<%
		}
		%>
		</div>
	</div>
</body>
</html>