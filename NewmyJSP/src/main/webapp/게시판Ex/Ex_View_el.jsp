<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// num 을 파라메터로 받아온다.
	String num = request.getParameter("num");
	// 받아온 num을 사용해 게시물의 존재여부 판단
	if(num == null){
		JSFunction.alertBack("존재하지 않는 게시물 입니다.", out);
		return;
	}
	
	// dao 객체를 불러와 게시글이 클릭되면 해당 게시글의 visitcount를 +1 하는 메서드 호출
	NewBoardDao dao = new NewBoardDao();
	dao.updateVisitCount(num);
	
	// board 객체에 게시글 하나를 조회하는 메서드를 통해 변수에 담는다.
	Board board = dao.selectOne(num);
	
	
	// request 영역에 setAttribute 를 통해 설정
	request.setAttribute("board", board);
%>
<%@include file="Ex_Link.jsp" %>

<h2>Ex_게시판 상세보기</h2>
	
	<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td>${board.num }</td>
			<td>작성자</td>
			<td>${board.id }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.postdate }</td>
			<td>조회수</td>
			<td>${board.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3" height="100">
			<%=board.getContent().replace("\r\n","<br>") %>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="location.href='Ex_Edit.jsp?num=<%=request.getParameter("num")%>'">수정하기</button>
				<button type="button">삭제하기</button>
				<%
				String pageNo = "1";
				
				if(request.getParameter("pageNo") != null){
					pageNo = request.getParameter("pageNo");
				}
				%>
				<button type="button" onclick="location.href='Ex_List_el.jsp?pageNo=<%=pageNo%>'">목록 보기</button>
			</td>
		</tr>
		<tr></tr>
		
	
	</table>
	
</body>
</html>