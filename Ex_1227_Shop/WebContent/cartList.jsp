<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<script type="text/javascript">
	
	</script>
	</head>
	<body>
		<jsp:include page="index.jsp"/>
		<table border="1" width ="600" align="center">
			<caption>장바구니</caption>
			<tr bgcolor="#dedede">
				<th>제품번호</th>
				<th width="35%">제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
			<tr align="center">
				<td>a111</td>
				<td>한샘 컴퓨터</td>
				<td>
					가격:500<br>
					<font color="red">
						할인가:200
					</font>
				</td>
				<td>
					<!-- 수량조절 폼 -->
					<form action="">
						<input type="hidden" name="" value="">
						<input name="" size="4" align="center" value="">
						<input type="submit" value="수정">
					</form>
				</td>
				<td>1000</td>
				<td>
					<input type="button" value="삭제" onclick="">
				</td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					총 결제 금액
				</td>
				<td>1000</td>
			</tr>
		</table>
	</body>
</html>