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
	function ajaxLoad(){
		var formData2 = $("#frm_search").serialize(); 
		// 비동기 전송방식,, (화면 이동이 없음)의 jquery 함수,, ajax
		$.ajax({
			url:"sellerProductSearch.do", // 보낼 url
			data:formData2, //폼 자체
			dataType:"json",
			success: function(data){
				var html="<table class='product_table'>";
				html+="<tr>";
				html+="<th class='table_cell' width='8%'>상품코드</th>";
				html+="<th class='table_cell' width='10%'>상품명</th>";
				html+="<th class='table_cell' width='10%'>이미지</th>";
				html+="<th class='table_cell' width='10%'>등록일</th>";
				html+="<th class='table_cell' width='8%'>정상가</th>";
				html+="<th class='table_cell' width='8%'>할인율</th>";  
				html+="<th class='table_cell' width='8%'>판매가</th>";
				html+="<th class='table_cell' width='10%'>할인기간</th>";
				html+="<th class='table_cell' width='6%'>수량</th>";
				html+="<th class='table_cell' width='8%'>상태</th>";
				html+="<th class='table_cell' width='8%'>수정</th>";
				
				for(var i=0; i<data['obj1'].length;i++){
					html+="<tr class='pr_tr' align='center'>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['productId']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['productName']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'><img src="+JSON.stringify(data['obj1'][i]['image1'])+"width='150' height='100' alt''/></td>"
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['regDate']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['productPrice']).replace(/\"/gi, "")+"원</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['discountRate']).replace(/\"/gi, "")+"%</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['discountPrice']).replace(/\"/gi, "")+"원</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['discountPeriod']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['productStock']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'>"+JSON.stringify(data['obj1'][i]['regState']).replace(/\"/gi, "")+"</td>";
			  		html+="<td class='table_cell'><a href='productDetail.do?unq="+JSON.stringify(data['obj1'][i]['productId']).replace(/\"/gi, "")+"'><c:out value='수정'/></a></td>"
			  		html+="</tr>";
				}
				html+="</table>";
				$("#ajaxDiv").append(html);
			},
			error: function(request,status,error){	// 시스템적인 에러..SQL이라던지 등,,
				alert("오류발생");
			}
		});//
	}
	var onSale = true;
	var soldOut = false;
	$("#chk_whole").change(function(){
        if($("#chk_whole").is(":checked")){
        	$("input[name=regState]").prop("checked", true);
        	onSale = true;
        	soldOut = true;
    		$("#ajaxDiv").empty();// 요소 내용 제거
        	ajaxLoad();
        }else{
        	$("input[name=regState]").prop("checked", false);
        	onSale = false;
        	soldOut = false;
    		$("#ajaxDiv").empty();// 요소 내용 제거
        }
    });
	
	$("#chk_onSale").change(function(){
        if($("#chk_onSale").is(":checked")){
        	onSale = true;
        	if(soldOut == true){
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	else{
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	
        }else{
        	onSale = false;
        	$("input[name=chk_whole]").prop("checked", false);
			if(soldOut == true){
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	else{
        		$("#ajaxDiv").empty();// 요소 내용 제거
        	}
        }
    });
	
	$("#chk_soldOut").change(function(){
		$("#ajaxDiv").empty();// 요소 내용 제거
        if($("#chk_soldOut").is(":checked")){
        	soldOut = true;
        	if(onSale == true){
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	else{
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	
        }else{
        	soldOut = false;
        	$("input[name=chk_whole]").prop("checked", false);
        	if(onSale == true){
        		$("#ajaxDiv").empty();// 요소 내용 제거
            	ajaxLoad();
        	}
        	else{
        		$("#ajaxDiv").empty();// 요소 내용 제거
            }
        }
    });
	
	$("#btn_submit").click(function(){ // 검색 ajax
		if(onSale == false && soldOut == false){
			$("#ajaxDiv").empty();// 요소 내용 제거	
		}
		else{
			$("#ajaxDiv").empty();// 요소 내용 제거	
			ajaxLoad();
		}
	});
});
</script>

</head>
<style>

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
.div_Wrap{
  display: flex;
  justify-content: left;
}
.table_title{
	margin-left:12%;
	margin-top:2%;
	font-size:15pt;
	font-weight:bold;
    height: 30px;
}

.product_table{
	border: 1px solid #A5A5A5;
	width:910px;
	border-collapse : collapse;
	border-spacing : 0;
	
}
.table_cell{
	border: 1px solid #A5A5A5;
}

.btn_reg{
	position: absolute;
    float: right;
    border: 1px solid #A5A5A5;
    height: 30px;
    width: 100px;
    font-size: 14px;  
    line-height: 30px;
    font-weight: 900;
    color: #FA6A6A;
    background-color: #FFFFFF;
    cursor: pointer;	
	}

.form_case{
	height:35px;
	width:200px;
	margin-top : -10px;
	margin-left : -15px;
	padding-top : 15px;
	background-color : #FA6A6A;
	color : white;
	font-size : 14px;
	font-wight : 900;
    float: left;
}
.box_state{
	border: 1px solid #A5A5A5;
	height:31px;
	padding: 10px 14px;	
    width: 880px;
}
.state_chk{
	width:10%;
	height:50px;
	font-size:14px;
	float : left;
    line-height: 30px;
}
input, progress {
  accent-color: red;
}
.searchGubun{
	border : 1px solid #A5A5A5;
	color : #A5A5A5;
	float:left;
	height: 36px;
	width : 80px;
	margin-left : 10px;
}
.searchText{
	border : 1px solid #A5A5A5;
	float:left;
	height: 30px;
	width : 300px;
	margin-left : 10px;
}
.btn_submit{
	float:left;
	height: 25px;
	margin-top : 5px;
	margin-left : 10px;
	border : 1px solid #A5A5A5;
    background-color: #FFFFFF;
    color : #FA6A6A;
    cursor: pointer;
	
}
.whole_wrap{
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
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
<%@ include file="../include/sellerTopMenu.jsp" %>

<div class = "div_table_title">
	<p class = "table_title"> 상품 목록 </p>
</div>

	<div class = "div_Wrap">
	<div class="div3">
		<div class="search_bar">		
	<form name="frm_search" id="frm_search">
		<div class = "box_state">
	      <label class="form_case"> 진열 상태</label>
	      <label class="state_chk"><input id="chk_whole" class="chk_box" type="checkbox" name="chk_whole" value="판매중','품절"> 전체</label>
	      <label class="state_chk"><input id="chk_onSale" class="chk_box" type="checkbox" name="regState" value="판매중" checked> 판매중</label>
    	  <label class="state_chk"><input id="chk_soldOut" class="chk_box" type="checkbox" name="regState" value="품절"> 품절</label>
		</div>

	<div class="search_bar">
		<div class = "box_state">
	      <label class="form_case"> 검색어 입력</label>
	      	<select name="searchGubun" id="searchGubun" class ="searchGubun">
				<option value="product_Name"  style="height:50px; ">상품명 </option>
				<option value="product_Id" style="height:50px;">상품 코드</option>
			</select>
			<input type="text" name="searchText"id="searchText"class="searchText" placeholder="검색어를 입력해주세요" >
			<input type="button" id="btn_submit" class="btn_submit" value="검색">
			<input type="button" id="btn_reg" class="btn_reg" value="상품 등록" onclick= "location='productWrite.do'">
			</div>
		</div>
	</form>
		</div>
	<div id = "ajaxDiv">
	<table class = "product_table">
	<tr>
		<th class="table_cell" width="8%">상품코드</th>
		<th class="table_cell" width="10%">상품명</th>
		<th class="table_cell" width="10%">이미지</th>
		<th class="table_cell" width="10%">등록일</th>
		<th class="table_cell" width="8%">정상가</th>
		<th class="table_cell" width="8%">할인율</th>
		<th class="table_cell" width="8%">판매가</th>
		<th class="table_cell" width="10%">할인기간</th>
		<th class="table_cell" width="6%">수량</th>
		<th class="table_cell" width="8%">상태</th>
		<th class="table_cell" width="8%">수정</th>
	</tr>
	<c:forEach var="result" items="${resultList}">
	<tr class="pr_tr" align="center">
		<td class="table_cell"><c:out value="${result.productId}"/></td>
		<td class="table_cell"><c:out value="${result.productName}"/></td>
		<td class="table_cell"><img src="${result.image1}" width="150" height="100" alt""/></td>
		<td class="table_cell"><c:out value="${result.regDate}"/></td>
		<td class="table_cell"><c:out value="${result.productPrice}원"/></td>
		<td class="table_cell"><c:out value="${result.discountRate}%"/></td>
		<td class="table_cell"><c:out value="${result.discountPrice}원"/></td>
		<td class="table_cell"><c:out value="${result.discountPeriod}"/></td>
		<td class="table_cell"><c:out value="${result.productStock}"/></td>
		<td class="table_cell"><c:out value="${result.regState}"/></td>
		<td class="table_cell"><a href="productDetail.do?unq=${result.productId}"><c:out value="수정"/></a></td>
	</tr>
	</c:forEach>
	</table>
	</div>
	</div>
</div>
</main>
<footer>
</footer>


<!-- 
<div style="width:600px;margin-top:5px; text-align:right;">
	<button type="button" onclick= "location='boardWrite.do'">글쓰기</button>
</div> -->
</div>
</body>
</html>