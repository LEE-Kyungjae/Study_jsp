<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		table{
		 	background-color:#dedede;
			width:600px;
			border-radius: 5px;
		 	border-collapse: collapse;
		  	border-style: hidden;
		  	box-shadow: 0 0 0 1px #000;
		  	
		}
		img{
			width:"100"; height:"90";
		}
		td{
		}
		.regi{
			width:600px;
			margin:10px auto;
			text-align:center;
		}
	</style>
	<script>
		function regi(){
						
			location.href="product_reg_form.jsp";
		}
	</script>
	<body>
		<jsp:include page="index.jsp"/>
		<div class="regi">
			<input id="reg" type="button" value="상품등록" onclick="regi();">
		</div>
		<table align="center" border="1" >
			<tr>
				<th width="10%">번호</th>
				<th>이미지</th>
				<th width="35%">제품명</th>
				<th width="20%">제품가격</th>
				<th width="10%">비고</th>
			</tr>
			<!-- 해당 카테고리에 아직 제품이 없다면 -->
			<c:if test="${list.size() eq 0 }">
				<tr>
					<td colspan="5" align="center">
						현재 상품이 없습니다
					</td>
				</tr>
			</c:if>
 			<c:forEach var="vo" items="${list}">
			<tr>
				<td>
					${vo.p_num}
				</td>
				<td align="center">
					<img src="images/${vo.p_image_s}" height=50px>
					</td>
				<td align="center">
					<a href="view.do?idx=${vo.idx}">${vo.p_name}
				</td>
				<td align="center">
					할인가 :<fmt:formatNumber value="${vo.p_saleprice}"/>
					<font color="red">
						(${vo.sale_rate}%)
					</font>
				</td>
				<td align="center">
					단가
					<br>
					<fmt:formatNumber value="${vo.p_price}"/>
				</td>
			</tr>
			</c:forEach> 
		</table>
	</body>
</html>