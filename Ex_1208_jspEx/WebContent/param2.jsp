<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Bean : 현재는 잘 사용하지않음 -->
    
    <% request.setCharacterEncoding("utf-8"); %>
    
    <!-- PersonVO p = new PersonVO(); -->
    <jsp:useBean id ="p" class="vo.PersonVO"/>
    
    <!-- p.setName(name); -->
    <jsp:setProperty property="name" name="p"/>
    <jsp:setProperty property="age" name="p"/>
    <jsp:setProperty property="tel" name="p"/>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		이름 : <%=p.getName() %>/
		나이 : <%=p.getAge() %>/
		전화번호 : <%=p.getTel() %>
		
		
	</body>
</html>