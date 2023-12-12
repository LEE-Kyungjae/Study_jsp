<%@page import="java.util.ArrayList"%>
<%@page import="vo.GogekVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//JNDI검색을 위한 클래스
	InitialContext ic = new InitialContext();
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//JNDI의 Resource를 검색
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	System.out.println("연결성공");
	String sql = "select * from gogek";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	

	List<GogekVO> g_list = new ArrayList<>();
	while(rs.next()){
		GogekVO vo = new GogekVO();
		vo.setGOBUN(rs.getInt("gobun"));
		vo.setGONAME(rs.getString("goname"));
		vo.setGOADDR(rs.getString("goaddr"));
		g_list.add(vo);
	}		
	
	rs.close();
	conn.close();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1">
			<tr>
				<th>고객번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
			
			<% for(int i=0; i<g_list.size();i++){
				GogekVO vo= g_list.get(i);
			
			%>
			<tr>
				<td><%= vo.getGOBUN()%></td>
				<td><%= vo.getGONAME()%></td>
				<td><%= vo.getGOADDR()%></td>
			</tr>
		<%}%>
		</table>
		
	</body>
</html>