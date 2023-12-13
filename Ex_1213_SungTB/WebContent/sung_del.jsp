<%@page import="dvo.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	SjDAO.getInstance().delete(no);
	//location.href="student.jsp";
	response.sendRedirect("student.jsp");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
	
	</body>
</html>