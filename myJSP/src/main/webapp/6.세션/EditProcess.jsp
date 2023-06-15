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

	<!-- 수정 처리화면 -->

<%
	
	request.setCharacterEncoding("utf-8");
	
	BoardDao dao = new BoardDao();
	Board board = new Board();
	
	String num = request.getParameter("num");
	
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	board.setNum(num);
	
	int res = dao.EditWrite(board);
		
	if(res > 0){
	
		JSFunction.alertLocation("게시글이 수정되었습니다."+num, "View.jsp?num="+num, out);
		
	}else{
		JSFunction.alertBack("게시글 수정중 오류가 발생하였습니다.", out);
	}
	
	
%>


</body>
</html>