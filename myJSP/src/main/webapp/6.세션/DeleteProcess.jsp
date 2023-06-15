<%@page import="common.JSFunction"%>
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
		int res = dao.deleteBoard(request.getParameter("num"));
		
		if(res > 0){
			JSFunction.alertLocation("게시글이 삭제되었습니다.", "Board.jsp", out);
		}else{
			JSFunction.alertBack("게시글 삭제중 오류가 발생하였습니다.", out);
		}
		
	%>

</body>
</html>