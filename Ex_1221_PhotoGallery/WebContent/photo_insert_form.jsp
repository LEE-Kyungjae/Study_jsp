<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사진등록 페이지</title>
		<script>
			function send(f){
				let title = f.title.value.trim();
				let pwd = f.pwd.value.trim();
				let photo =f.photo.value.trim();
				if(photo == ''){
					alert("등록할 사진을 선택하세요");
					return;
				}
			/* title,pwd는 이미 했다고 가정 */
			f.submit();
			}
			
		</script>
	</head>
	<body>
		<form action="insert.do"
				method="post"
				enctype="multipart/form-data">
			<table align="center" border="1">
				<caption>사진 등록하기</caption>
				<tr>
					<th>제목</th>
					<td><input name="title"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>업로드 사진</th>
					<td><input type="file" name="photo"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록하기"
						onclick="send(this.form);">
						<input type="button" value="취소"
						onclick="history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>