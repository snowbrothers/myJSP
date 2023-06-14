<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<%

	JSFunction jsf = new JSFunction();
	BoardDao dao = new BoardDao();
	dao.upadateVisitCount(request.getParameter("num"));

	// 게시글 1건을 조회 후 board 객체에 담아서 반환
	Board board = dao.selectOne(request.getParameter("num"));

	if (board != null) {
	
	%>

	
	<script type="text/javascript">

		function deletePost() {
				
			var res = confirm("정말로 삭제하시겠습니까?");
			if(res){
				location.href="DeleteProcess.jsp?num=<%=board.getNum()%>"
			}

			
		}
	</script>

</head>
<body>

	<jsp:include page="Link.jsp" />

	<h2>회원제 게시판 - 상세보기</h2>
	

	<table border = 1 width="90%">

		<tr>
			<td>번호</td>
			<td><%=board.getNum()%></td>
			<td>작성자</td>
			<td><%=board.getId()%></td>
		</tr>

		<tr>
			<td>작성일</td>
			<td><%=board.getPostdate()%></td>
			<td>조회수</td>
			<td><%=board.getVisitcount()%></td>
		</tr>

		<tr>
			<td>제목</td>
			<td colspan="3"><%=board.getTitle()%></td>
		</tr>

		<tr>
			<td>내용</td>
			<td colspan="3"><%=board.getContent()%></td>
		</tr>

		<tr align="center">
			<td colspan="4">
			<input type="button" onclick="location.href='Board.jsp'" value="목록 보기">
			<% 
				// 로그인한 아이디와 글쓴이가 같으면 수정,삭제 버튼 활성화				
				if(session.getAttribute("UserId") != null 
						&& session.getAttribute("UserId").equals(board.getId())){
				
				%>
					<!-- num 을 파라메터로 가져가야함. -->
					<input type="button" value="수정하기" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">
					<input type="button" value="삭제하기" onclick="deletePost()">				
				<%
			}			
				%>
			</td>
			
		</tr>


	</table>

	<%
		} else {
		
		/*out.print("<script>");
		out.print("alert('게시글이 존재하지 않습니다.'); ");
		out.print(" history.go(-1);");
		out.print("</script>");
		*/
		
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		
		return ;

		}
	
	
	%>




</body>
</html>