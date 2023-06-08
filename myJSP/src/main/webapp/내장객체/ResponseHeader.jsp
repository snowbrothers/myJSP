<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader</title>
</head>
<body>
<%

	/*
		response객체는 응답 헤더에 정보를 추가하는 기능을 제공한다.
			add...() : 응답 헤더 추가
			set...() : 응답 헤더 수정
	*/
	
	String add_date = request.getParameter("add_date");
	String add_int = request.getParameter("add_int");
	String add_str = request.getParameter("add_str");


	response.addHeader("str",add_str);
	// getParameter()는 String타입을 반환 하므로
	// 숫자나 날짜 타입인 경우 형변환이 필요하다.
	response.addIntHeader("int", Integer.parseInt(add_int));
	
	/*
		문자열을 날짜 형식으로 변환한다.
	*/
	
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	// long 타입 반환 : getTime() < < 
	response.addDateHeader("date", s.parse(add_date).getTime());
	
	Collection<String> headerNames =	response.getHeaderNames();

	// 반복문 이용 컬렉션의 값을 하나씩 꺼내온다.
	
	for (String hName : headerNames){
		String hValue =  response.getHeader(hName);
		
		%>
	
			<li><%=hName%> : <%=hValue%></li>
		<%		
	}
%>
</body>
</html>