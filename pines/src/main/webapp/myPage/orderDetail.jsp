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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
.id_input_box{
    width: 42%;
    position: absolute;
    left: 40%;
    top: 40%;
}

.empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:48px;
	width:78%;
	font-size : 18px;
	font-wight : bold;
}
.category_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;
}
.pass_category_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;

}
.address_box{
    text-align: center;
    height: 60px;
    width: 100%;
    margin-top: -11px;
}



.name_category_case{
	text-align : center;
	height:36px;
	width:20%;
	padding-top : 12px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}


.pass_category_case{
	text-align : center;
	height:65px;
	width:20%;
	padding-top : 33px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}

.address_category_case{
	text-align : center;
	height:65px;
	width:20%;
	padding-top : 33px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}


.address_button{
    border: 1px solid #A5A5A5;
    height: 40px;
    width: 20%;
    font-size: 14px;
    line-height: 40px;
    text-align: center;
    font-weight: 900;
    color: #BFBFBF;
    background-color: #FFFFFF;
    cursor: pointer;
    margin-left: 400px;
    margin-top: -43px;
}




.category_value{
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    margin-left: 20px;
    background-color : white;
    width: 95%;
    font-size: 16px;
}
.exit_value{
	text-align: left;
    display: inline-block;
    float: left;
    height: 95%;
    border: none;
    color : #BABABA;
    background-color : white;
    margin-left: 20px;
    width: 95%;
    font-size: 16px;
}


.find-btn{
	position : absolute;    
	left: 57%;
    top: 93%;
	text-align: center;
}
#btn_submit{
	border : 0;
    background-color: #FA6A6A;
    color : #FFFFFF;
    width: 150px;
    height : 50px;
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


</style>
<body>
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



<div class = "whole_wrap">
<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/myPageTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 주문 상세</p>
	</div>
	 <c:forEach items="${orderList}" var="mainVO">
	 <div class="id_input_box">
				<div class = "category_box">
	      				<label class="name_category_case">상품명</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.productName}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">상품 가격</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.productPrice}원">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">구매 개수</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.numOfProduct}개">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">옵션</label>
	      			<div class = "empty_box">
	      				<c:choose> 
							<c:when test="${mainVO.orderOption eq 'none'}">
	      							<input disabled class="category_value" value="선택안함">
							</c:when> 
							<c:otherwise>
	      						<input disabled class="category_value" value="${mainVO.totalNum}개 이상 구매시 1개당 ${mainVO.discountWon}원 할인">
							</c:otherwise> 
						</c:choose> 
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">배송비</label>
	      			<div class = "empty_box">
					<c:choose> 
						<c:when test="${mainVO.totalAmount >= mainVO.freeShippingPrice}">
	      						<input disabled class="category_value" value="0원">
						</c:when> 
						<c:otherwise>
	      						<input disabled class="category_value" value="${mainVO.shippingCost}원">
						</c:otherwise> 
					</c:choose> 
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">총 가격</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.totalAmount}원">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">배송상태</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.deliveryStatus}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">구매일시</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.purchaseDate}">
	      			</div>
				</div>
				<div class = "category_box">
	      				<label class="name_category_case">상점 이름</label>
	      			<div class = "empty_box">
	      				<input disabled class="category_value" value="${mainVO.storeName}">
	      			</div>
				</div>
				
	</div>
	</c:forEach>

</main>
<footer>
</footer>
</div>
</body>
</html>