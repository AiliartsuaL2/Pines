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
	 $("#btn_submit").click(function(){//데이터 유효성 검사
		  	document.frm.submit();
	 });
	
	
	var list = new Array();
  	<c:forEach items="${productList}" var="mainVO">
  		list.push({image1:'${mainVO.image1}'
  				 , image2:'${mainVO.image2}'
  				 , image3:'${mainVO.image3}'
  	  			 , image4:'${mainVO.image4}'
  				});
	</c:forEach>
		
	let defaultImage1 = list[0].image1;
	let defaultImage2 = list[0].image2;
	let defaultImage3 = list[0].image3;
	let defaultImage4 = list[0].image4;
	
    $('input[name="fileItem1"]').attr('src', defaultImage1);
    $('input[name="fileItem2"]').attr('src', defaultImage2);
    $('input[name="fileItem3"]').attr('src', defaultImage3);
    $('input[name="fileItem4"]').attr('src', defaultImage4);
    
    var select = $("#vorderOption");

    select.change(function(){
  	  	const orderOption = document.getElementById('vorderOption');
    	$("label[for = 'valueLabel']").text($("#vorderOption option:selected").text());
  	  	$('input[name="orderOption"]').attr('value', orderOption.value);
    });
    

    $('#vnumOfProduct').on("blur", function () {
	  const resultElement1 = document.getElementById('vnumOfProduct');
	  const resultElement2 = document.getElementById('productPrice');
	  const resultElement3 = document.getElementById('vorderOption');
	  const resultElement4 = document.getElementById('discountWon');

	  let number = resultElement1.value;
	  let number2 = resultElement2.value;
	  let optionCheck = resultElement3.value;
	  let number3 = resultElement4.value;

	  
	  if(optionCheck != "none"){
		  number2 = number2-number3;
	  }

	  resultElement1.value = number;
	  $("label[for = 'totalAmount']").text(number2*number+"원");
	  $('input[name="numOfProduct"]').attr('value', number);
	  
		
    });
    
});





function count(type)  {
	  // 결과를 표시할 element
	  const resultElement1 = document.getElementById('vnumOfProduct');
	  const resultElement2 = document.getElementById('productPrice');
	  const resultElement3 = document.getElementById('vorderOption');
	  const resultElement4 = document.getElementById('discountWon');
	  
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement1.value;
	  let number2 = resultElement2.value;
	  let optionCheck = resultElement3.value;
	  let number3 = resultElement4.value;
	  
	  if(optionCheck != "none"){
		  number2 = number2-number3;
	  }
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	    if(number < 1){
	    	number = 1;
	    }
	  }
	  // 결과 출력
	  resultElement1.value = number;
	  $("label[for = 'totalAmount']").text(number2*number+"원");
	  $('input[name="numOfProduct"]').attr('value', number);
	}


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
.id_input_box{
	display: block;
	height:500px;
	width : 45%;
	margin-left : 610px;	
}



.btn_submit{
	display :inline-block;
	border-radius: 4px;
	height: 50px;
	width: 150px;
	border : 0;
	font-size : 14px;
	font-wight : bold;
    cursor: pointer;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}


.img_display_thumbnail{
	height: 100%;
  	border-radius: 4px;
	border : 1px solid #b3b3b3;
	width : 100%;
	margin-top : 5%;
	margin-left : 2%;
}
.img_display{
	float:left;
	height: 25%;
  	border-radius: 4px;
	border : 1px solid #b3b3b3;
	width : 20%;
	margin-top : 10%;
	margin-left : 4%;
	
}


.img_empty_box{
	width : 50%;
	height: 90%;
	float : left;
}

.img_wrap_thumbnail{
	float : left;
	width : 80%;
	height: 80%;
	margin-top : 1%;
	margin-left : 4%;
}

.img2_wrap{
	width : 80%;
	height: 60%;
	margin-top : 1%;
	margin-left : 15%;
}


.img2_display{
	height: 50%;
  	border-radius: 4px;
	border : 1px solid #b3b3b3;
	width : 80%;
	margin-top : 2%;
	margin-left : 4%;
	
}

.img_wrap{
	width : 80%;
	height: 60%;
	margin-top : 1%;
	margin-left : 4%;
}
.raw_img{
	width : 100%;
	height: 100%;
}

.info_box{
	width : 50%;
	height: 90%;
	float : right;
}
.name_box{
	width : 90%;
	height: 45%;
	margin-top : 5%;
	border : 1px solid #b3b3b3;
}
.name_wrap{
	width : 80%;
	height: 15%;
	margin-left : 10%;
	margin-top : 7%;
}
.productName{
    background-color: #FFFFFF;
	font-size:18pt;
	font-weight:bold;
	border:0;
}
.price_wrap{
	margin-top : 3%;
	margin-bottom : 10%;
	width : 80%;
	height: 15%;
	margin-left : 10%;
}
.productPrice{
    background-color: #FFFFFF;
	border:0;
	width:70px;
	font-size:16pt;
	font-weight:bold;
	color : red;
}
.price_Unit{
	width : 20px;
	height: 20px;
	font-size:16pt;
	font-weight:bold;
	color : red;
}



.shipping_wrap{
	width : 100%;
	height: 10%;
	margin-left : 10%;
}

.shippingCost{
    background-color: #FFFFFF;
	border:0;
	font-size:12pt;
}



.option_box{
	margin-top : 3%;
	width : 90%;
	height: 10%;
	border : 0;	
}
.sellect_class{
	margin-top : 3px;
	width : 100%;
	height: 90%;
	border : 1px solid #b3b3b3;	
}

.value_box{
	margin-top : 5%;
	width : 80%;
	height : 10%;
}

.number_box{
	margin-top : 3px;
	width : 90%;
	height : 10%;
}
.numOfProduct{
	text-align : center;
    border : 1px solid #b3b3b3;
    padding: 0;
    width: 15%;
    float: left;
    height: 38px;
}
.num_btn_box{
	
    width: 30px;
    float: left;
    height: 40px;

}
.numBtn{
    width: 20px;
    height: 20px;
    background-color: #FA6A6A;
    color : #FFFFFF;
    border : 1px solid #b3b3b3;
    cursor:pointer;
}
.totalAmount{
	text-align:center;
    margin-left: 5%;
    width: 60%;
    height: 70%;
    border : 1px solid #b3b3b3;
    padding-top : 2%;
	float : left;
}
.find-btn{
	margin-top : 5%;
	height : 30%;
	text-align: center;
}
#btn_cancle{
    background-color: #FFFFFF;
    color : #FA6A6A;
    border : 1px solid #b3b3b3;
    float : left;
	
}
#btn_submit{
	margin-left : 10%;
	float : left;
    background-color: #FA6A6A;
    color : #FFFFFF;
}
.product_description{
	text-align : center;    
	display: block;
    width: 43%;
	font-size : 20px;
    text-weight:bold;
    border : 1px solid #b3b3b3;
    margin-left: 610px;
	
}
.description_wrap{
	margin-top : 10%;
	margin-bottom : 10%;
}
</style>
<body>

<div class = "whole_wrap">
<br>
<!-- 번호, 제목, 글쓴이, 등록일 , 조회수 -->
<header>
<%@ include file="../include/searchBar.jsp" %>
</header>
<main>
<%@ include file="../include/topMenu.jsp" %>
<div class = "div_table_title">

</div>
	
	  	<c:forEach items="${productList}" var="mainVO">
	<p class = "table_title"> 상품 정보</p>
	<p class = "table_sub_title"> ${mainVO.parentCategoryName} > ${mainVO.categoryName} </p>	
	
	
	    <form name ="frm" method ="post" id="frm" action="orderLoginCheck.do" >    
			  <input type="hidden" id="productId" name="productId" value="${mainVO.productId}">
			  <input type="hidden" id="productPrice" name="productPrice" value="${mainVO.productPrice}">
			  <input type="hidden" id="shippingCost" name="shippingCost" value="${mainVO.shippingCost}">
			  <input type="hidden" id="freeShippingPrice" name="freeShippingPrice" value="${mainVO.freeShippingPrice}">
			  <input type="hidden" id="numOfProduct" name="numOfProduct" value="1" >
			  <input type="hidden" id="orderOption" name="orderOption" value="none" >
			  <input type="hidden" id="productName" name="productName" value="${mainVO.productName}">
			  <input type="hidden" id="totalNum" name="totalNum" value="${mainVO.totalNum}" >
			  <input type="hidden" id="discountWon" name="discountWon" value="${mainVO.discountWon}">
	    </form> 
	    
		<div class="id_input_box">
					

	      			<div class = "img_empty_box">
	      				<div class = img_wrap_thumbnail>
	      					<div class="img_display_thumbnail">
	      						<input type="image" name="fileItem1" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
						</div>
						<div class = img_wrap>
	      					<div class="img_display">
	      						<input type="image" name="fileItem1" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>	
	      					<div class="img_display">
	      						<input type="image" name="fileItem2" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>	
	      					<div class="img_display">
	      						<input type="image" name="fileItem3" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img_display">
	      						<input type="image" name="fileItem4" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
						</div>						
	      			</div>
	      			<div class = "info_box">
	      				<div class = "name_box">
	      					<div class = "name_wrap">
		      					<input disabled type="text" class="productName" id="vproductName" name="vproductName" value="${mainVO.productName}">
							</div>
							<div class = "price_wrap">
								<label class="price_Unit">${mainVO.productPrice}원</label>
							</div>
							<div class = "shipping_wrap">
								<input disabled type="text" class="shippingCost" id="vshippingCost" name="vshippingCost" value="배송비  ${mainVO.shippingCost}원">
							</div>
							<div class = "shipping_wrap">
								<label type="text" id="vfreeShippingPrice" name="vfreeShippingPrice" >주문 금액 ${mainVO.freeShippingPrice}원 이상 시 배송비 무료</label>
	      					</div>
	      				</div>
	      				
	      				<div class = "option_box">
								<select name="vorderOption" id="vorderOption" class="sellect_class">
									<option value="none"  style="height:50px; ">선택안함</option>
									<option value="checked" style="height:50px;">${mainVO.totalNum}개 이상 구매시 1개당 ${mainVO.discountWon}원 할인  </option>
								</select>
	      				</div>
	      				<div class = "value_box">
	      					<div class = "value">
								<label for="valueLabel">선택 안함</label>
	      					</div>
	      				</div>
	      				<div class = "number_box">
	      					<div class = "number">
	      					<input type="text" class="numOfProduct" id="vnumOfProduct" name="vnumOfProduct" value=1>
	      					<div class="num_btn_box">
	      						<input type='button' class="numBtn" onclick='count("plus")' value='+'/>
	      						<input type='button' class="numBtn" onclick='count("minus")' value='-'/>
	      					</div>
	      					</div>
	      					<div class="totalAmount">
	      						<label for="totalAmount" name="totalAmount">${mainVO.productPrice}원 </label>
	      					</div>
	      				</div>
	      				
						<div class="find-btn">
							<input type="button" id="btn_cancle" class="btn_submit" onclick= "location='sellerCheck.do'" value="장바구니 담기">
							<input type="button" id="btn_submit" class="btn_submit" value="주문하기">
						</div>
	      				
	      			</div>	 			
		</div>
	      		<div class="product_description">
	      				<div class = img2_wrap>
	      					<div class="img2_display">
	      						<input type="image" name="fileItem1" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>	
	      					<div class="img2_display">
	      						<input type="image" name="fileItem2" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>	
	      					<div class="img2_display">
	      						<input type="image" name="fileItem3" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img2_display">
	      						<input type="image" name="fileItem4" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
						</div>	
	      			<div class = description_wrap>
	      				<label type="text" id="productName" name="productName" >제품 설명 : ${mainVO.productDescription}</label>
	      			</div >
	      			
	      			
	      		</div>	

	  		</c:forEach>
</main>
</div>
</body>
</html>