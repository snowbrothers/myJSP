<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<jsp:include page="Link.jsp" />
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;"> </span>


	<%
	if (request.getAttribute("LoginErrMsg") != null) {

		out.print(request.getAttribute("LoginErrMsg"));
	}
	
	%>



	<%
	
	String id = (String) session.getAttribute("UserId");

	if (id != null && id != "") {

	%>

	<%
	
	out.print("<h2>" + id + "님 환영합니다." + "</h2>");	
	
	%>

	<%
	} else {
	%>
	<!-- 1. 로그인 성공 시 로그인 폼을 화면에 보여주지 않음 
   		2. 로그인 사용자 이름과 환영합니다.
   		3 .header영역(Link.jsp)의 로그인 링크를 로그아웃으로 수정
   	-->
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" required="required" /><br />
		패스워드 : <input type="password" name="user_pw" required="required" /><br />
		<input type="submit" value="로그인하기" />
	</form>
	<%
	}
	%>
</body>
</html>