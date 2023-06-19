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
	/*
		표현언어 EL(Expression Language)
		: 변수의 값을 출력할 때 사용하는 스크립트 언어
		
		4가지 영역에 저장된 값을 출력하는 언어
	*/

%>

<%
	
	//-- 저장. get,setAttribute 

	// 각 영역에 저장
	pageContext.setAttribute("scopeValue", "페이지 영역");		
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션 영역"); // 로그인 할때 저장 했었음.
	application.setAttribute("scopeValue", "어플리케이션 영역");
	

%>

	 <h2>각 영역에 저장된 속성 읽기</h2>
	 
	 
	 
	 
	 <ul>
	 	<li>페이지영역 :
	 		${pageScope.scopeValue}
	 	</li>
	 	<li>리퀘스트영역 :
	 		${requestScope.scopeValue}
	 		</li>
	 	<li>세션영역 :
	 		${sessionScope.scopeValue}
	 		</li>
	 	<li>어플리케이션영역 : 
	 		${applicationScope.scopeValue}
	 		</li>
	 	
	 </ul>
	 
	 <h2>영역 지정 없이 속성 읽기</h2>
	 
	 <ul>
		<li>${scopeValue}</li> 
	 </ul>
	 
	 <jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
	 <!-- 포워드를 하면 다른 페이지로 이동하기 때문에 기존 페이지의 출력은 무시된다. -->
	 
	 

</body>
</html>