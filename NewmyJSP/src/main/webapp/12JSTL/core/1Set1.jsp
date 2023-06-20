<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1Set1.jsp</title>
</head>
<body>
	
	<!-- 
		
		JSTL(JSP Standard Tag Library)
			JSP 의 표준 태그라이브러리를 이용하면 스크립틀릿을 사용하지 않고
			태그를 사용하여 제어문, 반복문 등을 사용 할 수 있습니다.
			
			!! 기본태그가 아닌 확장태그 이므로 사용하기 위해서는 별도의 라이브러리가 필요합니다.
			
			< JSTL 종류 >
				Core 태그 		: 변수선언, 조건문/반복문, URL처리
				접두어			: c
				
				Formatting 태그	: 숫자, 날짜, 시간 포맷 지정
				접두어			: fmt
				
		
		JSTL을 사용하기 위한 설정
		1. 라이브러리 추가
		2. taglib 지시어 추가 -> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>				
	 
	 
	 -->
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	 <!-- 
	 
	 	    set 	: EL에서 사용할 변수를 설정. setAttribute(  ) 메서드와 동일한 기능
			remove 	: 설정한 변수를 제거. removeAttribute(  ) 메서드와 동일한 기능
			if 		: 단일 조건문을 주로 처리. else문이 없다는 단점
			choose 	: 다중 조건을 처리할 때 사용. 하위에 when~otherwise 태그가 있음
			forEach	:			반복문을 처리할 때 사용. 일반 for문과 향상된 for문 두 가지 형태로 사용
			forTokens : 구분자로 분리된 각각의 토큰을 처리할 때 사용. StringTokenizer 클래스와 동일한 기능.
			import 	:  	외부 페이지를 삽입할 때 사용
			redirect : 지정한 경로로 이동. sendRedirect(  ) 메서드 동일한 기능
			url 	:  경로를 설정할 때 사용
			out  	: 내용을 출력할 때 사용
			catch 	: 예외 처리에 사용
	  -->
	
	<!-- 
		1. 변수 선언 
	
			var 	: 변수명
			value	: 값
			scope	: 저장영역 ( 지정하지 않으면 가장 가까운 영역에 저장됨 ) 
	
	-->
	
	<c:set var = "directVar" value = "100" />
	<c:set var = "elVar" value = "${directVar mod 5}" />
	<c:set var = "expVar" value = "<%=new Date() %>" />
	<c:set var = "betweenVar">변수값 요렇게 설정</c:set>
	
	<h4>EL을 사용해 변수 출력</h4>
	
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweenVar : ${ betweenVar }</li>
	</ul>
	
	<h4>자바빈즈 생성1 - 생성자 사용</h4>
	<c:set 	var ="personVal1" 
			value ='<%=new Member("id","","음바페","") %>'
			scope ="request"></c:set>
			
	<ul>
		<li>${requestScope.personVal1.id }</li>
		<li>${requestScope.personVal1.name }</li>
	</ul>			
	
	<h3>자바빈즈 생성후 값을 변경하기</h3>
	<h4>자바빈즈생성 2 - target, property 사용</h4>
	
	<!-- 
		자바빈즈 생성 후 값을 변경.
		target		: 자바빈즈 변수명
		property	: 자바빈즈 속성명(멤버변수명)
		value		: 값지정
	
	 -->
	 <c:set var ="personVal2" 
			value ='<%=new Member("holy","","홀리","") %>'
			scope ="request"/>
	 
	 <ul>
	 	<li>변경전 이름 : ${ requestScope.personVal2.name }</li>
	 	<li>변경전 아이디 : ${ requestScope.personVal2.id }</li>
	 </ul>
	 
	 <!-- EL 태그를 이용하여 값을 넣어주어야함. -->
	 <c:set target ="${personVal2}" property ="id" value ="dia"></c:set>
	 <c:set target ="${personVal2}" property ="name" value ="디아"></c:set>
	 
	 
	 <ul>
	 	<li>변경후 이름 : ${ requestScope.personVal2.name }</li>
	 	<li>변경후 아이디 : ${ requestScope.personVal2.id }</li>
	 </ul>
	 
	 <h4>List 컬렉션 이용하기</h4>
	 
	 <%
	 	ArrayList<Member> list = new ArrayList<Member>(); 
	 	list.add(new Member("mac","","맥도날드",""));
	 	list.add(new Member("lot","","롯데리아",""));
	 %>
	 
	 <c:set var = "pList" value ="<%=list %>" scope = "request"/>
	 
	 <ul>
	 	<li> 이름 : ${ pList[0].name }</li>
	 	<li>아이디 : ${ requestScope.pList[0].id }</li>
	 </ul>
	 
	 <ul>
	 	<li> 이름 : ${ pList[1].name }</li>
	 	<li>아이디 : ${ requestScope.pList[1].id }</li>
	 </ul>
	 
	 <%
	 	Map<String, Member> map = new HashMap<String, Member>();
	 	map.put("pArgs1", new Member("1","","일번",""));
	 	map.put("pArgs2", new Member("3","","삼번",""));
	 %>
	 
	 <h4>Map 컬렉션 이용하기</h4>
	 <c:set var="map"  value="<%=map %>" scope="request"/>
	 
	 <ul>
	 	<li>이름 		: ${ map.pArgs1.name }</li>
	 	<li>아이디 	: ${ requestScope.map.pArgs1.id } </li>
	 </ul>
	 
	 
	 <ul>
	 	<li>이름 		: ${ map.pArgs2.name }</li>
	 	<li>아이디 	: ${ requestScope.map.pArgs2.id } </li>
	 </ul>
	 
</body>
</html>