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
	
	<form method="get" name="searchForm">
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="name">작성자</option>
				</select>
				<input type="text" name="searchWord"/>
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
		<input type="button" value="글쓰기">
		</td>
	</tr>
	
	</table>

</body>
</html>