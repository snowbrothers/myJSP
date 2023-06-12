<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

		<!-- html 문서 안에 자바코드를 포함하고 있음. -->	

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		// 값 받아와서 변수에 저장 후 재사용
		// name 속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환합니다.
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		// 아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		out.print(saveYN);
		
		// 아이디 저장하기 체크박스를 선택되었을때,
		// 쿠키에 아이디를 저장
		// userId, 사용자아이디
		if("Y".equals(saveYN)){
		// 쿠키생성하기			
		
		CookieManager.makeCookie(response, "userId", id, 3600);
		
		/*
		
		Cookie loginCookie = new Cookie("userId", id);
		
		loginCookie.setPath(request.getContextPath());
		// 유지시간 설정
		loginCookie.setMaxAge(3600);
		// 응답 객체에 담기
		response.addCookie(loginCookie); 
		
		*/
		
		}
		
		// DB 조회결과 id/pw 가 일치하는 회원이 있으면 로그인 성공
		if(member != null 
				&& !"".equals(member.getName())){
			
			// 페이지 설정가능
			response.sendRedirect("login.jsp?name="+id);
			
		}else {
			out.print("로그인 실패");
			response.sendRedirect("login.jsp?loginErr=Y");
		}
	
	%>


</body>
</html>