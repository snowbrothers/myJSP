<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionLocation</title>
</head>
<body>

	<%
		
		// 웹 브라우저를 닫고 다시 실행하게 되면 기존의 세션과 연결되지 않아 >> 쿠키에 저장된 세션 ID 값이 변경된다. 세션 유지 X ! 
		// 객체가 존재하지 않는다고 출력된다.
		
		if(session.getAttribute("person") != null){
			Person p = (Person)session.getAttribute("person");
			out.print(p.getName()+",");
			out.print(p.getAge());
		} else {
			
			out.print("session에 저장된 person객체가 이 없습니다.");
			
		}
	
	
	
	
	%>
	
	<%
	
		if(session.getAttribute("list") != null){
			
			ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
			
		for(String str : list){
			
			out.print(str + "<br>");
		}
		
		}
	
	%>


</body>
</html>