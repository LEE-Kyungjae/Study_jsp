

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="js/httpRequest.js"></script>
		<script type="text/javascript">
		function send(f){
			let url = "member_upd_fin.do";
			let param = "idx="+f.idx.value+"&id="+f.id.value+"&pwd="+encodeURIComponent(f.pwd.value)+"&name="+f.name.value+"&email="+f.email.value+"&addr="+f.addr.value;
			sendRequest(url.param,resultFn,"post");
		}
		
		function resultFn(){
			(xhr.readyState == 4 && xhr.status == 200){}
			let data =xhr.responseText;
			if(data ==0){
				alert("수정실패");
				return;
			}
			alert("수정성공");
			location.href="member_list.do";
			
		}
		</script>
	</head>
	<body>
		<form>
				<input type ="hidden" value="${param.idx}"name="idx">
				<table border="1">
					<caption>:::내 정보 수정:::</caption>
	
					<tr>
						<th>아이디</th>
						<td>
							<input name="id" value="${param.id}" readonly>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="name" value="${param.name}"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" value="${param.pwd}"></td>
					</tr>
	
					<tr>
						<th>이메일</th>
						<td><input name="email" value="${param.email}"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input name="addr" value="${param.addr}"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type= "button" value="수정" onclick="send(this.form)">
							<input type="button" value="취소" onclick="location.href='member_list.do'">
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>