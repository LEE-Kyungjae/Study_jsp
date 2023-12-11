<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    //post형태로 한글이 전달되면 깨져서 출력되기 때문에
    //아래의 코드를 통해 한글이 깨지는것을 방지해줘야 한다
    request.setCharacterEncoding("utf-8");
    
    
    //외부에서 넘겨받은 파라미터는 자바코드로 받아준다
    String name = request.getParameter("name");
    //request.getParameter()로 가져오는 모든 결과물은 String타입으로 넘어오기 때문에
    //정수형태로 처리하기 위해서 Integet.parseint()를 써야 한다
    int age = Integer.parseInt(request.getParameter("age"));
    String tel = request.getParameter("tel");
    
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		이름 : <%= name %>
		나이 : <%= age %>
		전화번호 : <%= tel %>
		
	</body>
</html>