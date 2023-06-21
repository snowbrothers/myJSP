<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex_로그인폼</title>
</head>
<body>
	<h2>Ex_로그인폼</h2>
	<%@include file = "Ex_Link.jsp" %>

<%

	if(session.getAttribute("UserId") == null){
		
%>
	
	<form action="Ex_LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" required="required"/><br>
		비밀번호 : <input type="password" name="user_pw" required="required"><br>
		<input type="submit" value="로그인하기"/>
	</form>
<% } else{
	
	String name = "";
	if(session.getAttribute("member") != null){
		Member member = (Member)session.getAttribute("member");
		name = member.getName();
}
	%>	
	
	<h2><%= name%>님 환영합니다.</h2>
	
<%	
}
%>
</body>
</html>