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

</head>
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
.id_input_box{
    width: 38%;
    position: absolute;
    left: 40%;
    top: 37%;
}

.name_box{
    text-align: left;
    width: fit-content;
    display: table;
    margin-top : 20px;
}

.price_box{
    text-align: left;
    width: fit-content;
    display: table;
    font-size: 18px;
    font-weight: bold;
}

.entity_box{
    text-align: center;
    width: 100%;
    height : 150px;
    margin-top: -1px;
	border : 1px solid #BABABA;
    margin-top : 20px;
}


.delivery_box{
	margin-top : 10px;
	margin-left : 5%;
	width : 15%;
	height : 10px;
	font-weight:bold;
}
.delivery_status{
	background-color : #ffffff;
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    width: fit-content;
    font-size: 16px;
}
.product_name{
	background-color : #ffffff;
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    margin-left: 20px;
    width: fit-content;
    font-size: 20px;
    font-weight: bold;
}

.product_price{
	background-color : #ffffff;
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    margin-left: 20px;
    width: fit-content;
    font-size: 14px;
    font-weight : 300;
}
.num_Of_Product{
	background-color : #ffffff;
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    width: 50px;
    font-size: 14px;
    font-weight : 300; 
}
.total_price{
	margin-top : 10px;
	margin-left : 20px;
	background-color : #ffffff;
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    width: 100px;
    font-size: 16px;
    font-weight : bold; 
}
.detail_btn_box{
	float:right;
	margin-right : 9%;
    width: 20%;
    height : 23%;
    margin-top: -13%;
}
.btn_detail{
    background-color: #FFFFFF;
	border: 1px solid #FA6A6A;
    color : #FA6A6A;
    width: 100%;
    height : 100%;
    margin-top: 16%;
    font-size : 14px;
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
	color:#FA6A6A;
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
	color:#A5A5A5;
    cursor: pointer;
}

.img_box{
	
	float : left;
	margin : 20px;
	width : 12%;
	height : 100px;
}

.raw_image{
	width : 100%;
	height : 100%;
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
		<p class = "table_title"> 주문조회</p>
	</div>
	<div class="id_input_box">
				<c:forEach items="${orderList}" var="mainVO">
					<div class = "entity_box">
							<div class="delivery_box">
								<label class="delivery_status" >${mainVO.deliveryStatus}</label>
							</div>
							<div class="img_box">
								<input class="raw_image" type="image" src="${mainVO.image1}">		
							</div>
							<div class = "name_box">
	      						<label class="product_name" >${mainVO.productName}</label>
	      					</div>
	      					<div class = "price_box">
	      						<label class="product_price" >${mainVO.productPrice}원</label>
	      						<label class="num_Of_Product" >/${mainVO.numOfProduct}개</label>
	      					</div>
	      					<div class = "price_box">
	      					<c:choose> 
								<c:when test="${mainVO.orderOption eq 'none'}">
	      							<label class="product_price" >옵션 : ${mainVO.totalNum}개 이상 구매시 1개당 ${mainVO.discountWon}원 할인</label>
								</c:when> 
								<c:otherwise>
	      							<label class="product_price" >옵션 : 선택안함</label>
								</c:otherwise> 
							</c:choose> 
	      					</div>
	      					<div class ="total_price_box">
	      						<label class="total_price" >${mainVO.totalAmount}원</label>
	      					</div>
	      					<div class="detail_btn_box">
	      						<input type="button" class="btn_detail" value="주문 상세"  onclick="location='orderDetail.do?orderId=${mainVO.orderId}'">
	      						<input type="button" class="btn_detail" value="상품 상세보기" onclick="location='productDetail.do?productId=${mainVO.productId}'">
	      					</div>
					</div>
					
				</c:forEach>
	</div>
</main>
<footer>
</footer>
</div>
</body>
</html>