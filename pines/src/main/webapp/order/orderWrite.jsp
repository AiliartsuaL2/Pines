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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="images/pines.JPG" rel="shortcut icon" type="image/x-icon">
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


$(function(){
	

	
  document.getElementById("address_button").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 주소 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("vzipCode").value = data.address; // 주소 넣기
                document.getElementById("zipCode").value = data.address; // 주소 넣기
                document.querySelector("input[name=vaddress]").focus(); //상세입력 포커싱
            }
        }).open();
    });	
	

$("#btn_submit").click(function(){
		var point = $("#point").val();
		var numOfProduct = $("#numOfProduct").val();
		var freeShippingPrice = $("#freeShippingPrice").val();
		var shippingCost = $("#shippingCost").val();
		var productPrice = $("#productPrice").val();
		var orderOption = $("#orderOption").val();
		var discountWon = $("#discountWon").val();
		
		var totalAmount = 0;
		
		
		if(orderOption == "none"){
			if(productPrice * numOfProduct >= freeShippingPrice){
				totalAmount = productPrice * numOfProduct;			
			}
			else{
				totalAmount = productPrice * numOfProduct;	 
				totalAmount += shippingCost;		
			}
		}
		else{
			if((productPrice-discountWon)* numOfProduct >= freeShippingPrice){
				totalAmount = (productPrice-discountWon)* numOfProduct;
			}
			else{
				totalAmount = (productPrice-discountWon)* numOfProduct;
				totalAmount += shippingCost;
			}
		}
		
		if(point < totalAmount) {
			alert("포인트가 부족합니다.");
			return false;
		}
		else{// ajax 실행

			  	let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 

				$.ajax({
				url:"orderWriteSub.do", // 보낼 url
			  	data : frmData,
			  	type : 'POST',
			  	dataType:"text",
				    success : function(data){
							if(data == "ok"){
								alert("주문이 완료되었습니다.");
								location="mainList.do"
							} else{
								alert("주문에 실패하였습니다. \n 관리자에게 연락해주세요");
							}
				    	},
				    	error : function(data){
				    		alert("주문에 실패하였습니다. \n 관리자에게 연락해주세요");
				    	}
					}); 

			return false;
			}
	});
});

</script>
</head>
<style>
header {
    height: 215px;
}
main {
	width:1920px;
}
footer {
    height: 310px;
}
a { text-decoration:none }

.div_table_title{
	width : 1920px;
}

.table_title{
	margin-left:31%;
	margin-top:2%;
	font-size:15pt;
	font-weight:bold;
    height: 30px;
}

.table_sub_title{
	margin-left:32%;
	margin-top : -1%;
	color : #A5A5A5;
	font-size:10pt;
    height: 30px;
}


/* 상품등록 area */
.id_input_box2{
	border: 1px solid #A5A5A5;
	display: block;
	height:300px;
	width : 45%;
	margin-left : 610px;	
}
.id_input_box{
	border: 1px solid #A5A5A5;
	display: block;
	height:250px;
	width : 45%;
	margin-left : 610px;	
}
.category_input_box{
	display: block;
}
.input_box{
	float : left;
}
.id_input{
	width:50%;
	height:100%;
	border:none;
}
.input_Wrap{
	bottom: 0px;
}

.category_box{
	text-align : center;
	height:60px;
	width:100%;
}
.name_box{
	margin-top : -10px;
	text-align : center;
	height:60px;
	width:100%;
}
.name_category_case{
	text-align : center;
	height:36px;
	width:200px;
	padding-top : 12px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.name_case{
	text-align : center;
	height:35px;
	width:200px;
	padding-top : 13px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.point_value{
	text-align : left;
	display:inline-block; 
    float: left;
	height:40px;
	padding-top : 12px;
	margin-left : 30px; 
	width:630px;
	font-size : 18px;
	font-wight : bold;
}
.category_value{
	text-align : left;
	display:inline-block; 
    float: left;
	height:40px;
	padding-top : 12px;
	margin-left : 20px; 
	width:630px;
	font-size : 18px;
	font-wight : bold;
}
.empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:48px;
	width:660px;
	font-size : 18px;
	font-wight : bold;
}
.input_point{
	text-align : center;
	margin-left : 20px;
	display:inline-block; 
    float: left;
    border : 0;
	height:45px;
	background-color : #FFFFFF;
	width:100px;
	font-size : 18px;
	font-wight : bold;
}

.input_value{
	text-align : left;
	margin-left : 20px;
	display:inline-block; 
    float: left;
    border : 0;
	height:45px;
	width:90%;
	font-size : 18px;
	font-wight : bold;
}

.input_name{
	text-align : left;
	display:inline-block; 
	margin-left : 20px;
    float: left;
    border : 0;
	height:45px;
	width:600px;
	font-size : 18px;
	font-wight : bold;
}

.price{
	text-align : left;
	font-size : 15px;
	font-wight : bold;

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


.point_button{
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
    margin-top: -46px;
}



.btn_submit{
	display :inline-block;
	border-radius: 4px;
	height: 50px;
	width: 150px;
	margin-top: 20px;
	margin-bottom : 10px;
	margin-left : 80px;
	margin-right : 50px;
	border : 0;
	font-size : 20px;
	font-wight : bold;
    cursor: pointer;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.find-btn{
	text-align: center;
}
#btn_cancle{
    background-color: #FFFFFF;
    color : #FA6A6A;
    border : 1px solid #b3b3b3;
	
}
#btn_submit{
    background-color: #FA6A6A;
    color : #FFFFFF;
}
</style>
<body>

<div class = "whole_wrap">
<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->

<main>
<%@ include file="../include/searchBar.jsp" %>
<%@ include file="../include/topMenu.jsp" %>
<div class = "div_table_title">

</div>
	
	<p class = "table_title"> 구매자 정보</p>
		<div class="id_input_box">
		
	  	<c:forEach items="${memberList}" var="memberVO">
	  	
	  		<form id="frmData">
			  <input type="hidden" id="userId" name="userId" value="${memberVO.userId}">
			  <input type="hidden" id="productId" name="productId" value="${productList.productId}">
			  <input type="hidden" id="numOfProduct" name="numOfProduct" value="${productList.numOfProduct}">
			  <input type="hidden" id="orderOption" name="orderOption" value="${productList.orderOption}">
			  
			  <c:choose> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct >= productList.freeShippingPrice }">
	      						 <input type="hidden" id="totalAmount" name="totalAmount" value="${productList.productPrice*productList.numOfProduct}">
							</c:when> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct < productList.freeShippingPrice }">
	      						 <input type="hidden" id="totalAmount" name="totalAmount" value="${productList.productPrice*productList.numOfProduct+productList.shippingCost}">
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct >= productList.freeShippingPrice }">
	      						 <input type="hidden" id="totalAmount" name="totalAmount" value="${(productList.productPrice-productList.discountWon)*productList.numOfProduct}">
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct < productList.freeShippingPrice }">
	      						<input type="hidden" id="totalAmount" name="totalAmount" value="${(productList.productPrice-productList.discountWon)*productList.numOfProduct+productList.shippingCost}">	
							</c:when> 
			</c:choose> 
			  
			  
			  
			</form>
			
			<div class = "category_box">
	      			<label class="name_category_case"> 사용자 ID</label>
	      			<div class = "empty_box">
	      				<label class="category_value">${memberVO.userId}</label>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 사용자 이름</label>
	      			<div class = "empty_box">
						<input type="text" name="vname"id="vname"class="input_name" value ="${memberVO.name}">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 주소</label>
	      			<div class = "empty_box">
						<input type="text" name="vzipCode"id="vzipCode"class="input_value" value = "${memberVO.zipCode}" >
						<input type="button" id="address_button" class="address_button" value="주소 찾기">
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 상세주소</label>
	      			<div class = "empty_box">
						<input type="text" name="vaddress"id="vaddress"class="input_value" value = "${memberVO.address}" >
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 잔여 포인트</label>
	      			<div class = "empty_box">
	      				<label class="point_value">${memberVO.point} P</label>
						<input type="button" id="pointButton" class="point_button" value="포인트 충전">
	      			</div>
			</div>
			</c:forEach>
	</div>
		<p class = "table_title"> 상품 정보</p>
		<div class="id_input_box2">
				<div class = "category_box">
	      				<label class="name_category_case"> 상품 이름</label>
	      			<div class = "empty_box">
	      				<label class="category_value" >${productList.productName}</label>
	      			</div>
				</div>
				<div class = "name_box">
	      				<label class="name_case"> 상품 가격</label>
	      			<div class = "empty_box">
	      				<label class="category_value">${productList.productPrice}원</label>
	      			</div>
				</div>
				<div class = "name_box">
	      				<label class="name_case"> 옵션</label>
	      			<div class = "empty_box">
	      				<c:choose> 
							<c:when test="${productList.orderOption eq 'none'}">
	      						<label class="category_value" >선택안함</label>	
							</c:when> 
							<c:otherwise>
	      						<label class="category_value" >${productList.totalNum}개 이상 구매시 1개당 ${productList.discountWon}원 할인</label>
							</c:otherwise> 
						</c:choose> 
	      			</div>
				</div>
				<div class = "name_box">
	      				<label class="name_case"> 상품 수량</label>
	      			<div class = "empty_box">
	      				<label class="category_value" >${productList.numOfProduct}개</label>
	      			</div>
				</div>
				
				<div class = "name_box">
	      			<label class="name_case"> 배송비 </label>
	      			<div class = "empty_box">
	      				<c:choose> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct >= productList.freeShippingPrice }">
	      						<label class="category_value">0원</label>	
							</c:when> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct < productList.freeShippingPrice }">
	      						<label class="category_value">${productList.shippingCost}원</label>	
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct >= productList.freeShippingPrice }">
	      						<label class="category_value">0원</label>	
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct < productList.freeShippingPrice }">
	      						<label class="category_value">${productList.shippingCost}원</label>	
							</c:when> 
						</c:choose> 
	      			</div>
				</div>
				
				<div class = "name_box">
	      				<label class="name_case"> 총 금액</label>
	      			<div class = "empty_box">
	      				<c:choose> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct >= productList.freeShippingPrice }">
	      						<label class="category_value">${productList.numOfProduct * productList.productPrice}원</label>	
							</c:when> 
							<c:when test="${productList.orderOption eq 'none' && productList.productPrice*productList.numOfProduct < productList.freeShippingPrice }">
	      						<label class="category_value">${productList.numOfProduct * productList.productPrice + productList.shippingCost}원</label>	
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct >= productList.freeShippingPrice }">
	      						<label class="category_value">${productList.numOfProduct * (productList.productPrice-productList.discountWon)}원</label>	
							</c:when> 
							<c:when test="${productList.orderOption ne 'none' && (productList.productPrice-productList.discountWon)*productList.numOfProduct < productList.freeShippingPrice }">
	      						<label class="category_value">${(productList.numOfProduct * (productList.productPrice-productList.discountWon)) + productList.shippingCost}원</label>	
							</c:when> 
						</c:choose> 
	      			</div>
				</div>
				
		
			<div class="find-btn">
				<input type="button" id="btn_cancle" class="btn_submit" onclick= "location='productDetail.do?productId=${productList.productId}'" value="이전">
				<input type="button" id="btn_submit" class="btn_submit" value="결제하기">
			</div>
				
		</div>
	
	
</main>
</div>
</body>
</html>