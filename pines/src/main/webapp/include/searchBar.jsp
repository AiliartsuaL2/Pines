<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.div1{
	width : 100px;
	height : 100px;
	margin-left:100px;
	margin-top:80px;
	float:left;
}
.div2{
	text-align:right;
	font-size:15pt;
	float:left;
	margin-top:100px;
	margin-left:50px;
}
</style>
<body>
		<div class="div1">
		<button type="button" onclick= "location='productList.do'"><img src="images/pines.JPG" alt="" width="100px" height="100px"></button>
		</div>
		<div class="div2">
		<form name="searchFrm" method="post" action="productList.do">
			<select name="searchGubun" id="searchGubun" style="height:50px; weight:100px; border:solid 2px #FA6A6A;">
				<option value="product_name"  style="height:50px; ">상품명 </option>
				<option value="store_id" style="height:50px;">판매처 </option>
			</select>
			<input type="text" name="searchText"id="" placeholder="찾으시는 상품을 입력해주세요"style="width:500px; height:45px; border:solid 2px #FA6A6A; ">
			<button type="submit" style="height:48px; border:solid 2px #FA6A6A; ">검색</button>
		</form>
		</div>
</body>
</html>