<%@page import="java.net.URLEncoder"%>
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
	String id ="honggil";
	String pw ="1234";
	String name = "홍길동";
	
	// 한글깨짐 방지
	request.setCharacterEncoding("UTF-8");
	if(id.equals(request.getParameter("id")) 
			&&	pw.equals(request.getParameter("pw"))){
		
		response.sendRedirect("main.jsp?name="+URLEncoder.encode(name,"UTF-8"));
	
	}else{
		
		
		
		
		response.sendRedirect("loginForm.jsp?loginYN=N");
	}
	%>




</body>
</html>