<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		int i = 10;
	
		if(i > 0){
			// 내장객체를 이용한 출력
			out.write("<h1>" + i + "는 0 보다 크다. </h1>");
			
		%>
			<h1>i는 0보다 크다.</h1>	
		<%
		}
		 %>
	


</body>
</html>