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
		<script src="js/httpRequest.js" type="text/javascript"></script>
		<script type="text/javascript">
			function addCart(idx,m_idx){
				let url = "cart_insert.do";
				let param = "idx="+idx+"&m_idx="+m_idx;
				sendRequest(url, param, resultFn,"POST");
			}
			function resultFn(){
				if(xhr.readyState==4 && xhr.status ==200){
					//"no" or "yes"
					let data = xhr.responseText;
					if(data =='yes'){
						alert("장바구니에 담았습니다.");
						if(!confirm("장바구니로 이동하시겠습니까?")){
							return;
						}
						location.href="cart_list.do";
						
					}else{
						alert("이미 장바구니에 담겨있는 상품입니다.");
					}
				}				
			}
			function del_list(idx){
				let url= "delete_list.do"
				let param= "idx"+idx;
				sendRequest(url,param,resultFn2,"Post");
			}
			function resultFn2(){
				if( xhr.readyState==4 && xhr.status==400){
					let data ==xhr.responseText;
					if(data=='yes'){
							alert("해당상품이 삭제되었습니다.");
						}
					location.href="cart_list.do";
				}
			}
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
				<td colspan="2">
					<pre>
						${vo.p_content}
					</pre>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src="images/${vo.p_image_l}" width="500">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="장바구니에 담기" onclick="addCart('${vo.idx}','${1}');">
					<%-- "location.href='cart_insert.do?idx=\${vo.idx},\${sessionScope.user.idx}'" --%>
					<input type="button" value="장바구니 보기" onclick="location.href='cart_list.do'">
					<input type="button" value="아이템 삭제" onclick="del_list('${vo.idx}');">
				</td>
			</tr>
		</table>
	</body>
</html>