<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="utils.CookieManager"%>
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
	
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	String saveYN = request.getParameter("save_check");
	
	
	// 체크박스가 체크되었을 경우, 아이디를 쿠키에 저장한다.
	if("Y".equals(saveYN)){
			
		CookieManager.makeCookie(response, "userId", id, 60*60*24*7);
		
	}
	
	
	/*
	
		MemberDao.login() :
			아이디 비밀번호가 일치하는 사원이 있으면 Member객체를 반환 하고
			없으면 null 을 반환
		
	*/
	
	if (member !=null && !member.equals("")) {
	
		// 로그인 성공
		// 세션에 저장
		session.setAttribute("id", id);
		//response.sendRedirect("gogreen.jsp?name="+id);
		
		out.print(id + "님 환영합니다.");
		//response.sendRedirect("login.jsp");
		
		
	
	} else {
		
		out.print("아이디 / 비밀번호를 확인해주세요.");
		// 로그인 실패
		response.sendRedirect("login.jsp?loginErr=Y");
	}
	
%>
</body>
</html>