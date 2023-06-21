<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt1</title>
</head>
<body>

<!-- 
	formatNumber
	
		value :
		출력할 숫자를 설정.
		
		type :
		출력 양식을 설정. percent(퍼센트), currency(통화), number(일반 숫자, 기본값) 등을 지원
		
		var : 
		출력할 숫자를 변수에 저장. 해당 속성 사용 시 즉시 출력되지 않고, 원하는 위치에 출력 가능
		
		groupingUsed : 
		세 자리마다 콤마를 출력할지 여부를 결정. 기본값은 true
		
		pattern : 
		출력할 숫자의 양식을 패턴으로 지정
		
		scope : 
		변수를 저장할 영역을 지정
	
 -->
 
 <c:set var="num" value="12345"/>
 
 	<!-- 기본값이 true 이기때문에 기본적으로 3자리 콤마 출력 -->
 	<h4>숫자 포맷 설정</h4>
 	
 	세자리 콤마 출력 : <fmt:formatNumber value="${num }" /><br>
	세자리 콤마 미출력 : <fmt:formatNumber value="${num }" groupingUsed="false"/><br>
	
	<!-- 원 기호가 붙어서 나옴 , 금액 \ -->
	변수에 저장 <fmt:formatNumber value="${num }" var="saveVar" type="currency"></fmt:formatNumber>
	변수에 저장된 값 출력 : ${saveVar }<br>
	
	퍼센트 : <fmt:formatNumber value="0.03" type="percent"></fmt:formatNumber>
	
	
	<h4>패턴을 지정하여 숫자를 활용</h4>
		
	<c:set var="num1" value="12345.0111"/>
	
	0표현 : 해당 자리에 수가 없으면 0으로 표시 - 자리수 맞춰서 출력 하고싶을 떄
	#표현 : 해당 자리에 수가 없으면 #으로 표시 		
		
	<fmt:formatNumber value="${num1 }" /><br>		
	<fmt:formatNumber value="${num1 }" pattern="0,00.0"/><br>
	<fmt:formatNumber value="${num1}" pattern="0,00.0"/><br>	
	<fmt:formatNumber value="${num1 }" pattern="0,000,00.0"/><br>
	<fmt:formatNumber value="${num1 }" pattern="#,##.##"/><br>
	<fmt:formatNumber value="${num1 }" pattern="###,###,000000"/><br>
	
	<fmt:parseNumber value="${num1 }" integerOnly="true" var="saveVar"></fmt:parseNumber>
	정수 부분만 : ${saveVar }
		

	<h4>날짜 포맷</h4>
	<c:set var="today" value="<%=new Date() %>"></c:set>
	
	<fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="default"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>
	
	
	
	<fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="default"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
			
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="short"/><br>
	
	<h4>pattern 지정후 출력</h4>			
	<fmt:formatDate value="${today }" type="both"
			pattern="yyyy-MM-dd hh:mm:ss"/>
			
			
	<h4>타임존 설정</h4>
	<!-- 세계협정시(GMT, 대한민국보다 9시간 빠름 -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
					timeStyle="full"/><br>
	</fmt:timeZone>					
	
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
					timeStyle="full"/><br>
	</fmt:timeZone>
	
	<h4>로케일 설정</h4>
	
	<c:set var="today" value="<%= new java.util.Date() %>"/>
	
	한글로 설정 : <fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber value="10000" type="currency"/>
	<fmt:formatDate value="${today }"/><br>
	
	일어로 설정 : <fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="10000" type="currency"/>
	<fmt:formatDate value="${today }"/><br>
	
	영어로 설정 : <fmt:setLocale value="en_US"/>
	<fmt:formatNumber value="10000" type="currency"/>
	<fmt:formatDate value="${today }"/><br>
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>