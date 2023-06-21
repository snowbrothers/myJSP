<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1" width="90%">
	<tr>
		<td align="center">
			<c:if test="${empty sessionScope.UserId }" var="res">
				<a href ="${pageContext.request.contextPath }/게시판Ex/Ex_LoginForm.jsp">로그인</a>
			</c:if>
			<c:if test="${not res }">
				<a href ="${pageContext.request.contextPath }게시판Ex/Ex_Logout.jsp">로그아웃</a>
			</c:if>
			
		</td>
		
	</tr>
</table>