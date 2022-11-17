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

</style>
<body >
	<div class="div_Wrap">
		<div class="topBar">
			<input type="button" class="page_btn" value="마이 페이지">
		</div>
	</div>
	<div class="category_wrap">
		<div class="sub_category">
			<input type="button" class="category_btn_order" value="주문 내역 조회" onclick="location='orderInquiry.do'">
		</div>
		<div class="sub_category">
			<input type="button" class="category_btn_info" value="정산" onclick="location='memberCheck.do'">
		</div>
		<div class="sub_category">
			<input type="button" class="category_btn_payment" value="정산 내역 조회" onclick="location='paymentManage.do'">
		</div>
	</div>
</body>
</html>