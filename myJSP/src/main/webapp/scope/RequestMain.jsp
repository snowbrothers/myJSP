<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain</title>
</head>
<body>


	<%
		request.setAttribute("request_str", "request영역에 문자열을 저장");
		request.setAttribute("request_person", new Person("프로도",39));
	
	%>


	<h2>request영역의 속성값 읽어오기</h2>
	
	<%
	
		// 스크립틀릿 사용시 널 오류에 유의할 것.
		String str = 	(String)request.getAttribute("request_str");
		Person person = (Person)request.getAttribute("request_person");
		String request_int = (String)request.getAttribute("request_int");
	%>
	
	
	<ul>
		
		<li>str : <%=str %></li>
		<li>person : <%=person.getName() %>,<%=person.getAge()%></li>
		<li>int : <%=request_int %></li>
	
	</ul>
	
	
	
	<h2>request 영역의 속성값 삭제</h2>
	<%
		request.removeAttribute("request_str");
		request.removeAttribute("request_int");
	%>
	
	
	request_str 삭제 : <%= request.getAttribute("request_str")%>
	
	<h2>forward된 페이지에서 request 영역 속성 값 읽기</h2>
	
	
	<%
		// forward 된 내용은 공유
		request.getRequestDispatcher("RequestForward.jsp?name=프로도&age=39")
						.forward(request, response);
	
		/*String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age")); 
	
		out.print(name);
		out.print(age);*/
	%>
	
	
	
	
</body>
</html>