<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>first.jsp</h1>
	<hr>
	<%
		
		response.sendRedirect("second.jsp");
	
	%>



</body>
</html>