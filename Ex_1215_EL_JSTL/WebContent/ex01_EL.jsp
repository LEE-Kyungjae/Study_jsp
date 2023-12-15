<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*

	EL(Expression Language) : JSP에서 사용하는 표현식을 간결하게 해 주는 표현언어
	1.EL로 값을 표현하려면 4개의 영역(PageScope,RequestScope,SessionScope,ApplicationScope)에 대해 알아야 한다
	
	1) page영역
		-현재 페이지 내에서만 값을 공유하는 것을 허가
	2) request영억(가장 많이 사용하는 영역)
		-하나의 프로젝트에서 페이지 두 개가 서로 값을 공유하도록 허가
	3) session영역(두번째로 많이 사용되는 영역)
		-톰캣이 실행될때 자동으로 생성되는 영역
		하나의 웹 브라우저에서 요청되는 모든 페이지들간의 값 공유가 가능
	4) application영역
		- 프로젝트당 한개만 만들어지는 영역
		현재 프로젝트에 존재하는 페이지들간의 값 공유가 가능
*/

	String msg = "안녕";
	request.setAttribute("msg", msg);
	pageContext.setAttribute("msg2", "페이지 스코프에 저장된 값");
	session.setAttribute("msg","세션스코프에 저장된 값");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	jsp표현식 : <%=msg %><br>
	EL표현식1 : ${ requestScope.msg }<br>
	EL표현식2(생략) : ${msg}<br>
	EL표현식3 : ${pageScope.msg2}<br>
	EL표현식4(생략) : ${msg2}<br>
	EL표현식5 : ${sessionScope.msg}<br>
	EL표현식6(파라미터값) : ${param.msg}<br>
<!-- 생략식 사용시 영역참조 순서
	1.page영역
	2.request영역
	3.session영역
	4.application영역
	
-->	
	
</body>
</html>



