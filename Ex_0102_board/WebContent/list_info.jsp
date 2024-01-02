<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="css/table.css" rel="stylesheet">
		<style type="text/css">
			#text{
				min-height: 100px;
			}
		</style>
		<script type="text/javascript">
			function del(){
				if(!confirm("정말로 삭제하시겠습니까?")){
					//삭제취소
					return;
				}
				sendRequest("delete.do", idx, resultFn, "POST");
			}
			function resultFn(){
				if(xhr.readystate==4 && xhr.response==200){
					alert("해당글이 정삭적으로 삭제되었습니다.");
				}
			}
			function upd(){
			}
		</script>
		<script type="text/javascript">

			//수정
			
			//커멘트
			function com(){
				
				
			}
			//삭제
			
			function resultFn(){
				if(xhr.ready==4 && xhr.status=200){
				}
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1" width="600">
				<caption>글 상세보기</caption>
				<tr>
					<th width=15%>제목</td>
					<td>${subject}</td>
				</tr>
				<tr>
					<th>작성자</td>
					<td>${name}</td>
				</tr>
				<tr>
					<th>작성일</td>
					<td>${regdate }</td>
				</tr>
				<tr>
					<th>ip</td>
					<td>${ip }</td>
				</tr>
				<tr>
					<th>내용</td>
					<td id="text">${content}</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="button" value="목록으로" onclick="history.go(-1);">
					<input type="button" value="댓글" onclick="com();">
					<input type="button" value="수정" onclick="upd();">
					<input type="button" value="삭제" onclick="del();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>