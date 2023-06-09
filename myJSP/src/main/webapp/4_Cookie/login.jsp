<%@page import="utils.CookieManager"%>
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

	if ("Y".equals(loginErr)) {
	%>

	<script type="text/javascript">
		alert("아이디 / 비밀번호를 확인해주세요. ");
	</script>

	<%
	}
	%>

	<form action="loginAction.jsp">

		<%
		
			// 쿠키에 저장된 아이디 보여주기
			// 쿠키에 저장된 아이디가 있다면 id 필드의 value 속성에 아이디 값을 넣어줍니다.
			
			
			String userId = CookieManager.readCookie(request, "userId");
			
			
		/*
			Cookie[] cookies = request.getCookies();
			if(cookies !=null){
				
				for(Cookie cookie : cookies){
					
					if("userId".equals(cookie.getName())){
						
						userId = cookie.getValue();
						break;
						
					}
				}
			}
		*/
		
			String name = request.getParameter("name");
			if (name != null && !name.equals("")) {
				
				CookieManager.deleteCookie(response, "userId");
				
				out.print(name + "님 환영 합니다.");
				out.print("userid : " + userId);
				
			} else {
		%>



		<div class='loginbox'>



			<div id='login'>

				
					<input type="text" name="userid" id="userid"
						placeholder='ID를 입력해주세요.' required="required" value="<%=userId%>"><br>
				
				
					<input type="password" name="userpw" id="userpw"
						placeholder='PW를 입력해주세요.' required="required" maxlength="12" >
				
				<br><input type="checkbox" name="save_check" value="Y"> 아이디 저장하기

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