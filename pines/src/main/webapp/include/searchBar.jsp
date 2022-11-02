<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.div_Wrap{
  display: flex;
  justify-content: center;
}
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
.button1{
	margin : 0px;
	border : 0;
	outline : 0;
	cursor:pointer;
	background-color : white;
}
.btn_search{
	position: absolute;
    border: 0;
    outline : 0;
    float: right;
    font-size: 14px;  
    line-height: 40px;
    text-align : center;
    font-weight: 900;
    color: #BFBFBF;
    background-color: #FFFFFF;
    cursor: pointer;	
    margin-left : 460px;
	margin-top : 10px;
	}
.btn_seller{
    cursor: pointer;	
    margin-top : 30px;
    margin-left : 10px;
	height:35px;
	width:100px;
	font-weight : bold; 
	border:solid 2px #FA6A6A;
    background-color: #FFFFFF;
}.btn_cart{
    cursor: pointer;	
    margin-top : 30px;
    margin-left : 10px;
	height:35px;
	width:100px;
	font-weight : bold; 
	border:solid 2px #FA6A6A;
    background-color: #FFFFFF;
}
</style>
<body>
<%
	String sessionId = (String) session.getAttribute("SessionUserID");
%>
<div class = "div_Wrap">
		<div class="div1">
		<button type="button" class="button1" onclick= "location='mainList.do'" ><img src="images/pines.JPG" width="100px" height="100px"></button>
		</div>
		<div class="div2">
		<form name="searchFrm" method="post" action="productList.do">
			<select name="searchGubun" id="searchGubun" style="height:50px; weight:100px; border:solid 2px #FA6A6A;">
				<option value="product_name"  style="height:50px; ">상품명 </option>
				<option value="store_id" style="height:50px;">판매처 </option>
			</select>
			<button type="submit" class="btn_search"><img src="images/search_icon.JPG" width="30px" height="30px"></button>
			<input type="text" name="searchText"id="searchText" placeholder="찾으시는 상품을 입력해주세요"style="width:500px; height:45px; border:solid 2px #FA6A6A; ">
		</form>
		</div>
		<div>
			    <%
			    if(sessionId == null){ // 로그인 안했을경우	
			    %>
			    		<button type="submit" class="btn_cart" onclick= "alert('로그인이 필요한 서비스입니다.');return location='loginWrite.do';">장바구니</button>
				 		<button type="submit" class="btn_seller" onclick= "alert('로그인이 필요한 서비스입니다.');return location='loginWrite.do';">판매자 페이지</button>
				<%
				} else { // 로그인 성공시
				%>
						<button type="submit" class="btn_cart" onclick= "location='selectCart.do'">장바구니</button>
						<button type="submit" class="btn_seller" onclick= "location='sellerCheck.do'">판매자 페이지</button>
				<%
				}
				%>
		</div>
</div>
		
</body>
</html>