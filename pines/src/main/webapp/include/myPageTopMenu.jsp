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
	padding-top : 15px;
	float : left;
	background-color : #FA6A6A;
	border : 0;
	width:20%;
	font-size : 15px;
	font-weight : bold;
	height:35px;
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
.category_btn{
	width:100%;
	height:100%;
	border: 1px solid #A5A5A5;
	font-size : 15px;
	font-weight : bold;
	background-color:white;
	color:#A5A5A5;
	cursor:pointer;
}

</style>
<body >
	<div class="div_Wrap">
		<div class="topBar">
			<input type="button" class="page_btn" value="마이 페이지">
			<label class="pointLabel">포인트 8000원</label>
		</div>
	</div>
	<div class="category_wrap">
		<div class="sub_category">
			<input type="button" class="category_btn" value="주문 조회">
		</div>
		<div class="sub_category">
			<input type="button" class="category_btn" value="개인정보관리">
		</div>
		<div class="sub_category">
			<input type="button" class="category_btn" value="결제수단관리">
		</div>
	</div>
</body>
</html>