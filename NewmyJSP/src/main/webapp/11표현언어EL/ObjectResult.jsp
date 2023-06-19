<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectResult.jsp</title>
</head>
<body>

	<h2>영역을 통해 전달된 객체 읽기</h2>
	
	<%
		/*
			표현언어 EL 사용 시 형변환 없이 파라메터를 읽어올 수 있다.
			따로 null 처리를 하지않아도 된다.
			임포트만 해주면 됨.
		*/
	%>
	
	<ul>
		<li>Person 객체 : 
			<p> 아이디 ${personObj.id } : , 이름 : ${personObj.name }</p></li>
		<li>String 객체 :
			<p> ${stringObj }</p>
		</li>
		<li>integer 객체:  
			<p> ${integerObj }</p>
		</li>
	</ul>
	
	
	
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<li>first : 
			<p>${param.firstNum } </p> </li>
		<li>second : 
			<p>${param.secondNum }</p> </li>
		<li>param 연산 : 
			<p> ${param.firstNum + param.secondNum }</p></li>	
		<li>[] 출력 : ${param['firstNum'] }</li>
		<li>[] 출력 : ${param['secondNum'] }</li>	
		
		
	</ul>


</body>
</html>