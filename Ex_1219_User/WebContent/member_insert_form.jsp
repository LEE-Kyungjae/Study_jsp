<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="js/httpRequest.js"></script>
		<script type="text/javascript">
			//중복여부 확인
			let b_idCheck = false;
			
			function send(f){
				let id = f.id.value.trim();
				let pwd = f.pwd.value.trim();
				if(id==''){
					alert('아이디 입력 필수');
					return;
				}
				if(pwd==''){
					alert("비밀번호 입력 필수");
					return;
				}
				if(!b_idCheck){
					alert("아이디 중복체크를 해주세요");
					return;
				}
				f.action = "insert.do";
				f.submit();
			}//Fsend
			function check_id(){
				let id = document.getElementById("id").value.trim();
				if(id==''){
					alert("아이디를 입력하세요");
					return;
				}
				
			//아이디 중복체크를 위한 Ajax
			let url = "check_id.do"
			let param = "id="+id;
			sendRequest(url, param, resultFn2, "POST");
			}//F check_id
			
			function resultFn2(){
				if(xhr.readyState==4 && xhr.status == 200){
					console.log(typeof(xhr.responseJSON));
					let json =new Function("return "+xhr.responseJSON);
					//data = "[{'result':'%s'},{'id':'%s'}]"
					//let data = xhr.responseText;
					//let json = (new Function(data));
					//let json = eval(data);
					if(json.result == 'no' ){
						alert(json[1].id+"는 이미 사용중입니다");
						return;
					}
					alert(json.id+"는 사용 가능합니다");
					b_idCheck = true;
				}
			}//F resultFn
			function che(){
				console.log("인풋 내용 변경됨");
				b_idCheck = false;
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::회원가입:::</caption>

				<tr>
					<th>아이디</th>
					<td>
						<input name="id" id="id" onchange="che();">
						<input type="button" value="중복체크" onclick="check_id();">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input name="email"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type= "button" value="가입" onclick="send(this.form)">
						<input type="button" value="취소" onclick="location.href='member_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>