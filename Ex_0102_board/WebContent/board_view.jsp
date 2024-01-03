<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="css/table.css" rel="stylesheet">
		<!-- Ajax사용을 위한 js추가 -->
		<script src="js/httpRequest.js"></script>
		
		<script>
			function reply(){
				location.href="board_reply.jsp?idx=${vo.idx}";
			}
			
			function del(){
				if( !confirm("삭제 하시겠습니까?") ){
					return;
				}
				
				let f = document.f;
				
				let pwd = ${vo.pwd};
				let c_pwd = f.c_pwd.value;
				
				if( pwd != c_pwd ){
					alert("비밀번호 불일치");
					return;
				}
				
				let url ="del.do";
				let param = "idx=${vo.idx}";
				
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					
					if( data == 1 ){
						alert("삭제 성공");
						location.href="list.do";
					}else{
						alert("삭제실패");
					}
					
				}
			}
		</script>
		
	</head>
	
	<body>
		
		<form name="f" method="post">
	
		<table border="1" width="700" align="center">
			<tr>
				<td>제목</td>
				<td>${ vo.subject }</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${ vo.name }</td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td>${ vo.regdate }</td>
			</tr>
			
			<tr>
				<td>ip</td>
				<td>${ vo.ip }</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><pre>${ vo.content }</pre></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="c_pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<!-- 목록으로 -->
					<img src="img/btn_list.gif" onclick="location.href='list.do'"
					     style="cursor:pointer;">
					
					<c:if test="${ vo.depth eq 0 }">
						<!-- 댓글 -->
						<img src="img/btn_reply.gif" onclick="reply();" 
						     style="cursor:pointer;">
					</c:if>     
					     
					<!-- 수정 -->
					<img src="img/btn_modify.gif" onclick="modify();"
					     style="cursor:pointer;">  
					     
					<!-- 삭제 -->
					<img src="img/btn_delete.gif" onclick="del();"
					     style="cursor:pointer;">         
				</td>
			</tr>
		</table>
		
		</form>
	</body>
</html>










