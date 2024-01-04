<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">

		</script>
	</head>

	<body>
		<c:forEach var="vo" items="${list}">
			<form>
				<input type="hidden" name ="c_idx" value="${vo.c_idx}">
				<input type="hidden" name ="pwd" value="${vo.pwd}">
				<hr>
				<pre>${vo.content}</pre>
				${vo.name}(${vo.regdate})<br>
				비밀번호<input type="password" name = "c_pwd">
				<input type="button" value="삭제" onclick ="del_comment(this.form);">
			</form>
		</c:forEach>
	</body>
</html>