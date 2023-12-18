<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//gugudan_ajax.jsp?dan=5
	int dan = Integer.parseInt(request.getParameter("dan"));
	String sb="";
	for(int i = 1; i<=9;i++){
		sb += String.format("%d x %d = %d<br>", dan, i, dan*i);
	}
%>    
  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<%=sb.toString() %>	
	</body>
</html>