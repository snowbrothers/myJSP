<%@page import="utils.CookieManager"%>
<%@page import="el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출력</title>
</head>
<body>

<%
	
	MyElClass myClass = new MyElClass();

	pageContext.setAttribute("myClass", myClass);
	pageContext.setAttribute("response", response);
%>

<h3>영역에 저장 후 메서드 호출하기</h3>

	001129-3000000 => ${myClass.getGender("001129-3000000")}<br>
	001129-4000000 => ${myClass.getGender("001129-4000000")}<br>

<h3>정적메서드 호출하기</h3>
	${MyElClass.showGugudan(7) }
	
<h3>정적메서드 호출하기 - 쿠키 생성하기</h3>
	<!-- response 에서 Null 오류 발생 -->
	${CookieManager.makeCookie(response, "ELCookie", "35도는심하다", 10)}
	${cookie.ELCookie.value }
</body>
</html>