<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- sessionId 를 발급 -> 응답객의 쿠키에 담아서 웹브라우져로 전송
		웹브라우저는 응답을 받아서 쿠키에 저장 => 서버에 요청시 쿠키정보를 담아서 요청한다. -->
	
	<%
		
		session.setAttribute("person", new Person("서현숙",12));
		ArrayList list = new ArrayList<String>();
		
		list.add("리스트");
		list.add("set");
		list.add("map");
		
		session.setAttribute("list", list);
	%>
	
	<h2>페이지 이동된 후 session 영역의 속성 읽기</h2>
	<a href = "SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
	<p><a href = "SessionInvalidate.jsp">SessionInvalidate.jsp 바로가기</a></p>
	
</body>
</html>