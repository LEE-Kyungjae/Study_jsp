<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>구구단</title>
	</head>
	
	<body>
		<table border="1">
			<caption>구구단</caption>
		<% for(int i=1;i<=9;i++){ %>
			<%= "<tr>" %>
			<% for(int j=2;j<=9;j++){ %>
				<%= "<td>" %>
				<%= j + " * " + i + " = " + i*j %>	
				<%= "</td>" %>
			<% } %>	
			<%= "</tr>" %>
		<% } %>	
		</table>
		
		<table border="1">
			<caption>구구단</caption>
		<% for(int i=1;i<=9;i++){ %>
			<tr>
			<% for(int j=2;j<=9;j++){ %>
				<td>
				<% String str = String.format("%d x %d = %d",j,i,j*i);%>	
				<%= str %>
				</td>
			<% } %>	
			<%= "</tr>" %>
		<% } %>	
		</table>

		
	</body>
</html>