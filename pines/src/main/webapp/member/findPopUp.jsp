<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pines.service.MemberVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="/pines/script/jquery-1.12.4.js"></script>
<script src="/pines/script/jquery-ui.js"></script>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
		<c:if test="${empty userId}">
			<span>${message}</span>
		</c:if>
		<c:if test="${not empty userId}">
    		<span>회원님의 아이디는 : ${userId} 입니다.</span>
		</c:if>
</body>
</html>