<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		</style>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<jsp:include page="index.jsp"/>
		<table align="center" border="1" width ="600" style="border-collapse: collapse;" >
			<tr>
				<td width="40%">카테고리</td>
				<td>${vo.category}</td>
			</tr>
			<tr>
				<td width="40%">모델번호</td>
				<td>${vo.p_name}</td>
			</tr>
			<tr>
				<td width="40">제조사</td>
				<td>${vo.p_company}</td>
			</tr>
			<tr>
				<td width="40">가격</td>
				<td>
					<fmt:formatNumber value="${vo.p_price}"/>
					<br>
					(할인가:<fmt:formatNumber value="${vo.p_saleprice}"/>)
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">제품설명</td>
			</tr>
			<tr>
				<td colspan="2"><pre>${vo.p_content}</pre></td>
				<td>${vo.p_}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img alt="rrr" src="image/${vo.p_image_l}" width="500">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="장바구니에 담기" onclick="location.href='cart_insert.do?idx=${vo.idx}'">
					<input type="button" value="장바구니 보기" onclick="location.href='cart_list.do'">
				</td>
			</tr>
		</table>
	</body>
</html>