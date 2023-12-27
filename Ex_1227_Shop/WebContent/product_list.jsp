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
	</style>
	<body>
		<jsp:include page="index.jsp"/>
		<table align="center" border="1" >
			<tr>
				<th width="10%">번호</th>
				<th>이미지</th>
				<th width="35%">제품명</th>
				<th width="20%">제품가격</th>
				<th width="10%">비고</th>
			</tr>
 			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.p_num}</td>
				<td align="center"><img src="images/${vo.p_image_l}" height=50px></td>
				<td>${vo.p_name}</td>
				<td>할인가 : ${vo.p_saleprice}	
					<font color="red">
						(
						<c:set var="result" value="${vo.p_saleprice/vo.p_price*100}"/>
						${result+((result%1>0.5)?(1-(result%1))%1:-(result%1))}
						%)
					</font></td>
				<td>단가 : ${vo.p_price}</td>
			</tr>
			</c:forEach> 
			<c:if test="${empty list}">
			<tr>
				<td>p11</td>
				<td>
					<img src="images/">
				</td>
				<td>
					<a href="#">로체스 인라인</a>
				</td>
				<td>
					할인가:3000<br>
					<font color="red">
						(70%)
					</font>
				</td>
				<td>
					단가 : 10000원
				</td>
			</tr>
			</c:if>
		</table>
	</body>
</html>