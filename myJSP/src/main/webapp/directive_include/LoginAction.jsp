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
	
	if ("abc".equals(id) && "123".equals(pw)) {
		
		// 로그인 성공
		// 세션에 저장
		session.setAttribute("id", id);
		//response.sendRedirect("gogreen.jsp?name="+id);
		
		out.print(id + "님 환영합니다.");
		response.sendRedirect("gogreen.jsp");
		
		
	
	} else {
	
		out.print("아이디 / 비밀번호를 확인해주세요.");
		// 로그인 실패
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>