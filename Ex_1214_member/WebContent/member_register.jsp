<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//post 형식으로 넘어온 한글데이터를 유지
	request.setCharacterEncoding("utf-8");
	//sung_insert.jsp?name=hong&kor=90&eng=38....
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	String action =request.getParameter("action");
	// request로 받아온 네 개의 파라미터 정보를 vo로 묶자
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	
	if(action.equals("insert")){
	MemberDAO.getInstance().insert(vo);	
	}
	if(action.equals("update")){
	MemberDAO.getInstance().update(vo);	
	}
	response.sendRedirect("member.jsp");
	%>