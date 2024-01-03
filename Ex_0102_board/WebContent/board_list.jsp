<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="css/table.css" rel="stylesheet">
		<script type="text/javascript" >
		</script>
	</head>
	<body>
		<div>
		<table border="1" width="700">
			<tr>
				<td colspan="5"><img src="img/title_04.gif"></td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th>제목</td>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td align="center">${vo.idx}</td>
					<!-- 댓글 들여쓰기 -->
					<td>
						<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
						<c:if test="${vo.depth ne 0}">ㄴ</c:if>
						<c:if test="${vo.del_info eq 0 }">
						<a href="view.do?idx=${vo.idx}">
							${vo.subject}
						</a>
						</c:if>
						<c:if test="${vo.del_info eq -1}">
							<font color="gray">
								삭제된 게시글 입니다
							</font>
						</c:if>
					</td>
					<c:if test="${vo.del_info eq 0 }">
						<td align="center">${vo.name}</td>
					</c:if>
					<c:if test="${vo.del_info eq -1 }">
						<td align="center">unknown</td>
					</c:if>
					<td align="center">${vo.regdate}</td>
					<td align="center">${vo.readhit}</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="5">
					1 2 3 4 5
				</td>
			</tr>
			<tr>
				<td align="right" colspan=5>
					<img src="img/btn_reg.gif" 
					onclick="location.href='board_write.jsp'">
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>