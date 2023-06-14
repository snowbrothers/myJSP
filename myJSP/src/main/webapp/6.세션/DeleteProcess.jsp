<%@page import="dao.BoardDao"%>
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
		BoardDao dao = new BoardDao();
		dao.deleteBoard(request.getParameter("num"));
		
		response.sendRedirect("Board.jsp");
	%>

</body>
</html>