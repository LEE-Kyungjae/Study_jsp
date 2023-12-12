<%@page import="java.util.ArrayList"%>
<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//sawon_list.jsp?deptno=20
	int deptno = Integer.parseInt(request.getParameter("deptno"));
		
	//톰캣서버가 참조할 JNDI를 검색
	InitialContext ic= new InitialContext();

	//참조할 JNDI가 있는 위치 검색
	Context ctx = (Context)ic.lookup( "java:comp/env" );
	
	//발견한 JNDI의 Resource이름을 통해 객체를 가져온다
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결
	Connection conn = dataSource.getConnection();
	
	System.out.println("--DB연결 성공--");
	
	String sql = "select * from sawon where deptno =" + deptno;
	
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	ResultSet rs = pstmt.executeQuery();
	//사원목록을 저장하기 위한 List
	List<SawonVO> s_list = new ArrayList<SawonVO>();
	while(rs.next()){
		SawonVO vo = new SawonVO();
		vo.setSabun(rs.getInt("sabun"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSaName(rs.getString("saname"));
		vo.setSaJob(rs.getString("sajob"));

		s_list.add(vo);
	}
	rs.close();
	pstmt.close();
	conn.close();
%> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>사원테이블</caption>
			<tr>
				<td>부서번호</td>
				<td>사번</td>
				<td>직책</td>
				<td>이름</td>
			</tr>	
		<% for(int i=0; i<s_list.size();i++){ %>
		<% SawonVO vo = s_list.get(i); %>
			<tr>
				<td><%= vo.getDeptno()%></td>
				<td><%= vo.getSabun()%></td>
				<td><%= vo.getSaJob()%></td>
				<td><%= vo.getSaName()%></td>
			<tr>
		<% }%>
		</table>
		
	</body>
</html>