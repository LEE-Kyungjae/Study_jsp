<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function modify(f){
				let c_cnt = f.c_cnt.value;
				let numChk=/^[0-9]+$/;
				if(!numChk.test(c_cnt)){
					alert("수량은 정수로만 입력하세요");
					return;
				}
				//cart_update.do
				f.submit();
			}	
			function del(c_idx){
				 	if(!confirm("정말로 삭제할까요?")){
				 		return;
				 	}
				 	location.href="cart_delete.do?c_idx="+c_idx;
			}
		</script>
	</head>
	<body>
		<jsp:include page="index.jsp"/>
		<table border="1" width ="600" align="center">
			<caption>장바구니</caption>
			<tr bgcolor="#dedede">
				<th>제품번호</th>
				<th width="25%">제품명</th>
				<th>단가</th>
				<th width="15%">수량</th>
				<th width="15%">금액</th>
				<th width="5%">삭제</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr align="center">
				<td>${vo.p_num}</td>
				<td>${vo.p_name}</td>
				<td>
					<fmt:parseNumber value="${vo.p_price}"/>
					<br>
					<font color="red">
						할인가:<fmt:parseNumber value="${vo.p_saleprice}"/>
					</font>
				</td>
				<td>
					<!-- 수량조절 폼 -->
					<form action="cart_update.do">
						<input type="hidden" name="c_idx" value="${vo.c_idx}">
						<input name="c_cnt" size="4" align="center" value="${vo.c_cnt}">
						<input type="button" value="수정" onclick="modify(this.form);">
					</form>
				</td>
				<td>${vo.c_cnt * vo.p_saleprice}</td>
				<td>
					<input type="button" value="삭제" onclick="del('${vo.c_idx}');">
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
					총 결제 금액
				</td>
				<td><fmt:formatNumber value="${tot_amt}"/></td>
			</tr>
		</table>
	</body>
</html>