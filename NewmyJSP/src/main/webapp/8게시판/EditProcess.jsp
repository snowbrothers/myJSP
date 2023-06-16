<%@page import="dao.BoardDao"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditProcess</title>
</head>
<body>
<%@include file="../6세션/IsLogin.jsp" %>
<%
	// 필터처리를 이용한 한글 수정
	
	String title =  request.getParameter("title");
	String content = request.getParameter("content");
	String num =  request.getParameter("num");
	
	String id = session.getAttribute("UserId").toString();
	
	Board board = new Board(num, title, content, id, "", "");
	BoardDao dao = new BoardDao();
	
	int res = dao.update(board);
	
	if(res > 0){
		JSFunction.alertLocation("수정되었습니다", "View.jsp?num"+num, out);
	}
%>

</body>
</html>