<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = MemberDAO.getInstance();//DAO객체 생성 
	List<MemberVO> list = dao.selectList();	
	list=dao.selectList();
%>
<%!
	int idx;
	String name;
	String id;
	String pwd;
	String email;
	String addr;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버</title>
	<script>
		function del(idx){
			if(!confirm("정말로 삭제하시겠습니까?")){
				return;
			}				
			location.href="member_del.jsp?idx="+idx;
		}
		function update(){
			location.href="member_update.jsp?idx="+idx+"?action=update";
		}
	
	</script>
	</head>
	<body>
		<table border="1">
		<caption>멤버테이블 출력</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>메일</th>
				<th colspan="2">주소</th>
			</tr>		
			<% for(int i=0; i<list.size(); i++){ 
				MemberVO vo =list.get(i);
			%>
			<tr>
				<td><%=vo.getIdx()%></td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getId()%></td>
				<td><%=vo.getPwd()%></td>
				<td><%=vo.getEmail()%></td>
				<td><%=vo.getAddr()%></td>
				<td>
					<input type="button" value="삭제" onclick ="del('<%=vo.getIdx()%>')">
					<input type="button" value="수정" onclick ="update('<%=vo.getIdx()%>')">
				</td>
			</tr>	
			<%} %>
			
			
			<tr>
				<td colspan="7">
					<input type="button" value="추가" onclick="location.href='insert_form.jsp'">
				</td>
			</tr>
			
		</table>
	</body>
</html>