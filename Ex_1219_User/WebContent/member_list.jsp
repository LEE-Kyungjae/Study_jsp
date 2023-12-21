<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Ajax사용을 위한 준비 -->
		<script src="js/httpRequest.js" type="text/javascript"></script>
		<script type="text/javascript">
			function del(idx){
				if(!confirm("정말로 삭제하시겠습니까?")){
					return;
				}
				let url = "delete.do"
				let param = "idx="+idx;
				sendRequest(url, param, resultDel, "get");
			}
			function resultDel(){
				if(xhr.readyState==4 && xhr.status == 200){
					console.log(typeof(xhr.responseText));
					//let data = xhr.responseText;
					//let json = (new Function('return '+data))();
					//alert(json[0].param);
					//alert("정상적으로 삭제되었습니다");
					//location.reload();
					//location.href="member_list.do";
				}
			}//F resultFn
			function update(idx){
				let url = "member_update_form.do";
				let param = "idx="+idx;
				sendRequest(url,param,resultUd,"get");
			}
			function resultUd(){
				if(xhr.readyState ==4 && xhr.status ==200){
					let data = xhr.responseText;
					let json = (new Function('return '+data+ ";"))();
					//let json2 = JSON.parse(data);
					//엄밀히 말하면 json객체로 받는방식이 아니고 object type으로 data를 받는과정이다.
					//json형태로 받기위해서는 JSON.parse()를 사용하면 된다.
					location.href="member_update_form.jsp?idx"+json[0].idx+"&name="+json[0].name+"&id="+json[0].id+"&pwd="+json[0].pwd+"&email="+json[0].email+"&addr="+json[0].addr;
				}
			}
			//JSON.parse()
		</script>
	</head>
	<body>
		<table border = "1">
			<caption>:::회원목록:::</caption>
			<tr>
				<td colspan="8">
					<input type = "button" value="회원가입"
					onclick="location.href='member_insert_form.jsp'">
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan="3">주소</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.name}</td>
					<td>${vo.id}</td>
					<td>${vo.pwd}</td>
					<td>${vo.email}</td>
					<td>${vo.addr}</td>
					<td>
						<input type="button" value="삭제" onclick="del('${vo.idx}');">
						<input type="button" value="수정" onclick="update();">
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>









