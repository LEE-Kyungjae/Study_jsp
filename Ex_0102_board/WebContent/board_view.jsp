<!-- 상세보기 -->
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
				location.href="board_reply.jsp?idx=${vo.idx}&page=${param.page}";
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
						location.href="list.do&page="+${param.page};
					}else{
						alert("삭제실패");
					}
					
				}
			}
			function send(f){
				let name = encodeURIComponent(f.name.value);
				let content = encodeURIComponent(f.content.value);
				//유효성체크 했다고 가정
				let url = "comment_insert.do";
				let param = "b_idx=${vo.idx}&name="+name+"&content="+content+"&pwd="+encodeURIComponent(f.pwd.value);
				sendRequest(url, param, comm_result,"post");
			}
			function comm_result(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					if( data == 1 ){
						comment_list();// 전체댓글요청
					}else{
						alert("댓글등록 실패");
						return;
					}
				}
			}
			function comment_list(){
				let url = "comm_list.do";
				let param = "b_idx=${vo.idx}";
				sendRequest(url,param,list_result,"post");
			}
			function list_result(){
				if(xhr.readyState == 4 && xhr.status ==200){
					let data =xhr.responseText;
					document.getElementById("comment_disp").innerHTML = data;
				}
			}
			//이미 댓글이 달려있는 게시글을 클릭했다면
			//기존 게시물들을 보여주고 시작
			window.onload = function(){
				comment_list();
			}
			function del_comment(f){
				let pwd=f.pwd.value;//원본 비번
				let c_pwd=f.c_pwd.value;
				alert(f.c_idx.value);
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
						 onclick="location.href='list.do?page=${param.page}'"
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
		<div id="comment_form">
			<form action="">
				<table>
					<tr>
						<th>작성자</th>
						<td><input name="name"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input name="pwd" type="password">
							<input type="button" value="댓글" onclick="send(this.form);">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 댓글이 보여지는 영역 -->
		<div id="comment_disp">
		</div>
	</body>
</html>










