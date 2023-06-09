<%@ page import="javax.servlet.http.Cookie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키재정의</title>
</head>
<body>

	<%
		Cookie[] cookies = request.getCookies();
		
		if(cookies !=null && cookies.length >0){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("newCookie")){
					Cookie cookie = new Cookie("새새쿠키","새새값");
					response.addCookie(cookie);
				}
			}
		}
	
	%>
</body>
</html>