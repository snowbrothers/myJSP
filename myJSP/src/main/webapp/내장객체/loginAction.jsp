<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

		<!-- html 문서 안에 자바코드를 포함하고 있음. -->	

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		// 값 받아와서 변수에 저장 후 재사용
		// name 속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환합니다.
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		if("admin".equals(id) && "123".equals(pw)){
			
			// 페이지 설정가능
			response.sendRedirect("login.jsp?name="+id);
			
		}else {
			out.print("로그인 실패");
			response.sendRedirect("login.jsp?loginErr=Y");
		}
	
	%>


</body>
</html>