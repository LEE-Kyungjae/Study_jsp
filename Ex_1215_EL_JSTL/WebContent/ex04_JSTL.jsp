<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
JSTL (JSP Standard Tag Library) : 연산이나 조건문(if, for문...)을 HTML영역 안에서 사용가능하게 해주는 라이브러리
-->

<!-- if,forEach문 등의 제어문을 사용할 수 있도록 해 주는 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 출력형식을 변경할 수 있도록 해 주는 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Date today = new Date();
	int money = 2100000000;
	request.setAttribute("today", today);
	request.setAttribute("money", money);
	
	PersonVO v1 = new PersonVO();
	v1.setAge(20);
	v1.setName("김길동");

	PersonVO v2 = new PersonVO();
	v2.setAge(22);
	v2.setName("박길동");
	
	ArrayList<PersonVO> list = new ArrayList<PersonVO>();
	list.add(v1);
	list.add(v2);
	request.setAttribute("arr", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${ today }<br>
	<fmt:formatDate value= "${today}"/><br>
	<fmt:formatDate value= "${today}" pattern="YYYY년 MM월 dd일"/><br>
	<!--  MM,DD,mm,dd 각자 기능 다름-->
	<fmt:formatNumber value="${ money }"/>원<br>
	<hr>
	<!--
	var:1회전 할때마다 변경될 변수
	begin:시작값
	end : 끝값
	step:증가값
	-->
	<c:forEach var="i" begin="1" end="5" step="1">
		<c:if test="${i % 2 eq 1 }">	
			<font color="red">
			<p>안녕${i}</p>
			</font>
		</c:if>
		
		<c:if test="${i % 2 eq 0}">
			<font color="blue">
			<p>반가워${ i }</p>
			</font>
		</c:if>
	</c:forEach>
	<!-- choose내부에는 주석을 달수 없다 -->
	<c:choose>
		<c:when test ="${param.msg eq 10}">나는 10 이다</c:when>
		<c:when test ="${param.msg eq 11}">나는 11 이다</c:when>
		<c:otherwise>모두 아니다</c:otherwise>
	</c:choose>
	<hr>
	<ul>
	<c:forEach var="vo" items="${arr}">
		${vo.name} /${vo.age}<br>
	</c:forEach>
	</ul>
	<!-- forEach의 index와 count -->
	<c:forEach var="v" items="${arr}" varStatus="cnt">
		<c:if test="${cnt.index eq 0}">
		${ v.name }(${ cnt.index } / ${ cnt.count})<br>
		</c:if>
	</c:forEach>
</body>
</html>
