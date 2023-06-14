<%@page import="dto.Board"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditProcess</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	BoardDao dao = new BoardDao();
	Board board = new Board();
	String num = request.getParameter("num");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	dao.EditWrite(title, content, num);
		
	JSFunction.alertLocation("게시글이 수정되었습니다."+num, "View.jsp?num="+num, out);
	
%>


</body>
</html>