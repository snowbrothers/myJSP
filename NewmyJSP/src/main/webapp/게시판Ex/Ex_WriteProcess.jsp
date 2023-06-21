<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex_WriteProcess</title>
</head>
<body>
<h2>Ex_게시판 글쓰기 프로세스</h2>

	<!-- 글쓰기 페이지에서 form 태그를 통해 넘어온 파라메터를 변수에 저장해 board 객체에 담는다 -->
	<%@include file = "../6세션/IsLogin.jsp" %>
	<%@include file = "Ex_Link.jsp" %>
	<% 
		Board board = new Board();
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setId(session.getAttribute("UserId").toString());
	
		NewBoardDao dao = new NewBoardDao();
		int res = dao.insert(board);
		
		// 입력되었으면 .insert 메소드의 반환값으로 숫자가 반환됨 
		if(res>0){
			// 입력 성공시
			JSFunction.alertLocation("글이 작성되었습니다.", "Ex_List_el.jsp", out);

		} else {
			JSFunction.alertBack("글작성 도중 오류가 발생 하였습니다.", out);
		}
		
		
	%>
</body>
</html>