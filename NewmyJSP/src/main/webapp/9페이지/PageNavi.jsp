<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
	PageDto객체를 가지고 페이지 블럭을 생성
	- 페이지블럭의 시작번호
	- 페이지블럭의 끝번호
	- 게시물의 끝 페이지 번호
	- 이전 버튼을 출력할지 여부
	- 다음 버튼을 출력할지 여부
-->

	<!-- 영역에 저장 -->
	<c:set var="pageDto" value="<%=pageDto%>"></c:set>

	<c:if test="${pageDto.prev }">
		<a href='List.jsp?pageNo=${pageDto.startNo-1 }'>이전</a>

	</c:if>

	<c:forEach begin="${pageDto.startNo}" end="${pageDto.endNo }"  var="i">
		<a href='List.jsp?pageNo=${i }}'> ${i} </a>
	</c:forEach>
	
	<!-- 다음버튼 -->
	<c:if test="${pageDto.next }">

		<a href='List.jsp?pageNo=${pageDto.endNo+1 }'>다음</a>

	</c:if>

	<%
	/*
	// 총게시물수, 검색조건(페이지번호, 페이지당게시물수, 검색어, 검색조건)
	int pageNo=request.getParameter("pageNo")==null
			? 1 :Integer.parseInt(request.getParameter("pageNo"));

	// totalCnt, pageNo를 세팅 해줘야함!!!!!!!!!!!!!!!!
	int totalCnt = 305;
	Criteria criteria = new Criteria(pageNo);

	PageDto pageDto = new PageDto(totalCnt, criteria);
	*/
	
	/*
	if (pageDto.isPrev()) {
		// 시작페이지번호가 1보다 큰경우 이전버튼을 출력
		out.print("<a href='List.jsp?pageNo=" + (pageDto.getStartNo() - 1) + "'>");
		out.print("<");
		out.print(" </a>");
	}
	for (int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++) {
		out.print("<a href='List.jsp?pageNo=" + i + "'>");
		out.print(i);
		out.print(" </a>");
	}
	if (pageDto.isNext()) {
		// 마지막번호가 게시물의 끝페이지 번호와 일치하지 않으면
		out.print("<a href='List.jsp?pageNo=" + (pageDto.getEndNo() + 1) + "'>");
		out.print(">");
		out.print(" </a>");
	}*/
	%>


</body>
</html>




















