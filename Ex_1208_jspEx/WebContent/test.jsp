<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp(java server page) : 내부적으로 연산능력을 갖는 html 이다 -->
<!-- 스크립트릿(Scriptlet) : jsp에서 자바코드를 사용하고자 할 때 지정하는 영역 -->
<%
	//jsp --> servlet --> UI
String ip = request.getRemoteAddr();//접속자의 ip주소
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		&lt; %@ 내용 %&gt; : 페이지 인코딩, import등을 설정할수 있도록 하는영역 <br>
		&lt;% 자바코드; %&gt; : 스크립트 릿 -jsp에서 자바코드를 사용하고자 할 때<br>
		&lt;%= 변수명 %&gt; :스트립트 릿에서 만든 변수를 출력하는 영역 <br>
		<%= ip %>님 환영합니다
		&lt;%= 변수명; %&gt; : 과 같이 ;은 사용이 불가하다
	</body>
</html>