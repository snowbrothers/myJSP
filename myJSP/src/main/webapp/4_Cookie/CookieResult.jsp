<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 출력하기</title>
</head>
<body>
			
			
	<h2>쿠키값 확인하기</h2>
	<p>처음 접속시 저장된 쿠키가 없는경우 빈페이지가 출력 될 수 있습니다.</p>
			
			
	<%
		// 요청이 들어왔을 때 요청에서부터 가지고온다.	
		Cookie[] cookies = request.getCookies();
	
		
		if(cookies !=null){
			// 쿠키가 들어있음
			for(Cookie cookie : cookies){
						
				String name = cookie.getName();
				String value = cookie.getValue();
				
				out.print("쿠키명: " + name +"<br>" 
							+ "쿠키값 : " + value + "<br><br>");		
				
			}
			
		}
		
	%>
	
</body>
</html>