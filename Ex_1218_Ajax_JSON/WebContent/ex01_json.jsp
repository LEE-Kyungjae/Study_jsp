<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
JSON(JavaScript Object Notation)표기법:
서로다른 OS나 개발환경에서 같은 데이터를 공유하거나 교환하기 위한 표기법
 
 -->

    
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script> 
			//1차원 json구조
			let p = {'name':'홍길동', 'age':'20','tel':'010-111-111'};
			document.write("이름 : " + p.name + '<br>');
			document.write("나이 : " + p.age + '<br>');
			
			//JSON의 배열
			let p_arr = [
							{'name':'일길동','age':'30'},
							{'name':'이길동','age':'40'}
						];
			document.write(p_arr[0].name + " / " + p_arr[0].age);
			document.write("<hr>");
			
			//JSON의 1차원 배열
			let p_arr2 = {'test' : ['java', 'android', 'jsp']};
			document.write(p_arr2.test[0] = '/' + p_arr2.test[1]);			
			document.write("<hr>");

			//JSON혼합형
			let course = {	'name' : '백엔드과정',
							'start':'2023-10-01',
							'end':'2023-03-01',
							'sub':['java','node','jsp'],
							'student':[
										{'name':'일길동','age':'20'},
										{'name':'이길동','age':'25'}
									 ]
						};
			document.write("과정명 : " + course.name + "<br>");
			document.write("시작일 : " + course.start + "<br>");
			document.write("시작일 : " + course.end + "<br><br>");
			
			document.write("과목명 : ");
			for(let i = 0; i<course.sub.length; i++){
				document.write(course.sub[i]+ "/" );
				
			}
			document.write("<br>");
			document.write("학생명 : " + course.student[0].name + "/"+
					course.student[0].age);
		</script>
	
	</head>
	<body>
	
	</body>
</html>