<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//톰캣서버가 참조할 JNDI를 검색
	InitialContext ic= new InitialContext();

	//참조할 JNDI가 있는 위치 검색
	Context ctx = (Context)ic.lookup( "java:comp/env" );
	
	//발견한 JNDI의 Resource이름을 통해 객체를 가져온다
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결
	Connection conn = dataSource.getConnection();
	
	System.out.println("--DB연결 성공--");

	String sql = "select * from dept";
	
	//sql문장을 실행해주는 객체
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//pstmt를 통해 수행된 최종 결과를 받는 객체
	ResultSet rs = pstmt.executeQuery();
	
	List<DeptVO> dept_list = new ArrayList<DeptVO>();
	while(rs.next()){
		DeptVO vo = new DeptVO();
		vo.setDeptno(rs.getInt("deptno") );
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));

		dept_list.add(vo);
	}
	
	rs.close();//rs도 DB연결에 사용된 객체이므로 반드시 닫아주자
	conn.close();//사용을 완료한 DB는 반드시 연결을 끊어줘야한다.
%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
		<caption> </caption>
		<tr>
			<th>번호</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
			<% for(int i = 0; i< dept_list.size(); i++ ){
				DeptVO vo = dept_list.get(i); 
			%>
			<tr>
				<td><%=vo.getDeptno()%></td>
				<td><%=vo.getDname()%></td>
				<td><%=vo.getLoc()%></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>










