<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="wrap">
		<!-- header.jsp -->




		
		<%@include file="header.jsp"%>
		<main>
			<aside id='leftside'></aside>
			<div id='maincontent'>
				<ul>
					<li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
					<li><img src="images/main_img2.jpg" alt="">아이들에게 녹색
						미래를..</li>
					<li><img src="images/main_img3.jpg" alt="">설악산을 사리는 길</li>
					<li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
				</ul>
			</div>

			<aside id='rightside'>
				<div class='side1'>
					
					<%
						// 쿠키에 저장된 아이디가 있으면 아이디를 텍스트필드에  value 값으로 출력
						
					
						// <!--  비밀번호 불일치 : 메세지 처리  -->
						String loginErr = request.getParameter("loginErr");
						if("Y".equals(loginErr)){
					
							%>
							
							<script type="text/javascript">
							alert("아이디 / 비밀번호를 확인해주세요.")
							</script>
							<% 
							
						
						}
					%>
					
					<!--  로그인 성공  박스를 보여주지 않음 
                			abc님 환영합니다. << 출력
                	 -->
					<!-- 로그인 method 를  post 로 설정해서 id 와 pw 가 유출되는 것을 막아줍시다.-->
					<%
					
					/* String name = request.getParameter("name");
					
					if(name != null && name !=""){
						// 로그인되었다고 판단.
						
						out.print(name +"님 환영합니다.");
					
					}else{*/
						
						String id = (String)session.getAttribute("id");
						
						String userId = CookieManager.readCookie(request, "userId");
						
						
						
						
						if(id !=null && id != ""){
					%>		
						<% 	
							//CookieManager.deleteCookie(response, "userId");
							out.print("param : " + id + "님 환영합니다. <br>"); 
							out.print("cookie : " + userId + "님 환영합니다.");
														%>
							
							
							<!--  <button onclick ="location.href='logout.jsp'">로그아웃</button>-->
							
							   <form action="logout.jsp">
							<input type="submit" id="logout" value="logout">로그아웃
							</form>
							
						<%
						}else {
					%>
					
					<form action="LoginAction.jsp" method="post">
						
					<div class='loginbox'>
	
					<div id='login'>

					<input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' value="<%=userId%>"> 
					<input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'>

						</div>
					<div id='button'>
						<input type="submit" value="로그인">
					
				</div>
		</div>
	<div id='info'>
		<!-- 선택되었을때만 서버에 값이 전달됩니다.
			미선택시 null 출력 -->
		<input type="checkbox" name="save_check" value="Y" <%= !userId.equals("")?"checked":"" %>> 아이디 저장하기
		<!-- <a href="">회원가입</a> <a href="">ID찾기</a> <a href="">PW찾기</a> -->
	</div>
	</form>
	<%	} 	%>
	</div>
	

	<div class='side2'>
		<img src="images/right_img.jpg" alt="">
	</div>

	<div class='side3'>
		<img src="images/me_chat.jpg" alt="">
	</div>
	</aside>
	</main>

	<!-- footer.jsp -->
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>