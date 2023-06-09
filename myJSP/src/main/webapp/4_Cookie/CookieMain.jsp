<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
			cookie 
			요청시 요청헤더에  쿠키정보를 포함하여 요청
		
			- 3000개 까지 생성 가능
			- 하나의 호스트 또는 도메인당 50개 까지 생성 가능
			- 쿠키 하나당 최대 크기 => 4096byte
			
			클라이언트의 상태 정보를 클라이언트 PC 에 저장	
			주로 로그인 아이디, 팝업쳉 제어시 사용
			
			쿠키의 속성
			
			도메인 : 쿠키를 적용할 도메인
			경로 : 쿠키를 적용할 경로
			유지기간 : 유지할 기간
	 -->

	<h2>1. 쿠키설정</h2>

	<%
	/*
		쿠키 설정
		
		new Cookie(이름, 값);
			이름 : 쿠키를 구별하는 이름
			값 	: 쿠키에 저장할 실제 데이타

	*/

	// JSP 에서 생성된 쿠키는 웹서버에서 생성되는 쿠키

	// 값에 띄어쓰기 하면안됨.
	Cookie cookie = new Cookie("myCookie", "쿠키는맛있다");

	// 쿠키가 적용될 경로 지정
	// request.getContextPath(): request객체로 부터 컨텍스트 루트 경로 조회
	cookie.setPath(request.getContextPath());

	// 쿠키가 유지될 기간 초 단위로 지정 (3600 => 1시간)
	cookie.setMaxAge(3600);
	// 응답에 쿠키를 싣어 보낸다.
	response.addCookie(cookie);

	/*

	1. 브라우저 요청
	2. 서버
	3. 브라우저 응답객체로 부터 쿠키를 브라우저에 저장
	4. 브라우저 요청
			  요청 시


	*/
	%>
	
	<h2>페이지 이동후 쿠키값 확인</h2>
	<a href="CookieResult.jsp">쿠키값 확인하기</a>


</body>
</html>