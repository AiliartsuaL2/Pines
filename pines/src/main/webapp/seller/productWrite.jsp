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
	$( "#discountPeriod" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	
	let formData ;
	let fileInput ;
	let fileList ;
	let fileObj ;
	let categoryId
	function categoryLoad(){
		var parentCategoryId = event.target.getAttribute('data-id');
		
		// 비동기 전송방식,, (화면 이동이 없음)의 jquery 함수,, ajax
		$.ajax({
			url:"selectCategory.do", // 보낼 url
			data : "categoryId="+parentCategoryId,
			dataType:"json",
			success: function(data){
				var html ="";
				for(var i=0; i<data['obj1'].length;i++){
					html += "<button type='button' name = 'child_category' class = 'child_category' parent-id='"+JSON.stringify(data['obj1'][i]['parentCategoryName']).replace(/\"/gi, "")+ "'child-id ='"+JSON.stringify(data['obj1'][i]['categoryName']).replace(/\"/gi, "")+ "'id= 'childCategory' value ='"+JSON.stringify(data['obj1'][i]['categoryId']).replace(/\"/gi, "")+"'>"+JSON.stringify(data['obj1'][i]['categoryName']).replace(/\"/gi, "")+"</button>";

					html += "<br>";
					}
				$("#childCategory").append(html);
			},
			error: function(request,status,error){	// 시스템적인 에러..SQL이라던지 등,,
				alert("오류발생");
			}
		});//
	}
	$(document).on("click","#parentCategory",function(e){
		var pCategoryId = event.target.getAttribute('data-id');
		if(pCategoryId == "flower"){
			if("${sellerType}" == "farm"){
				alert("농원 사용자는 꽃 상품을 등록 할 수 없습니다.");
				return false;
			}
		}
		else if(pCategoryId == "plant"){
			if("${sellerType}" == "flower"){
				alert("꽃집 사용자는 식물 상품을 등록 할 수 없습니다.");
				return false;
			}
		}
			var btns = document.querySelectorAll(".parent_category");
			btns.forEach(function(btn, i) {
				if(e.currentTarget == btn) {
					btn.classList.add("active");
				}
				else {
					btn.classList.remove("active");
				}
			});
			$("#childCategory").empty();// 요소 내용 제거
			categoryLoad();
	});

	$('body').on("click","#childCategory",function(e){
			var btns2 = document.querySelectorAll(".child_category");
			btns2.forEach(function(btn, i) {
				if(e.target == btn) {
		    		$("#categoryName").empty();// 요소 내용 제거
					btn.classList.add("active");
					var htmlData = "";
					htmlData += e.target.getAttribute('parent-id');
					htmlData += " > ";
					htmlData += e.target.getAttribute('child-id');
					$("#categoryName").append(htmlData);
					categoryId = e.target.value;
				}
				else {
					btn.classList.remove("active");
				}
			});
	});
	


$("#rawImage1").click(function(){
	return false;
});
$("#rawImage2").click(function(){
	return false;
});
$("#rawImage3").click(function(){
	return false;
});
$("#rawImage4").click(function(){
	return false;
});
	
$("#btn_submit").click(function(){
		var productName = $.trim($("#productName").val());
		var productPrice = $.trim($("#productPrice").val());
		var discountRate = $.trim($("#discountRate").val());
		var discountStock = $.trim($("#discountStock").val());
		var productDescription = $.trim($("#productDescription").val());
		var minPurchase = $.trim($("#minPurchase").val());
		var maxPurchase = $.trim($("#maxPurchase").val());
		var shippingCost = $.trim($("#shippingCost").val());
		var freeShippingPrice = $.trim($("#freeShippingPrice").val());

        var fileCheck1 = document.getElementById("fileItem1").value;
        var fileCheck2 = document.getElementById("fileItem2").value;
        var fileCheck3 = document.getElementById("fileItem3").value;
        var fileCheck4 = document.getElementById("fileItem4").value;
        
        
		if ($('#categoryName').is(':empty')){
				alert("카테고리를 선택해주세요.");
				return false;
			}
		if( productName == "" ) {
			alert("상품명을 입력해주세요.");
			$("#productName").focus();
			return false;
		}
		if( productPrice == "" ) {
			alert("상품 가격을 입력해주세요.");
			$("#productPrice").focus();
			return false;
		}
		if( discountRate == "" ) {
			alert("할인율 입력해주세요. (없을경우 0)");
			$("#discountRate").focus();
			return false;
		}
		if( productStock == "" ) {
			alert("재고를 입력해주세요.");
			$("#discountStock").focus();
			return false;
		}
		if( productDescription == "" ) {
			alert("상품 설명을 입력해주세요.");
			$("#productDescription").focus();
			return false;
		}
		if( minPurchase == "" ) {
			alert("최소 구매 개수를 입력해주세요.");
			$("#minPurchase").focus();
			return false;
		}
		if( maxPurchase == "" ) {
			alert("최대 구매 개수를 입력해주세요.");
			$("#maxPurchase").focus();
			return false;
		}
		if( shippingCost == "" ) {
			alert("배송비를 입력해주세요.");
			$("#shippingCost").focus();
			return false;
		}
		if( freeShippingPrice == "" ) {
			alert("배송비 무료금액을 입력해주세요.");
			$("#freeShippingPrice").focus();
			return false;
		}

        if(!fileCheck1 && !fileCheck2 && !fileCheck3 && !fileCheck4 ){
			alert("최소 1장의 이미지를 등록해주세요");
      	  return false;
        }

	  	let frmData = $("#frmData").serialize(); // serialize 함수로 frm아이디값의 구성요소를 전부 가져옴 
	  	
		formData = new FormData($('#fileForm')[0]);
		fileInput = $('input[name="uploadFile"]');
		fileList = fileInput[0].files;
		fileObj = fileList[0];

		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		$.ajax({
			url:"uploadAjaxAction.do", // 보낼 url
			processData : false,
			contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType:"json",
		    success : function(result){
				  frmData += '&categoryId='+categoryId;
                  
                  if(fileCheck1){
                	  frmData += '&image1=product_image\\'+'\\'+JSON.stringify(result['obj1'][0]['uploadPath']).replace(/\"/gi, "")+"/s_"+JSON.stringify(result['obj1'][0]['uuid']).replace(/\"/gi, "")+"_"+JSON.stringify(result['obj1'][0]['fileName']).replace(/\"/gi, "");
                  }
                  if(fileCheck2){
                	  frmData += '&image2=product_image\\'+'\\'+JSON.stringify(result['obj1'][1]['uploadPath']).replace(/\"/gi, "")+"/s_"+JSON.stringify(result['obj1'][1]['uuid']).replace(/\"/gi, "")+"_"+JSON.stringify(result['obj1'][1]['fileName']).replace(/\"/gi, "");
                  }
                  if(fileCheck3){
                	  frmData += '&image3=product_image\\'+'\\'+JSON.stringify(result['obj1'][2]['uploadPath']).replace(/\"/gi, "")+"/s_"+JSON.stringify(result['obj1'][2]['uuid']).replace(/\"/gi, "")+"_"+JSON.stringify(result['obj1'][2]['fileName']).replace(/\"/gi, "");
                  }
                  if(fileCheck4){
                	  frmData += '&image4=product_image\\'+'\\'+JSON.stringify(result['obj1'][3]['uploadPath']).replace(/\"/gi, "")+"/s_"+JSON.stringify(result['obj1'][3]['uuid']).replace(/\"/gi, "")+"_"+JSON.stringify(result['obj1'][3]['fileName']).replace(/\"/gi, "");
                  }
				  $.ajax({
					url:"productWriteSub.do", // 보낼 url
				  	data : frmData,
				  	type : 'POST',
				  	dataType:"text",
					    success : function(data){
								alert("상품등록이 완료되었습니다.");
								location="sellerCheck.do"
					    	},
					    	error : function(data){
					    		alert("상품 등록에 실패하였습니다. \n 관리자에게 연락해주세요");
					    	}
						});
		    	},
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
		});	
		 
 
		  
		
	});


	let regex = new RegExp("(.*?)\.(jpg|png|JPG|PNG)$");
	let maxSize = 1048576 * 4; //1MB * 4
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	var displayId;
	$("input[type='file']").on("change", function(e){
		displayId=this.id;
		readURL(this);	
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('input[name="'+displayId+'"]').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
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

.parent_category_scroll{
	margin-left:32%;
	overflow:scroll;
	overflow-x: hidden;
	width : 250px;
	height : 150px;
	border : 1px solid #b3b3b3;
	float : left;
	
}

.child_category_scroll{
	margin-left:100px;
	overflow:scroll;
	overflow-x: hidden;
	width : 250px;
	height : 150px;
	border : 1px solid #b3b3b3;
}

.parent_category{
	font-size:13pt;
	height: 30px;
	width: 230px;
	text-align : left;
	background-color : white;
	color : #A5A5A5;
	cursor : pointer;
	border : 0;
}
.parent_category:hover, .parent_category.active{
	background:#A5A5A5;
	color:white;
}

.child_category{
	font-size:13pt;
	height: 30px;
	width: 230px;
	text-align : left;
	background-color : white;
	color : #A5A5A5;
	cursor : pointer;
	border : 0;
}

.child_category:hover, .child_category.active{
	background:#A5A5A5;
	color:white;
}


.child_category_scroll:after {
		clear: both; 
	}




/* 상품등록 area */
.id_input_box{
	border: 1px solid #A5A5A5;
	display: block;
	height:1000px;
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
.des_name_case{
	text-align : center;
	padding-top : 70px;
	height:90px;
	width:200px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
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
.input_date{
	text-align : center;
	margin-left : 20px;
	display:inline-block; 
    float: left;
    border : 0;
	height:45px;
	width:100px;
	font-size : 18px;
	font-wight : bold;
}

.input_value{
	text-align : center;
	margin-left : 20px;
	display:inline-block; 
    float: left;
    border : 0;
	height:45px;
	width:80px;
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
.ship_name_case{
	text-align : center;
	padding-top : 40px;
	height:60px;
	width:200px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.ship_empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:49px;
	width:660px;
	font-size : 18px;
	font-weight : bold;
}
.option_box{
	margin-top : -10px;
	text-align : center;
	height:40px;
	width:100%;
}
.opt_case{
	padding-top:15px;
	float:left;
	height:80%;
	width:10%;
	font-size : 14px;
	margin-left : 5px;
}
.opt_case_title{
	font-weight : bold;
}

.opt_case_context{
	width:10%;
	height:100%;
}

.opt_case_description{
	padding-top:15px;
	float:left;
	text-align:left;
	height:80%;
	width:30%;
	font-size : 14px;
}
.opt_name_case{
	text-align : center;
	padding-top : 9px;
	height:40px;
	width:200px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.option_value_case{
	padding:4px;
	display:inline-block; 
    float: left;
    border : 0;
    margin-left : 10px;
	height:45px;
	width:15%;
	font-size : 18px;
	font-wight : bold;	
}
.option_value{
	text-align : center;
    border : 0;
	height:40px;
	width:100%;
}



.img_name_case{
	text-align : center;
	padding-top : 90px;
	height:110px;
	width:200px;
	background-color : #FCDDDC;
	color : black;
	border : 1px solid #BABABA;
	font-size : 18px;
	font-weight:bold;
    float: left;
}
.img_empty_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:200px;
	width:660px;
	font-size : 18px;
	font-wight : bold;
}


.description_box{
	text-align : left;
    float: left;
	display:inline-block; 
	text-align : center;
	border : 1px solid #BABABA;
	height:160px;
	width:660px;
	font-size : 18px;
	font-wight : bold;
}
.input_description{
	text-align : left;
	margin-left : 20px;
	display:inline-block; 
    float: left;
    border : 0;
	height:150px;
	width:600px;
	font-size : 18px;
	font-wight : bold;
}


.btn_submit{

	border-radius: 4px;
	height: 30px;
	width: 100px;
	margin-top: 20px;
	margin-bottom : 10px;
	margin-left: 390px;
	border : 0;
    background-color: #FA6A6A;
    color : #FFFFFF;
	font-size : 14px;
	font-wight : bold;
    cursor: pointer;
}

.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
}
.img_upload1{
	float : left;
	height: 30px;
	width : 100%;
	margin-left : 3%;
	margin-top : 10%;

}
.img_display{
	height: 100%;
  	border-radius: 4px;
	border : 1px solid #b3b3b3;
	width : 100%;
	margin-top : 5%;
	margin-left : 2%;
}

.real_img{
	display : none;
}
.img_upload_css{
  padding: 3px 10px;
  background-color:#FF6600;
  font-size : 14px;
  border-radius: 4px;
  color: white;
  cursor: pointer;
  height: 100%;
}

.img1_label{
	text-align : center;
	width : 100%;
    display: contents;
    display: grid;
	margin-left : 5%;
	font-size : 14px;
	font-weight:bold;
}
.img_wrap{
	float : left;
	width : 20%;
	height: 60%;
	margin-top : 1%;
	margin-left : 4%;
}
.raw_img{
	width : 100%;
	height: 100%;
	cursor : default;
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

<main>
<%@ include file="../include/searchBar.jsp" %>
<%@ include file="../include/sellerTopMenu.jsp" %>
<div class = "div_table_title">
	<p class = "table_title"> 카테고리 선택 </p>
	<p class = "table_sub_title"> 등록할 상품의 카테고리를 선택해주세요.</p>	
	<div class="parent_category_scroll">
		<c:forEach var="result" items="${resultList}">
		<button type="button" class = "parent_category" name = "parentCategory" id= "parentCategory" data-id ="${result.categoryId}" >${result.categoryName}</button>
		<br>
		</c:forEach>
	</div>
	<div class="child_category_scroll">
		<div id = "childCategory">
		</div>
	</div>
</div>
	
	<p class = "table_title"> 상품정보 입력</p>
	<p class = "table_sub_title"> 등록할 상품 정보를 입력해주세요.</p>	
	
		<div class="id_input_box">
		<form id="frmData">
			<div class = "category_box">
	      			<label class="name_category_case"> 카테고리</label>
	      			<div class = "empty_box">
	      				<label class="category_value" id = "categoryName"></label>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 상품명</label>
	      			<div class = "empty_box">
						<input type="text" name="productName"id="productName"class="input_name" placeholder="상품명을 입력해주세요" >
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 정상가</label>
	      			<div class = "empty_box">
						<input type="text" name="productPrice"id="productPrice"class="input_value" placeholder="0" >
						<p class = "price">원</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 할인율</label>
	      			<div class = "empty_box">
						<input type="text" name="discountRate"id="discountRate"class="input_value" placeholder="0" >
						<p class = "price">%</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 할인 기간</label>
	      			<div class = "empty_box">
						<input type="text" name="discountPeriod"id="discountPeriod"class="input_date" placeholder="" >
						<p class = "price">일 까지</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">재고</label>
	      			<div class = "empty_box">
						<input type="text" name="productStock"id="productStock"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="des_name_case">상품 설명</label>
	      			<div class = "description_box">
						<input type="text" name="productDescription"id="productDescription"class="input_description" placeholder="상품 설명을 입력해주세요. " >
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">최소 구매</label>
	      			<div class = "empty_box">
						<input type="text" name="minPurchase"id="minPurchase"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">최대 구매</label>
	      			<div class = "empty_box">
						<input type="text" name="maxPurchase"id="maxPurchase"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="ship_name_case">배송비</label>
	      			<div class = "ship_empty_box">
						<input type="text" name="shippingCost"id="shippingCost"class="input_value" placeholder="0" >
						<p class = "price">원</p>
						</div>
					<div class = "ship_empty_box">
						<input type="text" name="freeShippingPrice"id="freeShippingPrice"class="input_value" placeholder="0" >
						<p class = "price">원 이상 무료</p>
	      			</div>
			</div>
			<div class = "option_box">
	      			<label class="opt_name_case">옵션</label>
	      			<div class = "ship_empty_box">						
						<div class = "option_value_case"> 
							<input type="text" name="totalNum"id="totalNum"class="option_value" placeholder="개수" >
						</div>
	      				<div class ="opt_case">
							<label class="opt_case_context">개 이상시</label>
						</div>
						<div class = "option_value_case"> 
							<input type="text" name="discountWon"id="discountWon"class="option_value" placeholder="할인금액(원)" >
						</div>
	      				<div class ="opt_case_description">
							<label class="opt_case_context">원 할인(개당 할인액)</label>
						</div>
					</div>
			</div>
			
			
			</form>
			
			
			<form id="fileForm" method="post" enctype="multipart/form-data">
			<div class = "name_box">
	      			<label class="img_name_case">상품 이미지</label>
	      			<div class = "img_empty_box">
	      				<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지1</label>
	      					</div>
	      					<div class="img_display">
	      						<input type="image" id="rawImage1"  name="fileItem1" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem1">업로드</label>
							<input type="file" id="fileItem1" name='uploadFile' class="real_img" multiple="true"/>
							</div>
						</div>	
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지2</label>
	      					</div>
	      					<div class="img_display">
	      						<input type="image" id="rawImage2" name="fileItem2" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem2">업로드</label>
							<input type="file" id="fileItem2"  name='uploadFile' class="real_img" multiple="true"/>
							</div>
						</div>
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지3</label>
	      					</div>
	      					<div class="img_display">
	      						<input type="image" id="rawImage3" name="fileItem3" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem3">업로드</label>
							<input type="file" id="fileItem3"  name='uploadFile' class="real_img" multiple="true"/>
							</div>
						</div>
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지4</label>
	      					</div>
	      					<div class="img_display">
	      						<input type="image" id="rawImage4" name="fileItem4" src="#" alt="" class ="raw_img" onerror="this.src='images/noImage.jpg'">
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem4">업로드</label>
							<input type="file" id="fileItem4"  name='uploadFile' class="real_img" multiple="true"/>
							</div>
						</div>						
	      			</div>
			</div>
			</form>
				<input type="button" id="btn_submit" class="btn_submit" value="상품 등록">
</div>
</main>
</div>
</body>
</html>