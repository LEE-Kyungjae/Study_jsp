<!--  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="css/table.css" rel="stylesheet">
		<script>
			function senc_check(  ){
				let f = document.f;
				
				//유효성 체크 했다 가정
				
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="f" method="post" action="reply.do">
		
			<input type="hidden" name="idx" value="${ param.idx }">
			<input type="hidden" name="page" value="${ param.page }">
		
			<table border="1" width="700" align="center">
				<caption>::: 댓글 쓰기 :::</caption>
				
				<tr>
					<td>제목</td>
					<td><input name="subject"></td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><textarea name="content" 
					              rows="9" cols="85" style="resize:none;"></textarea></td>
				</tr>
				
				<tr>
					<td width="30%">비밀번호</td>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<td align="right" colspan="2">
						<img src="img/btn_reg.gif" onclick="senc_check();"
						     style="cursor:pointer;">
						     
						<img src="img/btn_back.gif" onclick="history.go(-1)"
						     style="cursor:pointer;">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>











