<%@page import="vo.SjVO"%>
<%@page import="dvo.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//post 형식으로 넘어온 한글데이터를 유지
	request.setCharacterEncoding("utf-8");
	//sung_insert.jsp?name=hong&kor=90&eng=38....
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	
	// request로 받아온 네 개의 파라미터 정보를 vo로 묶자
	SjVO vo = new SjVO();
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	SjDAO.getInstance().insert(vo);
	response.sendRedirect("student.jsp");
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>