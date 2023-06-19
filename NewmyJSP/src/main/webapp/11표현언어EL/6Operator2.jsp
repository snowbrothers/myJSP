<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operator</title>
</head>
<body>

	<%
		
		pageContext.setAttribute("num1", 9);
		pageContext.setAttribute("num2", "10");
		
		// empty 연산자
		// null, 빈문자열, 길이가 0인 배열, 사이즈가 0인 컬렉션의 경우 true 를 반환한다.
		pageContext.setAttribute("nullStr", null);
		pageContext.setAttribute("emptyStr", "");
		pageContext.setAttribute("lengthZero", new Integer[0]);
		pageContext.setAttribute("sizeZero", new ArrayList());
	
	%>
	
	<h2>empty 연산자</h2>
	
	<!-- 주로 리스트 출력시 리스트가 비었는지 확인하는 용도로 사용할 수 있다. -->
	empty nullStr 		: ${empty nullStr }		<br>
	empty emptyStr 		: ${empty emptyStr }	<br>
	empty lengthZero 	: ${empty lengthZero }	<br>
	empty sizeZero 		: ${empty sizeZero }	<br>
	empty num1 			: ${empty num1 }		<br>
	
	<h3>삼항 연산자</h3>
	<!-- 조건 ? "ture" : "false" -->
	num1 gt num2 : ${num1 gt num2 ? "num1이 크다" : "num2가 크다" }
	
	<h3>null 연산</h3>
	
	<!-- null 이 연산에 사용될 경우 0으로 인식 한다. 
		오류발생이 줄어든다. 						-->
		${null + 10 } <br>
		${nullStr + 10 } <br>
		${param.noVar > 10 } <br>
		
	<!-- 비교 연산에 사용되어도 별다른 예외 / 오류 없이 출력된다. -->
		
</body>
</html>