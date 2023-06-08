<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	
		
	<%
		
		// 사용자의 요청정보를 담고있는 request 
		// 요청에 따라 어떤 페이지를 보여줄지 설정할 수 있다.
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pwd");
	
		out.print("id : " + id + "<br>");
		out.print("pw : " + pw + "<br>");
		
		
		// 아이디가 abc, 비밀번호가 123
		// id != null && id.equals("abc")
	
		if(id.equals("abc") && pw.equals("123")){
	
			/*
				response객체 : 요청에 대한 응답을 웹페이지로 보내주는 역할
				
				1. 페이지이동 
				
				- redirect 
					웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
					웹 브라우저로 부터 새로운 요청을 받게 되므로 기존 요청정보가 사라짐.
					
					[사용방법]
					response.sendRedirect("페이지주소");
			
			
				
			
			*/
			
			response.sendRedirect("ResponseWelcome.jsp");
			
			
			
		
			
			
		}else{
			
			/*
			
				2. 페이지이동
				
					- foward 
						다른 JSP 페이지로 요청처리를 전달
						(사용자의 요청정보가 공유됨 !  !  !)
						반환되는 페이지에서 이전 요청에 대한 정보를 사용 할 수 있습니다.
						
						
						[사용방법]
						request.getRequestDispatcher("페이지주소")
							.forward(request, response)
			
							
			*/
			
			out.print("로그인 실패");
			// response.sendRedirect("ResponseMain.jsp?loginErr=Y");
			
			RequestDispatcher rd = request.getRequestDispatcher("ResponseMain.jsp");
			rd.forward(request, response);
			
			// 사용자로부터 전달받은 request객체가 공유 되므로
			// 아이디를 바로 출력 할 수 있다. (redirect시 null 출력)
			
			
			
			
		}
		%>
		 
	


</body>
</html>