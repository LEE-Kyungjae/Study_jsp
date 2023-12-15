<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<script>
			function send(f){
				//유효성 체크 했다는 가정하에 진행
				f.method="post";
				f.action="member_update.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::초간단 회원가입:::</caption>
				<tr>
					<th>이름</th>
					<th><input name="name"><%= %></th>
					
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="id"><%= %></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input name="pwd" type="password"><%= %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="email"><%= %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr"><%= %></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="수정" onclick="send(this.form);">
					<input type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		
		
		
		
		</form>
	</body>
</html>