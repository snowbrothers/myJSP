<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- form : 서버에 페이지를 요청한다. -->
	<!--  action = "요청할 페이지"  -->
	
	<%
		
		String loginErr = request.getParameter("loginErr");
	
		if("Y".equals(loginErr)){
			%>		
		
			<script type="text/javascript">
			alert("아이디 / 비밀번호를 확인해주세요. ");
			</script>
			
			<%
		}
		 %>
	
	<form action="loginAction.jsp"> 
	
	<%
	String name	= request.getParameter("name");
		if(name != null && !name.equals("")){
			
			out.print(name + "님 환영 합니다.");
		
		}else{
			%>		
		
	
	
	<div class='loginbox'>
	
	
		
					<div id='login'>

					<p><input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.'></p> 
					<p><input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'></p>

						</div>
					<div id='button'>
						<input type="submit" value="로그인">
					
				</div>
		</div>
	<div id='info'>
		<a href="">회원가입</a> <a href="">ID찾기</a> <a href="">PW찾기</a>
	</div>
	
	<%
	}
	%>
	</form>

</body>
</html>