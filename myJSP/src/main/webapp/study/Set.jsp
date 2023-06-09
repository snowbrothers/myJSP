<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Set<String> person = new HashSet<>();
	person.add("알라딘");
	person.add("라푼젤");
	person.add("지니");
	person.add("품바");
	person.add("코코");
	
	// 반복자 
	Iterator<String> iterator = person.iterator();
	
	while(iterator.hasNext()){
		
		
		out.println("str : " +  iterator.next());
	}
	
	
	
%>
	<h2>for 문사용</h2>
	
<%
	for(String str : person){
		
		out.println("str : " +  str);
		
	}


%>



</body>
</html>