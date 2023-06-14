<%@page import="common.JSFunction"%>
<%@page import="dto.Member"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteProcess.jsp</title>
</head>
<body>

	<%@include file="IsLogin.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");

	Board board = new Board();// 빈객체 생성.

	String id = (String) session.getAttribute("UserId");

	// 1. 입력값을 받아서 DTO 객체를생성

	String title = request.getParameter("title");
	String content = request.getParameter("content");

	board.setTitle(title);
	board.setContent(content);
	board.setId(id);

	// 2. DAO.insert(...) 호출 : DB에 게시글을 등록하고 결과를 숫자로 반환한다.

	BoardDao dao = new BoardDao();
	int res = dao.insert(board);

	// 3. 등록성공 : 리스트페이지로 이동
	// 	  등록시래 : 메세지 처리
	if (res > 0) {

		JSFunction.alertLocation("게시글이 등록 되었습니다."
					, "Board.jsp"
					, out);

	} else {

		// 등록 실패
		JSFunction.alertBack("등록중 오류가 발생 하였습니다.", out);

	}
	%>







</body>
</html>