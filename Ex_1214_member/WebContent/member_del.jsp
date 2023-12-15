<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx=Integer.parseInt(request.getParameter("idx")); 
	MemberDAO.getInstance().delete(idx);
	
	response.sendRedirect("member.jsp");
%>    
