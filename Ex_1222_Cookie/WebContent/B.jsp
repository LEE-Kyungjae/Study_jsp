<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie cookie =new Cookie("BB","B.jsp");
	response.addCookie(cookie);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>B Page</title>
	</head>
	<body>
			B페이지 방문을 환영합니다<br>
	<a href="C.jsp">C페이지로 가기</a>
	</body>
</html>