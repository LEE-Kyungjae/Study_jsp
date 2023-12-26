<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키: 사용자가 웹사이트를 방문한 경우 그 사이트의 서버에서 사용자의 컴퓨터에 설치하는 기록정보 파일
//방문 정보를 쿠키에 기록
//일반쿠키는 브라우저 종료시 자동으로 삭제되는 형태로써 영속성을 가지고 있지 않다(세션쿠키)
Cookie cookie =new Cookie("AA","A.jsp");
//쿠키에게 지속성을 추가	
cookie.setMaxAge(60*2);//초단위 설정
response.addCookie(cookie);
%>


    
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<title>A Page</title>
	</head>
	<body>
	A페이지 방문을 환영합니다<br>
	<a href="B.jsp">B페이지로 가기</a>
	
	</body>
</html>