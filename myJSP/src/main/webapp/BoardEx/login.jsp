<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
 	
	<form action="LoginAction.jsp" method="post" name="loginForm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" required="required"/><br>
		패스워드 : <input type="password" name="user_pw" required="required"/>
		<input type="submit" value="로그인"/>
	</form>

</body>
</html>