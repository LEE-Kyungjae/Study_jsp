<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src = "js/httpRequest.js"></script>
		<script>
		window.onload = function(){
			//현재 페이지 호출시 가장 먼저 실행되는 영역
			let url = "movie_list_json.jsp";
			sendRequest(url, null, resMovie, "get");
			//콜백메서드
			function resMovie(){
				if(xhr.readyState == 4 && xhr.status == 200){
					//data = "[{'title': '힙통령'..,
					//{'title':'힙락합창'...}}]"
									
					let data =xhr.responseText;
					//xhr.responseText받아온 문자열 정보를
					//실제 JSON구조로 변경해줘야 한다
					let json = eval(data); /* 보안적으로 위험함.멋대로 스크립트 실행가능성있음 */
					//let json = (new Function(return + data))();
					//select태그에 option태그를 생성해서 추가
					let movie_select = document.getElementById("movie_select");
					for(var i = 0; i<json.length; i++){
						let option = document.createElement("option");
						option.innerHTML = json[i].title;
						option.value=json[i].path;
						movie_select.appendChild(option);
					}//f
				}//i
			}//F resMovie
		}	
		function movie_play(){
			//현재 선택된 option의 value값을 가져온다
			let path = document.getElementById("movie_select").value;
			let my_video = document.getElementById("my_video");
			my_video.src = path;
			//alert(path);
			my_video.play();
		}
		</script> 
	</head>
	<body>
		<select id="movie_select" onchange="movie_play();">
			<option>:::재생할 영상을 선택하세요:::</option>
		</select>
		<br>
		<video 	id = "my_video"
				src=""
				controls="controls"
				width="320"
				height="240">
		</video>
	</body>
</html>