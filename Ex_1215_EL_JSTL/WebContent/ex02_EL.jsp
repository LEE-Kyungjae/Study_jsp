<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	int a = 10;
 	int b = 10;
 	request.setAttribute("a", a);
	request.setAttribute("b", b); 
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	\${1+1}<br>
	${ a + b }<br>
	${ a * b }<br>
	${ a gt b }<br>
	${a ge b}(a >= b)<br>
	${ a lt b }(a < b) <br>
	${a le b}(a >= b)<br>
	${ a eq b}(a == b)<br>
	${a ne b}(a !=b)<br>
	
	파라미터 : ${empty param.msg ? "안녕":"반가워"}<br>
	
</body>
</html>