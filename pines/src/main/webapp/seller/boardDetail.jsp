<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- jstl 문법 -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<!-- jstl 문법 -->
	
	<!-- 줄바꿈을 하기위함 -->
<% pageContext.setAttribute("newline","\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>')}"/> 
	<!-- 줄바꿈을 하기위함 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세 화면</title>
<script src="/ailiartsua2/script/jquery-1.12.4.js"></script>
<script src="/ailiartsua2/script/jquery-ui.js"></script>
</head>
<style>
body{
	font-size:9pt;
}
button{
	font-size:9pt;
}
table{
	width:800px;
	border-collapse:collapse;
	
}
th,td{
	border:1px solid #cccccc;
	padding:3px;
}
td{
	height:30px;
}

.input1{
	width:98%;
}
.textarea{
	width:98%;
	height:70px;
}

</style>


<body>
<form name="frm" id="frm" >
<table>
	<caption>게시판 상세</caption>
	<tr>
		<th rowspan="2" width="20%">접속횟수(건)</th>
		<th width="20%">총계</th>
		<th colspan="2">내부직원</th>
		<th colspan="2">외부직원</th>
	</tr>
	<tr>
		<td width="20%"></td>
		<td colspan="2" ></td>
		<td colspan="2" ></td>
	</tr>
	
	<tr>
		<th rowspan="2"width="20%">수행업무(건)</th>
		<th width="20%">입력</th>
		<th width="15%">열람</th>
		<th width="15%">수정</th>
		<th width="15%">삭제</th>
		<th width="15%">기타</th>
	</tr>
	
	<tr>
		<td width="20%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
	</tr>
	<tr> 
		<th colspan="6" > 사용자 접근내역(건)</th>
	</tr>
	<tr>
		<th width="15%">정상</th>
		<th width="15%">비정상</th>
		<th width="15%">업무시간 외 접속</th>
		<th width="15%">비인가 IP 접속</th>
		<th width="15%">일정횟수 초과접속</th>
		<th width="15%">대량다운로드</th>
	</tr>
	<tr>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
		<td width="15%"></td>
	</tr>
</table>
</form>
</body>
</html>