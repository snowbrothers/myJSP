<%@page import="utils.CookieManager"%>
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

	// 하루동안 팝업창이 열리지 않도록 쿠키 생성
	CookieManager.makeCookie(response, "PopupClose", "Y", 60*60*24);
	// response.sendRedirect("PopupMain1.jsp");
	
%>

</body>
</html>