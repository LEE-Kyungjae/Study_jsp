<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
		function find(){
			let deptno = document.getElementById("deptno").value; 				
			location.href="sawonlist.do?deptno="+deptno;
		}
	</script>
	
	<body>
		<div align="center">
		부서번효:
		<select id="deptno">
			<option value="0">:::부서 선택:::</option>
			<option value="10">accounting</option>
			<option value="20">research</option>
			<option value="30">sales</option>
			<option value="40">operations</option>
		</select>
		<input type="button" value="검색" onclick="find();">
		
		<table border="1" align="center">
			<caption>사원목록</caption>
			<tr>
				<th>사원번호</th>
				<th>이름</th>
				<th>직책</th>
				<th>급여</th>
				<th>부서번호</th>
				<th>입사일</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.sabun}</td>
				<td>${vo.saname}</td>
				<td>${vo.sajob}</td>
				<td>${vo.sapay}</td>
				<td>${vo.deptno}</td>
				<td>${fn:split(vo.sahire,' ')[0]}</td>
			</tr>
			</c:forEach>
		</table>		
		</div>
	</body>
</html>