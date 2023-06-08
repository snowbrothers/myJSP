<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>

<%

	String loginYN = request.getParameter("loginYN");
	
		if(loginYN != null && loginYN.equals("N")){
	%>
		<script>
		alert("아이디/비밀번호를 확인해주세요.");
		</script>
		
	<%
	}
%>
<form action="testLogin.jsp" method="post">
	<label for ="userid">아이디 : </label>
	<input type="text" name="id" id="userid"><br>

	<label for ="userpw">암&nbsp호 : </label>
	<input type="password" name="pw" id="userpw"><br>

	<input type="submit" value="로그인">
</form>

</body>
</html>