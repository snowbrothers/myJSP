<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Literator</title>
</head>
<body>

<%
	ArrayList<String> person = new  ArrayList<>();
	person.add("알라딘");
	person.add("라푼젤");
	person.add("지니");
	person.add("품바");
	person.add("코코");
	
	// 반복자 
	Iterator<String> iterator = person.iterator();
	
	while(iterator.hasNext()){
		
		String str = iterator.next();
		out.println(str + "<br>");
	}
	
	
	
%>
	<h2>for 문사용</h2>
	
<%
	for(String str : person){
		
		out.println(str);
		
	}


%>
</body>
</html>