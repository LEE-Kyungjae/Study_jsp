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
				 
				let id =f.id.value;
				let pwd = f.pwd.value;
				if(id==''){
					alert("아이디필수");
					return;
				}
				if(pwd ==''){
					alert("비밀번호 필수");
					return;
				}
				let url ="login.do";
				let param = "id="+id+"&pwd="+encodeURIComponent(pwd);
				sendRequest(url,param,resultFn,"post");
				
			 }//F send
			 
			 function resultFn(){
				 if(xhr.readyState==4&&xhr.status==200){
					 //data = "no_id" or "no_pwd" or "success" 
					 let data=xhr.responseText;
					 if(data =="no_id"){
						 alert("아이디가 존재하지 않습니다");
					 }else if(data =="no_pwd"){
						 alert("비밀번호가 일치하지 않습니다");
						 
					 }else{
						location.href="main_content.jsp"; 
					 }
			 	}//F resultFn
			 }
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
						<input type="button" value="로그인" onclick="send(this.form);">
						<input type="reset" value ="취소">
						</div>
					</td>
					
				</tr>
			</table>
		</form>
	</body>
</html>