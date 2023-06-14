<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_id");
		
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		if(member != null){
			
			// 로그인 성공 
			session.setAttribute("userId", member.getId());
		
		}else{
			request.setAttribute("LoginErrMsg"
					, "아이디/비밀번호가 일치하지 않습니다.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	
			
	%>

</body>
</html>