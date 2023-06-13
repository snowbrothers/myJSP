<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Instant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션메인</title>
</head>
<body>
	<!-- 
		Session 
		: 클라이언트의 상태 정보를 저장한다.
		
		클라이언트에서 서버로 페이지 요청 -> 서버는 페이지를 응답.
		
		웹서버는 웹브라우저에게 세션아이디를 발급
		-> 세션 아이디는 쿠키로 생성 응답객체의 쿠키에 담겨 클라이언트로 전송
			JSESESSIONID << 
		
	 -->

	<%
	
		session.setMaxInactiveInterval(100);	
	
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");  // 날짜 표시 형식
		long creationTime = session.getCreationTime(); //세션의 최초 요청시간을 알 수 있음
		
		String creationTimeStr = sdf.format(new Date(creationTime));
		
		long lastTime = session.getLastAccessedTime();
		
		String lastTimeStr = sdf.format(new Date(lastTime));
	%>

	<h2>Session 설정 확인</h2>
	<ul>
	
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>마지막 요청 시각 : <%=lastTimeStr %></li>
		
		<!-- 새로고침 할때마다 새로 갱신되는 마지막 시각 -->
		
		<li>세션 아이디 : <%=session.getId() %></li>
		<li>세션 유지시간 : <%=session.getMaxInactiveInterval() %></li>
		<!-- 따로 설정하지 않으면 기본 유지시간은 30분. -->
		
	</ul>


</body>
</html>