<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
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
	// 제목, 내용을 검색한 결과를 파라메터로 넘겨받아 변수에 저장한다.
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 페이징 처리
	
	int pageNo = request.getParameter("pageNo") == null 
				? 1 : Integer.parseInt(request.getParameter("pageNo"));
	
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	
	// dao호출
	NewBoardDao dao = new NewBoardDao();
	
	List <Board> list = dao.getListPage(criteria);
	int totalCnt = dao.getTotlaCnt(criteria);
	
	out.print("총 건수 : " + totalCnt);
	
	pageContext.setAttribute("list", list);
%>
</body>
<%@include file="Ex_Link.jsp" %>
	<h1>Study-Board</h1>
	<h2>리스트 목록 출력</h2>
	
	<form method="post" name="searchForm">
	
	<!-- 현재 내가 어떤 페이지를 열고 있는지 출력 -->
	<input type="text" name ="pageNo" value="<%=criteria.getPageNo() %>">
	<table border="1" width="90%">
	<tr >
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="title">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색"/>
		</td>
	</tr>
	</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!-- 목록 내용 출력 -->
		
	<%
		// 만약에 리스트가 비어있으면..	
		if(list.isEmpty()){
	%>
	
		<tr>
			<td colspan="5" align="center">게시물이 없습니다.</td>
		</tr>
		
	
	<%			
		} else { 
			
			for(Board board : list){
				
	%>
		<tr align="center">
			<td><%=board.getNum() %></td>	<!-- 게시물 번호 -->
			<td>
			<a href="Ex_View_el.jsp?num=<%=board.getNum() %>&pageNo=<%=criteria.getPageNo() %>">
			<%=board.getTitle() %></a>
			 <!-- 제목 -->
			<td><%=board.getId() %></td> <!-- 작성자 -->
			<td><%=board.getVisitcount() %></td> <!-- 조회수 -->
			<td><%=board.getPostdate() %></td> <!-- 작성일 -->
		
		
		</tr>		
			
			
			<%
			}
		}
	%>		
	</table>
	<!-- 글쓰기 버튼 -->
	<%
	// 로그인 되어 있을때..
	if(session.getAttribute("UserId") != null
		&& !"".equals(session.getAttribute("UserId"))){
		
		%>
	
	<table border="1" width="90%">
		<tr align="right">
			<td><button type="button"
					onclick="location.href='../6세션/Write.jsp'">글쓰기</button></td>
		</tr>
	</table>		
		
		<%
	}
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</html>