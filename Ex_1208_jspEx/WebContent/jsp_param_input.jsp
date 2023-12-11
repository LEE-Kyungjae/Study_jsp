<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send1(f){
				let name = f.name.value;
				let age = f.age.value;
				let tel = f.tel.value;
				
				if(name == ''){
					alert("이름을 입력하세요");
					return;
				}
				
				let num_pattern = /^[0-9]{1,3}$/; 
				if(!num_pattern.test( age )){
					alert("나이는 정수로 입력하세요");
					return;
				}
		
				
				f.action="param1.jsp";
				f.method="post";
				f.submit();
				
			}//send1 f
			
			function send2(f){
				f.action = "param2.jsp";
				f.submit();
				
			}
			
		</script>
	</head>
	<body>
		<form>
			이름:<input name="name"><br>
			나이:<input name="age"><br>
			전화:<input name="tel"><br>
			
			<input type="button" value= "낱개로 전송" onclick="send1(this.form);">
			<input type="button" value= "묶어서 전송" onclick="send1(this.form);">
		
		</form>
	</body>
</html>