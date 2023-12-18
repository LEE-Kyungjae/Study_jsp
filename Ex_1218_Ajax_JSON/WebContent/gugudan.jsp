<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Ajax(Asynchronus Javascript and XML) : 비동기통신 
-한페이지 안에서 변경사항이 발생한 특정영역에 대해서만 갱신을 할 수 있도록 해 주는 기법 
model 1 : 하나의 jsp에서 화면구현 및 처리코드(비지니스 로직)을 한번에 작업하는 구조
model 2(MVC패턴) : 화면을 표현하는 영역과 처리영역을 분리해서 모듈화 해둔 구조
M:Model	(DAO)		
V:View (JSP)
C:Controller (Servlet)
-->

<!-- 
동기: 전체 초기화
비동기 : 부분변경만 필요한경우
 -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Ajax연동을 위한 httpRequest.js 파일을 사용하도록 명시 -->
		<script src="js/httpRequest.js"></script>
		<script>
			function send(){
				let dan = document.getElementById("dan").value;
				if(dan<2||dan>9){
					alert("2~9사이의 값을 입력하세요");
				}
				//location.href="gugudna.jsp?dan="+dan;
				//Ajax로 요청하기 위한 기본 설정
				let url = "gugudan_ajax.jsp";
				let param="dan="+dan;
				
				//sendRequest(전송페이지, 파라미터값, 콜백메서드, "GET");
				sendRequest(url, param, resultFn,"GET");
				function resultFn(){
					//xhr.readyState
					//0 : 초기화 오류
					//1~3 : 페이지 로딩중
					//4 : 로드 완료
					
					//xhr.status
					//200:이상없음
					//4--,5--:오류
					if(xhr.readyState == 4 && xhr.status == 200){
						
						//도착한 데이터 받기
						let data = xhr.responseText;
						
						let disp = document.getElementById("disp");
						disp.innerHTML = data;
					}
					//xhr.responseText
					
					
					//alert("콜백메서드 호출됨");
					//alert(xhr.responseText);
					
				}//F resultFn end
				
			}//F send end
			
		</script>
	</head>
<body>
	<input id="dan">
	<input type="button" value="결과보기" onclick="send();">
	<div id="disp"></div>
	
</body>
</html>




















