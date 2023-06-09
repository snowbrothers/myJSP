<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키Test</title>
</head>
<body>
	<% 
		Cookie cookie = new Cookie("newCookie","새쿠키");
		response.addCookie(cookie);		
	%>
	
	<h2>쿠키 값 출력</h2>
	
	<%=
		cookie.getName() +"<br>"
		+ cookie.getValue()
		
		%>
	
</body> 
</html>