<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록보기</title>
</head>
<body>

	<h2>MVC 모델2 게시판</h2>
	
	<c:set var="fileList" value="${requestScope.list }"/>
	
	총건수 : ${requestScope.totalCnt }
	<!-- 검색창 -->
	
	<input type ="text" name ="pageNo">

	<form method="get" name="searchForm">
	<table border="1" width="90%">
	<!--  페이지번호 -->
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title" >제목</option>
					<!-- searchField 유지.. 검색할 당시 선택한 searchField 가 유지되도록 설정. -->
					<option value="content" ${param.searchField eq "content" ? "selected" : "" }>내용</option>
					<option value="name" ${param.searchField eq "name" ? "selected" : "" }>작성자</option>
				</select>
				<input type="text" name="searchWord" value="${param.searchWord }"/>
				<input type="submit" value="검색하기"/>
			</td>
		
		</tr>
	</table>
	</form>
	
	<table border="1" width="90%">
	
	<tr>
		<th width="5%">일련번호</th>
		<th width="10%">작성자</th>
		<th>제목</th>
		<th> 내용</th>
		<th>작성일</th>
		<th>원본 파일명</th>
		<th>저장된 파일명</th>
		<th>다운로드 횟수</th>
		<th>조회수</th>
	</tr>
	
	
	<c:if test="${empty fileList}" var="result">
	<tr >
	<td align="center" colspan="9">조회된 데이터가 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach items="${fileList}" var="fileDto" >
	
	
	<tr>
		<td>${fileDto.idx }</td>
		<td>${fileDto.name }</td>
		<td><a href="${pageContext.request.contextPath}/mvcboard/view.do?idx=${fileDto.idx}">${fileDto.title }</a></td>
		<td>${fileDto.content }</td>
		<td>${fileDto.postdate }</td>
		<td>${fileDto.ofile }</td>
		<td>${fileDto.sfile }</td>
		<td>${fileDto.downcount }</td>
		<td>${fileDto.visitcount }</td>
		
	</tr>
	</c:forEach>
	
	<tr  >
		<td colspan="9" align="center">
		
		<input type="button" value="글쓰기" onclick="location.href='../mvcboard/write.do'">
		</td>
	</tr>
	
	</table>
	
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<%@include file="../9페이지/PageNavi.jsp" %>
			</td>
		</tr>
	</table>
	
	
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<jsp:include page="../9페이지/PageNavi.jsp">
				
				<jsp:param name="pageDto" value="${requestScope.pageDto }" />
				</jsp:include>
			</td>
		</tr>
	</table>
	<!-- jsp include 방식의 경우 파라메터를 추가해줘야함. -->
	
	
</body>
</html>