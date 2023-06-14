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
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");

	BoardDao dao = new BoardDao();
	List<Board> boardList = dao.getList(searchField, searchWord);

	int totalCnt = dao.getTotalCnt(searchField, searchWord);

	// 검색어가 null 이 아니면 검색 기능을 추가 !
	// out.print("검색필드 : "+ searchField+"<br>");
	// out.print("검색어 : " + searchWord);
	%>

	<jsp:include page="Link.jsp" />
	<h2>목록보기(List)</h2>

	총 게시글 수 :
	<%=totalCnt%>

	<!-- 기본값이 get 방식. 주소표시줄에 표시된다. -->
	<form>
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord"
					value="<%=searchWord != null ? searchWord : ""%>"> <input
					type="submit" value="검색하기"></td>
			</tr>
		</table>
	</form>

	<table border="1" width="90%">


		<tr>
			<th>번호</th>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회수</td>
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
			<td> <%=board.getNum()%></td>
			<td><a href ="View.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a></td>
			<td><%=board.getId()%></td>
			<td><%=board.getPostdate()%></td>
			<td><%=board.getVisitcount()%></td>
		</tr>

		<%
		}
		}
		%>


	</table>
	<%
	if (session.getAttribute("UserId") != null) {
	%>
	<table border="1" width="90%">
		<tr>
			<td align="right"><input type="submit" value="글쓰기"
				onclick="location.href='Write.jsp'"></td>
		</tr>
	</table>
	<%
	}
	%>



</body>
</html>