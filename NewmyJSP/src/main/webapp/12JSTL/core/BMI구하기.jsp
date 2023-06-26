<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - BMI 구하기</title>
</head>
<body>

	<h2>BMI 계산하기</h2>
	<ul>
		<li>bmi < 18.5 : 저체중</li>
		<li>bmi >= 18.5 ~ 22.9 : 정상체중</li>
		<li>bmi >= 23 ~ 24.9 : 과체중</li>
		<li>bmi >= 25 ~ 29.9 : 비만</li>
		<li>bmi >= 30 : 고도비만</li>
	</ul>
	
	

	<form action="">
		키(m) 	 : <input type="text" name="height"><br> <!-- 키 -->	
		몸무게(kg) : <input type="text" name="weight"> <!-- 체중 -->
	
		<input type="submit" value="계산하기">
	</form>
	
	<!-- 계산식 
		(체중 / 키 )/키 
		
	 -->
	weight : ${param.weight}
	 height : ${param.height}
	 
	 <c:set var="weight" value="${param.weight}"/>
	 <c:set var="height" value="${param.height}"/>
	 
	 <c:set var="bmi" value="${(weight/height)/height }"/><br> <!-- bmi -->
	 BMI : <input type="text" value="${bmi }">
	 
	 <c:choose>
    <c:when test="${bmi < 18.5 }">저체중</c:when>
    <c:when test="${bmi >= 18.5 && bmi <= 22.9 }">정상체중</c:when>
    <c:when test="${bmi >= 23 && bmi <= 24.9 }">과체중</c:when>
    <c:when test="${bmi >= 25 && bmi <= 29.9 }">비만</c:when>
    <c:otherwise>고도비만</c:otherwise>
</c:choose>
</body>
</html>