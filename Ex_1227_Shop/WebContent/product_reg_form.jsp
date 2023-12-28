<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		body{
			
		}
		table{
		}
	</style>
	<script type="text/javascript">
		function checkdata(f){			
			f.submit();
		}
	</script>
	<body>
		<jsp:include page="index.jsp"></jsp:include>
		
		<form method="post" enctype="multipart/form-data" action="insert.do">
			<table  border="1" align="center" width="600">
				<tr>
					<td>제품 카테고리</td>
					<td>
						<select name="category">
							<option value="">카테고리 선택하기</option>
							<option value="com001">컴퓨터</option>
							<option value="ele002">생활가전</option>
							<option value="sp003">스포츠</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td>제품번호</td>
					<td><input name="p_num"></td>
				</tr>
				<tr>
					<td>제품명</td>
					<td><input name="p_name"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input name="p_company"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input name="p_price"></td>
				</tr>
				<tr>
					<td>할인가</td>
					<td><input name="p_saleprice"></td>
				</tr>
				<tr>
					<td>제품 상세 설명</td>
					<td><textarea name="p_content" rows="5" cols="50" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<td>제품사진<br>(썸네일용)</td>
					<td><input type="file" name="p_image_s"></td>
				</tr>
				<tr>
					<td>제품사진<br>(상세보기용)</td>
					<td><input type="file" name="p_image_l"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="checkdata(this.form);">
						<input type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>