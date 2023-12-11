<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<PersonVO> pList = new ArrayList<PersonVO>();
    PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	PersonVO p2 = new PersonVO();
	p2.setName("김길동");
	p2.setAge(22);
	p2.setTel("011-222-1111");
	
	PersonVO p3 = new PersonVO();
	p3.setName("오길동");
	p3.setAge(30);
	p3.setTel("016-333-1111");
	
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
	
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<table border = "1">
			<caption>회원정보</caption>
			<tr>
			<td> 이름 </td>
			<td> 나이 </td>
			<td> 전화 </td>
			</tr>
			
			<%for(int i =0; i < pList.size(); i++){
				PersonVO vo = pList.get(i);%>
				<tr> 
					<td><%= vo.getName() %></td>
					<td><%= vo.getAge() %></td>
					<td><%= vo.getTel() %></td>
				
			<%}%>
			
			
		</table>
	</body>
</html>