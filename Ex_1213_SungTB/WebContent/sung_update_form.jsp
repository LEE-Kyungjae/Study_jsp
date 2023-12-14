<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//sung_update_form.jsp?no=21&name....
	String name = request.getParameter("name");
	int no = Integer.parseInt(request.getParameter("no"));
	int kor= Integer.parseInt(request.getParameter("kor"));
	int eng= Integer.parseInt(request.getParameter("eng"));
	int mat= Integer.parseInt(request.getParameter("mat"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script >
			function send(f){
				let no = f.no.value;
				let name = f.name.value.trim();
				let kor = f.kor.value.trim();
				let eng = f.eng.value.trim();
				let mat = f.mat.value.trim();
				
				if(name == ''){
					alert("이름을 입력하세요");
					f.name.focus();
					return;
				}
				let number = /^[0-9]+$/;
				if(!number.test(kor)||kor<0 || kor>100){
					alert("성적은 0~100까지의 정수입니다");
					f.kor.focus();
					return;
				}
				
				if(!number.test(eng)||eng<0 || eng>100){
					alert("성적은 0~100까지의 정수입니다");
					f.eng.focus();
					return;
				}
				if(!number.test(mat)||mat<0 || mat>100){
					alert("성적은 0~100까지의 정수입니다");
					f.mat.focus();
					return;
				}
				f.action="sung_update.jsp";
				f.submit();
				
				
			}
		
		
		
		</script>
	</head>
	<body>
		<form method = "post">
			<input type = "hidden" name ="no" value=<%=no %>>
			<table border="1" >
				<caption>학생수정</caption>
				<tr>
					<th>이름</th>
					<td><input name= "name" value="<%=name%>"></td>
				</tr>			
				<tr>
					<th>국어</th>
					<td><input name= "kor" value="<%=kor%>"></td>
				</tr>			
				<tr>
					<th>영어</th>
					<td><input name= "eng" value="<%=eng%>"></td>
				</tr>			
				<tr>
					<th>수학</th>
					<td><input name= "mat" value="<%=mat%>"></td>
				</tr>			
				<tr>
					<td colspan="2">
					<input type="button" value = "등록" onclick = "send(this.form);">
					<input type="button" value = "취소" onclick = "location.href='student.jsp'">
					</td>
				</tr>			
				
			</table>
		</form>
		
		
		
		
		
	</body>
</html>