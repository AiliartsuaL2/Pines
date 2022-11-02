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
<script>
/*
var lastScrollTop = 0; // 이전 스크롤 좌표 값
$(window).scroll(function(){ // 스크롤 이벤트시
	var currentScrollTop = $(window).scrollTop(); // 현재 스크롤 좌표값
	
	
	if(currentScrollTop - lasScrollTop > 0){ // 다운 스크롤인 상태
		lastScrollTop = currentScrollTop; // 이전 스크롤 좌표로 할당
		if($(window).scrollTop() >= ($(document).height() - $(window).height())){
			var lastrn = $(".scrolling:last").attr("data-bno"); 
			$.ajax({
				type : 'post',
				url : 'infiniteScrollDown',
				headers:{
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json', // 서버로부터 return받을 데이터 타입
				data : JSON.stringify({ // 서버로 보낼 데이터 명시
					bno : lastbno
				})
				success : function(data){
					var str = "";
					if(data != ""){ // 받아온 데이터가 null이 아니면
						$(data).each(
							function(){
								str += "<td onClick="+"'location.href="+"'"+this.productId+".do'"+"'"+"style="+"'cursor:pointer;'><a href="+"'#'style='align:center'>"
								    +  "<p><img src="+"'"this.image1+"'width="+"'200' height='150' alt''/></p></a><p>"+this.productName+"</p><p>"+this.productPrice+"원</p></td>";
							});
							$(".listToChange").empty();
							$(".scrollLocation").after(str);
					}
					else{
						alert("더 불러올 데이터가 없습니다.");
					}	
				}
			});		
			
			
		}
	} 
	
	
	else{ // 업스크롤인 상태
		lastScrollTop = currentScrollTop;
	}
	
	if($(window).scrollTop() >= $(docunment).height() - $(window).height()){
		
	}
});
*/
</script>

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
	margin-left:31%;
	margin-top:20px;
	font-size:15pt;
	font-weight:bold;
    height: 50px;
}
.div_table_title{
	width : 1920px;
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
<%@ include file="../include/topMenu.jsp" %>
<div class = "div_table_title">
	<table class ="table_title">
		<tr>
			<th>최근 등록 상품</th>
		</tr>
	</table>
</div>
	<div class = "div_Wrap">
	<div class="div3">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table class = "table_product" width="850">
	  <c:forEach items="${resultList}" var="result">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
		<td onClick="location.href='${result.productId}.do'" style="cursor:pointer;"><a href="#" style='align:center'>
				<p><img src="${result.image1}" width="200" height="150" alt""/></p> </a> <p>${result.productName}</p><p>${result.productPrice}원</p></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
</div>

	</div>
</main>
<footer>
</footer>
</div>
</body>
</html>