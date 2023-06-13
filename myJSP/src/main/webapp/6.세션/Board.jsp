<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>

	<%
		BoardDao dao = new BoardDao();
		List<Board> boardList = dao.getList();
	
		int totalCnt = dao.getTotalCnt();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
	
		
		// 검색어가 null 이 아니면 검색 기능을 추가 !
		out.print(searchField+"<br>");
		out.print(searchWord);
		
				
		
	%>

	<jsp:include page="Link.jsp" />
	<h2>목록보기(List)</h2>

	총 게시글 수 :
	<%=totalCnt%>

	<form>
		<table border="1" width= "90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" value="<%=searchWord !=null? searchWord:"" %>"><input type="submit"
					value="검색하기">
					</td>
			</tr>
		</table>
	</form>

	<table border="1" width= "90%">


		<tr>
			<th>번호</th>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>

		<%
		if (boardList.isEmpty()) {
			// 게시글이 하나도 없을 때
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>

		<%
		} else {
		for (Board board : boardList) {
		%>

		<tr>
			<td><%=board.getNum()%></td>
			<td><%=board.getTitle()%></td>
			<td><%=board.getId()%></td>
			<td><%=board.getPostdate()%></td>
			<td><%=board.getVisitcount()%></td>
		</tr>

		<%
		}
		}
		%>


	</table>
		<table border="1" width= "90%">
			<tr>
				<td align="right">
						<input type="submit" value="글쓰기">
					</td>
			</tr>
		</table>
	
	

</body>
</html>