<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Map<String,String> map = new HashMap<>();
	map.put("driver", "oracle db");
	map.put("user","system");
	map.put("pwd","1111");
	request.setAttribute("map1", map);
	PersonVO vo = new PersonVO();
	
	vo.setName("홍길이");
	vo.setAge(10);
	request.setAttribute("vo", vo);
	
	List<PersonVO> list = new ArrayList<>();
	list.add(vo);
	request.setAttribute("list", list);
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	${map1.get('driver')}<br>
	${map1["user"]}<br>
	${map1.pwd}<br>
	<hr>
	
	${vo.getAge()}<br>
	${vo.name} / ${vo.age}<br>
	${list.get(0).getName()} - ${list[0].name}<br>
	
</body>
</html>