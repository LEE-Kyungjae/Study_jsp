<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 디자인을 위한 css파일 참조 -->
		<link rel="stylesheet" href="css/photo.css">
		<script type="text/javascript">
			function del(f){
				let pwd=f.pwd.value.trim();
				let pwd2=f.pwd2.value.trim();
				if(pwd !=pwd2){
					alert("비밀번호가 다릅니다");
					return;
				}
				if(!confirm("정말 삭제하시겠어요?")){
					return;					
				}
				
				f.action = "photo_del.do";
				f.method="post";
				f.submit();
			}
			let click = false;
			function imgclick(src){
				//alert(src);
				click=!click;
				let img = document.getElementById("showImg");
				let showdiv =document.getElementById("showdiv");
				if(click){
					img.src=src;
					showdiv.style.display = "block";
				}else{
					img.src="";
					showdiv.style.display="none";
				}
			}
		</script>
	</head>
	<body>
		<div id ="main_box">
			<h1>-- PhotoGallery --</h1>
			<div align="center" style="margin:10px 0">
				<input type = "button" value="사진 업로드" onclick="location.href='photo_insert_form.jsp'">
			</div>
			<div id = "photo_box">
				<c:if test="${empty list}">
					<div align="center">등록된 사진이 없습니다.</div>
				</c:if>
				<c:forEach var="vo" items="${list}">
					<div class="photo_type">
						<img src="upload/${vo.filename}" onclick="imgclick(this.src);">
						<div class="title">${vo.title}</div>
						<form>
							<input type ="hidden" name="idx" value="${vo.idx}">
							<input type ="hidden" name="pwd" value="${vo.pwd}">
							<div>
								<input type="password" name="pwd2" size="11">
								<input type="button" value="삭제" onclick="del(this.form);">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
			<div id="showdiv">
				<img id="showImg" onclick="imgclick();">
			</div>
		</div>
	</body>
</html>