<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page - 스코프</title>
</head>
<body>

	<!--  영역에서 값을 읽기 -->

	<%
	// 페이지 영역에 저장
	pageContext.setAttribute("page", "페이지영역(스코프)");
	pageContext.setAttribute("page_int", 10000);
	pageContext.setAttribute("pagePerson", new Person("아이유",30));
	%>
	
	<h2>page영역 속성 값 읽기</h2>
	
	<%
		// object 타입으로 반환되어 형변환이 필요
		String pageScope = pageContext.getAttribute("page").toString();
		int page_int = (Integer)pageContext.getAttribute("page_int");
		Person page_Person = (Person)pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>int : <%=page_int%></li>
		<li>String : <%=pageScope %></li>
		<li>Person : <%=page_Person.getName()%>,
					<%=page_Person.getAge() %></li>
	</ul>
	
	<h2>include 된 파일에서 page 영역 읽어오기</h2>
	<p>include지시어로 감싼 JSP 파일은 포함관계를 가지므로 같은페이지</p>
	<p>페이지 영역이 공유 됩니다.</p>
	<%@include file = "PageInclude.jsp"%>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	
	<!-- 링크를 이용해서 페이지를 다시 요청하게 되면 
	페이지 영역이 초기화 됩니다. -->
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
	

</body>
</html>