<%@page import="dvo.SjDVO"%>
<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	SjDVO dao = SjDVO.getInstance();//DAO객체 생성 
	List<SjVO> sj_list = dao.selectList();
	int total;
	float avg;

%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>학생정보</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
			</tr>

			<% for(int i=0; i<sj_list.size();i++){
			SjVO vo = sj_list.get(i);
			%>

			<tr>
				<td><%=vo.getNo()%></td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getEng()%></td>
				<td><%=vo.getKor()%></td>
				<td><%=vo.getMat()%></td>
				<%total=vo.getEng()+vo.getKor()+vo.getMat();%>
				<td><%= total %></td>
				<%avg=total/3f;%>
				<td><%=String.format("%.1f",avg)%></td>
			</tr>
		<% } %>		
		</table>
	</body>
</html>