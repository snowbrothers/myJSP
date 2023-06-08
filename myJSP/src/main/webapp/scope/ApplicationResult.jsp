<%@page import="java.util.Set"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>

	<%
		// 서버와 함께 실행되고 제거된다.
	
		Map<String, Person> maps 
			= (Map<String,Person>)application.getAttribute("maps");
	
		
		// keySet() : 키의 집합을 set타입으로 반환한다.
		Set<String> keys =  maps.keySet();
		
		
		// map은  key, value 가 함께 저장되는 컬렉션 타입
		// get(key) : 키 값을 이용하여 value 값을 반환 받는다.
		for(String key : keys){
			
			Person p = maps.get(key);
			out.print(p.getName()+"/"+ p.getAge()+"<br>");
		}
	
	%>


	
	

</body>
</html>