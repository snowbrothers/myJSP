<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2ForwardSub.jsp</title>
</head>
<body>
	<h2>포워드 결과 확인</h2>
	
	<ul>
		<li>
			page 영역 : 
			<%=pageContext.getAttribute("pAttr") %>
			<%=request.getParameter("pAttr") %>
		</li>
		<li>
			requset 영역 : 
			<%=request.getAttribute("rAttr") %>
		</li>
	</ul>
</body>
</html>