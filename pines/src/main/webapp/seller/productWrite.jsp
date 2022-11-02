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
<script>


$(function(){
	function categoryLoad(){
		var categoryId = event.target.getAttribute('data-id');
		
		// 비동기 전송방식,, (화면 이동이 없음)의 jquery 함수,, ajax
		$.ajax({
			url:"selectCategory.do", // 보낼 url
			data : "categoryId="+categoryId,
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
				}
				else {
					btn.classList.remove("active");
				}
			});
	});
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url:"uploadAjaxAction.do", // 보낼 url
			processData : false,
			contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType:"json",
		    success : function(result){
		    		console.log(JSON.stringify(result));
		    	},
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
		});	
		
		
	});
	let regex = new RegExp("(.*?)\.(jpg|png)$");
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
	height:880px;
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
	font-wight : bold;
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
</style>
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
	
	<div class = "input_Wrap">
		<div class="id_input_box">
			<div class = "category_box">
	      			<label class="name_category_case"> 카테고리</label>
	      			<div class = "empty_box">
	      				<label class="category_value" id = "categoryName"></label>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 상품명</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_name" placeholder="상품명을 입력해주세요" >
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 정상가</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">원</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case"> 할인율</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">%</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">재고</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="des_name_case">상품 설명</label>
	      			<div class = "description_box">
						<input type="text" name="searchText"id="searchText"class="input_description" placeholder="상품 설명을 입력해주세요. " >
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">최소 구매</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="name_case">최대 구매</label>
	      			<div class = "empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">개</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="ship_name_case">배송비</label>
	      			<div class = "ship_empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">원</p>
						</div>
					<div class = "ship_empty_box">
						<input type="text" name="searchText"id="searchText"class="input_value" placeholder="0" >
						<p class = "price">원 이상 무료</p>
	      			</div>
			</div>
			<div class = "name_box">
	      			<label class="img_name_case">상품 이미지</label>
	      			<div class = "img_empty_box">
	      				<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지1</label>
	      					</div>
	      					<div class="img_display">
	      						<input type=image>
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem">업로드</label>
							<input type="file" id="fileItem"  name='uploadFile' class="real_img"/>
							</div>
						</div>	
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지1</label>
	      					</div>
	      					<div class="img_display">
	      						<input type=image>
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem">업로드</label>
							<input type="file" id="fileItem"  name='uploadFile' class="real_img"/>
							</div>
						</div>
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지1</label>
	      					</div>
	      					<div class="img_display">
	      						<input type=image>
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem">업로드</label>
							<input type="file" id="fileItem"  name='uploadFile' class="real_img"/>
							</div>
						</div>
						<div class = img_wrap>
	      					<div class = "img1_label">
	      						<label class="img_label">이미지1</label>
	      					</div>
	      					<div class="img_display">
	      						<input type=image>
							</div>		
	      					<div class="img_upload1">
	      					<label class="img_upload_css" for="fileItem">업로드</label>
							<input type="file" id="fileItem"  name='uploadFile' class="real_img"/>
							</div>
						</div>						
	      			</div>
			</div>
				<input type="button" id="btn_submit" class="btn_submit" value="상품 등록">
			
		
</div>
</main>
</div>
</body>
</html>