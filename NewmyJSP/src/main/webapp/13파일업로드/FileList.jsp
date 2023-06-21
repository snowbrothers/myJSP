<%@page import="java.util.List"%>
<%@page import="dao.FileDao"%>
<%@page import="fileUpload.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB에 등록된 파일목록 보기</title>
</head>
<body>

<%
	FileDto dto = new FileDto();
	FileDao dao = new FileDao();
	
	List<FileDto> list = dao.getFileList();
	
%> 

<h2>DB에 등록된 파일 목록 보기</h2>

	<table border="1" >
	
		<tr>
		<th >No<th>
		<th>작성자<th>
		<th>제목<th>
		<th>카테고리<th>
		<th>원본 파일명<th>
		<th>저장된 파일명<th>
		<th>작성일<th>
		</tr>
	
	<%
	if(list.isEmpty()){
		
		%>
		<tr>
		<td colspan="5" align="center">게시물이 없습니다.</td>
	</tr>
	
	<% 
	}else{
		
		for(FileDto file : list){
			%>
		<tr align="center">
			<td><%=file.getIdx()%></td>
			<!--게시물 번호-->
			<td align="center">	<%=file.getName()%></td>
			<td align="center"><%=file.getTitle()%></td>
			<!--작성자 아이디-->
			<td align="center"><%=file.getCate()%></td>
			<!--조회수-->
			<td align="center"><%=file.getOfile()%></td>
			<!--작성일-->
			<td align="center"><%=file.getSfile()%></td>
			<td align="center"><%=file.getPostdate()%></td>
		</tr>
	
	
	<%
		
			
			
		}
		}
		%>
		
		<tr>
		
		</tr>
	
	</table>

</body>
</html>