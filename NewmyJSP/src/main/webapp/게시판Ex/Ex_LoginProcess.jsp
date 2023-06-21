<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리화면</title>
</head>
<body>
	<h2>Ex_로그인 처리화면</h2>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	if(member != null){
		
		session.setAttribute("UserId", member.getId());
		session.setAttribute("member", member);
		
		response.sendRedirect("Ex_List_el.jsp");
		
	} else {
		
		request.setAttribute("LoginErrMsg", "아이디/비밀번호를 확인해주세요.");
		
		// sendRedirect 보다 효율적인 방식
		request.getRequestDispatcher("Ex_LoginForm.jsp")
							.forward(request, response);
		
	}
%>


</body>
</html>