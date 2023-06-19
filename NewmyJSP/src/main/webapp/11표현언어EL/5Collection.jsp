<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5Collection</title>
</head>
<body>
	<%
	// 리스트 생성 (object로 지정 -> 어떤 타입이든지 저장 가능)	
	List<Object> aList = new ArrayList<Object>();
	aList.add("청해진");
	aList.add(new Member("test", "", "장보고", "2023-06-19"));

	// 페이지 영역에 리스트 객체 저장
	pageContext.setAttribute("aList", aList);
	%>

	<h2>List 컬렉션</h2>

	<ul>
		<li>0번째 요소 <!-- 영역을 지정 하지 않았찌만 페이지영역에 지정된 aList의 값이 출력된다. -->
			<p>${aList[0] }</p>
		</li>
		<li>1번째 요소 <!-- 객체의 주소값 -->
			<p>${aList[1] }</p>
			<p>id : ${aList[1].id }</p>
			<p>name : ${aList[1].name }</p>
		</li>
		<!-- 요소가 없더라도 오류가 발생하지 않는다. -->
		<li>2번째 요소
			<p>${aList[2] }</p>
		</li>
	</ul>

	<h2>Map 컬렉션</h2>
	<!-- Map 은 키와 값으로 설정된다. -->
	<%
		Map<String, String> map = new HashMap<String, String>();
		// 데이터 입력 put()
		map.put("한글", "집현전");
		map.put("Eng", "English");
		
		pageContext.setAttribute("map", map);
	%>
	
	<ul>
	<li>
		<p>	한글 : ${map['한글'] } </p></li>  
		<!-- 한글은 .으로 접근 불가 -->
		<!-- EL코드 주석처리 방법 : \를 붙여준다. -->
		<p><%=map.get("한글") %></p>
	<li>
		<p> 영어 : ${map.Eng }</p>
		<p><%=map.get("Eng") %></p>
	</li>
	</ul>


</body>
</html>