<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie cookie =new Cookie("CC","C.jsp");
	response.addCookie(cookie);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>C Page</title>
	</head>
	<body>
			C페이지 방문을 환영합니다<br>
	<a href="A.jsp">A페이지로 가기</a>
	</body>
</html>