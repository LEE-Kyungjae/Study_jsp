<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				let title = f.title.value;
				let photo = f.photo.value;
				
				if(photo==''){
					alert("파일선택 필수");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<!-- 파일 업로드시 고려사항 -->
		<!-- 
		1.전송방식 : post
		2.enctype지정 : 폼을 통해 파일을 전송할 때 필요한 인코딩 타입 
		-->
		
		<form method="post" enctype="multipart/form-data" action="">
			제목<input name="title"><br>		
			첨부<input type="file" name="photo"><br>
			<input type="button" value="업로드" onclick="send(this.form);">
		
		
		</form>
	</body>
</html>