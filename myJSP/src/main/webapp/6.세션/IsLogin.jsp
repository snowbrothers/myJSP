<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>


	
	<%
		if(session.getAttribute("UserId") == null){
		%>
		
			<script type="text/javascript">
				alert("로그인 후 이용 가능한 메뉴 입니다.");
				location.href = "LoginForm.jsp";
			</script>
		
		<%	
		}
	%>

</body>
</html>