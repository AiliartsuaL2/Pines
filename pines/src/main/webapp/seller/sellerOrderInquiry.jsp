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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<script>
	$(function(){
		date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		var today = year+"-"+month+"-"+day;
		var oneMonthAgo = year+"-"+(month-1)+"-"+day;
		var threeMonthAgo = year+"-"+(month-3)+"-"+day;
		var sixMonthAgo = year+"-"+(month-6)+"-"+day;

	  	$('input[name="endOrderPeriod"]').attr('value', today);
	  	$('input[name="startOrderPeriod"]').attr('value', oneMonthAgo);
		

		$("#btn_submit").click(function(){ // 검색 ajax
			$("#ajaxDiv").empty();// 요소 내용 제거	
			ajaxLoad();
		});

		$("#btn_1month").click(function(){ // 1개월 버튼
		  	$('input[name="startOrderPeriod"]').attr('value', oneMonthAgo);
			$("#ajaxDiv").empty();// 요소 내용 제거	
			ajaxLoad();
		});

		$("#btn_3month").click(function(){ // 3개월 버튼
		  	$('input[name="startOrderPeriod"]').attr('value', threeMonthAgo);
			$("#ajaxDiv").empty();// 요소 내용 제거	
			ajaxLoad();
			
		});

		$("#btn_6month").click(function(){ // 6개월 버튼
		  	$('input[name="startOrderPeriod"]').attr('value', sixMonthAgo);
			$("#ajaxDiv").empty();// 요소 내용 제거	
			ajaxLoad();
			
		});
	  	
		function ajaxLoad(){
			var formData2 = $("#searchForm").serialize(); 
			// 비동기 전송방식,, (화면 이동이 없음)의 jquery 함수,, ajax
			$.ajax({
				url:"sellerOrderListSearch.do", // 보낼 url
				data:formData2, //폼 자체
				dataType:"json",
				success: function(data){
					var html = "";
					for(var i=0; i<data['obj1'].length;i++){
						html += "<div class = 'entity_box'>";
						html += "<div class='delivery_box'>";
						html += "<label class='delivery_status'>"+JSON.stringify(data['obj1'][i]['deliveryStatus']).replace(/\"/gi, "")+"</label>";
						html += "</div>"
						html += "<div class='img_box'>";
						html += "<input class='raw_image' type='image' src='"+JSON.stringify(data['obj1'][i]['image1']).replace(/\"/gi, "")+"'>";
						html += "</div>";
						html += "<div class = 'name_box'>";
						html += "<label class='product_name' >"+JSON.stringify(data['obj1'][i]['productName']).replace(/\"/gi, "")+"</label>";
						html += "</div>";
						html += "<div class = 'price_box'>";
      					html += "<label class='product_price' >"+JSON.stringify(data['obj1'][i]['productPrice']).replace(/\"/gi, "")+"원</label>";
      					html += "<label class='num_Of_Product' >/"+JSON.stringify(data['obj1'][i]['numOfProduct']).replace(/\"/gi, "")+"개</label>";
						html += "</div>";
						html += "<div class = 'price_box'>";
						if(JSON.stringify(data['obj1'][i]['orderOption']).replace(/\"/gi, "") == 'none'){
	      					html += "<label class='product_price'>옵션 : "+JSON.stringify(data['obj1'][i]['totalNum']).replace(/\"/gi, "")+"개 이상 구매시 1개당";
	      					html += JSON.stringify(data['obj1'][i]['discountWon']).replace(/\"/gi, "")+"원 할인</label>"; 
						}
						else{
							html += "<label class='product_price' >옵션 : 선택안함</label>";
						}
						html += "</div>";
						html += "<div class ='total_price_box'>";
						html += "<label class='total_price' >" +JSON.stringify(data['obj1'][i]['totalAmount']).replace(/\"/gi, "")+"원</label>" ;
						html += "</div>";
						html += "<div class='detail_btn_box'>";
						html += "<input type='button' class='btn_detail' value='주문 상세'  onclick='location=&#39;orderDetail.do?orderId="+JSON.stringify(data['obj1'][i]['orderId']).replace(/\"/gi, "")+"&#39;'>";
						html += "<input type='button' class='btn_detail' value='상품 상세보기'  onclick='location=&#39;productDetail.do?productId="+JSON.stringify(data['obj1'][i]['productId']).replace(/\"/gi, "")+"&#39;'>";
						html += "</div>";
						html += "</div>";					
					}
					$("#ajaxDiv").append(html);
				},	
				error: function(request,status,error){	// 시스템적인 에러..SQL이라던지 등,,
					alert("오류발생");
				}
			});//
		}
		
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
    top: 48%;
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

.searchWrap{
    width: 38.5%;
    height:13%;
    position: absolute;
    left: 40%;
    top: 39%;
}
.searchBox{
    width: 20%;
    height:30px;
    padding-top:8px;
    background-color:#FCDDDC;
    color:#8F8F8F;
    font-size:12pt;
    font-weight:bold;
    text-align : center;
    display:inline;
    border : 1px solid #8F8F8F;
    float:left;
}
.periodBox{
    width: 20%;
    height:30px;
    padding-top:8px;
    background-color:#FCDDDC;
    color:#8F8F8F;
    font-size:12pt;
    font-weight:bold;
    text-align : center;
    display:inline;
    border : 1px solid #8F8F8F;
    float:left;
    margin-top:-1px;
}
.searchInput{
	width:78%;
	height:38px;
	margin-left:-1px;
	float:left;
    border : 1px solid #8F8F8F;
	display:block;
    color : #8f8f8f;
}
.periodInput{
	width:78%;
	height:38px;
	margin-top:-1px;
	margin-left:-1px;
	float:left;
    border : 1px solid #8F8F8F;
	display:block;
}
.searchGubun{
	text-align:center;
	width:20%;
	height:95%;
	border : 0;
    color : #8f8f8f;
}
.seachText{
	width:60%;
	height:95%;
	border : 0;
}
.period_input{
	width: 16%;
	height: 50%;
    margin-right: 3%;
    margin-left: 3%;
    margin-top: 1.1%;
    color : #8f8f8f;
    background-color : #FCDDDC;
    border : 1px solid #8F8F8F;
    text-align : center;
}
.date_btn{
	background-color : white;
	font-weight:bold;
	margin-top:1.5%;
	margin-left:3.5%;
    border : 1px solid #8F8F8F;
	cursor : pointer;
	
}
.btn_submit{
	background-color : #FA6A6A;
	color:white;
	font-weight:bold;
	margin-top:1.5%;
	border : 0;
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
<%@ include file="../include/sellerOrderTopMenu.jsp" %>
	<div class = "div_table_title">
		<p class = "table_title"> 판매내역조회</p>
	</div>
	<div id = "searchWrap" class="searchWrap">
		<form id="searchForm" name = "searchForm">
			<div class="searchBox">
				<label class="search_title">검색어 입력</label>
			</div>
			<div class="searchInput">
				<select name="searchGubun" id="searchGubun" class ="searchGubun">
					<option value="PRODUCT_NAME" style="height:50px; ">상품 이름</option>
					<option value="ORDER_ID" style="height:50px;">주문 번호</option>
				</select>
				<input type="text" id="searchText" name = "searchText" class="seachText" placeholder="검색어를 입력해주세요">
				<input type = "button" id="btn_submit" name="btn_submit" class="btn_submit" value="검색">
			</div>
	      	<div class="periodBox">
				<label class="period_title">기간 선택</label>
			</div>
			<div class="periodInput">
				<input id="startOrderPeriod" name="startOrderPeriod" class="period_input" value="">
				<label>-</label>
				<input id="endOrderPeriod" name="endOrderPeriod" class="period_input" value="">
				<input type = "button" id="btn_1month" name="btn_1month" class="date_btn" value="1개월">
				<input type = "button" id="btn_3month" name="btn_3month" class="date_btn" value="3개월">
				<input type = "button" id="btn_6month" name="btn_6month" class="date_btn" value="6개월">
			</div>
			
		</form>
	</div>
	<div class="id_input_box" id="ajaxDiv">
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
	      						<input type="button" class="btn_detail" value="주문 상세"  onclick="location='sellerOrderDetail.do?orderId=${mainVO.orderId}'">
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