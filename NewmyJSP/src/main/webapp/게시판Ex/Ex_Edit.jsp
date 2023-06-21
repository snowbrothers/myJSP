<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex_수정하기</title>
</head>
<body>
<% 
	NewBoardDao dao = new NewBoardDao();
	Board board = dao.selectOne(request.getParameter("num"));
%>

</body>
<h2>Ex_게시판 수정하기</h2>
<form action="Ex_EditProcess.jsp" method="post">
	<table border="1" width="90%">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width:90%"
					value="<%=board.getTitle() %>"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 100px;">
				<%=board.getContent().replace("\r\n", "<br>") %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			
			</td>
			<td></td>
			
		</tr>
	
	</table>
</form>

</html>