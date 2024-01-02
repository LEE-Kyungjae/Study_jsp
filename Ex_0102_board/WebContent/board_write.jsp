<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>

		table{
			
		}
		img{
			cursor:pointer;		
		}
	</style>
	<script type="text/javascript">
		function send_check(){
			let f = document.f;
			
			//유효성 체크 했다고 치고
			f.submit();
		}
	</script>
	<body>
		<form name="f" method="post" action="insert.do">
			<div>

			<table border="1" align="center">
				<caption>::: 새 글 쓰기 :::</caption>
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
					<td><textarea name="content" rows="9" cols="87" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<img src="img/btn_reg.gif" onclick="send_check();">
						<img src="img/btn_back.gif" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
			</div>
		</form>		
	</body>
</html>