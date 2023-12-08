<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 	
	//스크립트 릿의 선언부(전역변수 개념)
	public int plus(int a, int b){
		return (a + b);
	}
	int a = 0;
 %>
 <% String[] array = {"사과","배","딸기","오렌지"}; %>
<% 
	//일반 스크립트 릿(지역변수 개념)
	int a2 = 0;
	Random rnd = new Random();
	int random = rnd.nextInt(10);
%>
    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	
		<%= "++a : "+ ++a%> / <%="++a2 : "+ ++a2%><br>
		<%= random %><br>
		<%= plus(++a, random) %>
		
		<hr>
		
		<ul>
			<% for(int i=0; i<array.length; i++){%>
				<li> <%= array[i]%> </li>
			<% } %>				
		</ul>
	</body>
</html>