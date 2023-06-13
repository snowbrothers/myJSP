<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess</title>
</head>
<body>
<%
	// getParameter << 접근 폼에 있는 요소를 가지고온다.
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");

	MemberDao dao = new MemberDao();
	// .login << member 를 반환하고 있음
	Member member = dao.login(id, pw);
	
	if(member != null){

		// 로그인 성공 -> 세션에 member 객체를 저장
		// 세션 생성
		session.setAttribute("UserId", member.getId());
		session.setAttribute("member", member);
		
		 response.sendRedirect("Board.jsp");
	
	}else { 
		// 로그인 실패 -> loginForm 페이지로 이동
		request.setAttribute("LoginErrMsg"
						, "아이디/비밀번호가 일치하지 않습니다.");
		
		
		// LoginForm.jsp로 이동
		// request영역을 공유하기 위해 forward 사용
		request.getRequestDispatcher("LoginForm.jsp")
									.forward(request, response);
	}
	
	
	

%>


	
</body>
</html>