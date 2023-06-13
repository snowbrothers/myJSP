<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	
	session.removeAttribute("UserId");
	session.removeAttribute("member");
	
	
	response.sendRedirect("LoginForm.jsp");
	
%>

</body>
</html>