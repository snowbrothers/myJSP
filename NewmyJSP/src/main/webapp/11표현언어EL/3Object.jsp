<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체전달</title>
</head>
<body>
	
	
	<%
		
		// request 영역에 객체를 생성후 forward 된 페이지에서 출력 해봅시다.
		request.setAttribute("personObj", new Member("test","","고길동","2023-06-19"));
		request.setAttribute("stringObj", "나는문자열객체");
		request.setAttribute("integerObj", new Integer(99));
		
		
		
	%>
	
	<h2>객체 매개변수</h2>
	
	<jsp:forward page="ObjectResult.jsp">
	<jsp:param value="10" name="firstNum"/>
	<jsp:param value="20" name="secondNum"/>		
	</jsp:forward>

</body>
</html>