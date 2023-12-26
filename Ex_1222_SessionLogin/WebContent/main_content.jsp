<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인에 성공하여 메인페이지로 접근할 수 있는지를 판단 -->
<c:if test="${empty sessionScope.vo }" >
	<script>
		alert("로그인후 이용해주세요 ")
		location.href="login_form.jsp"
	</script>
</c:if>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<jsp:include page="check_login.jsp"/>
		메인페이지<br>
		${vo.name}님 환영합니다<br>
		<input type="button" value="로그아웃" onclick="location.href='logout.do'">
		
	</body>
</html>