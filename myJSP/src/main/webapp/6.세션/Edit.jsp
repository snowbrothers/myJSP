<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

	<h2>게시글 수정하기</h2>
	
	<form name="writeFrm" method="post" action="EditProcess.jsp?num=<%=request.getParameter("num") %>"
      onsubmit="return validateForm(this);">
	<table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
            	<!-- value 값으로 기존내용을 설정하면댐. -->
                <input type="text" name="title" style="width: 90%;" />
                
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
            </td>
        </tr>
    </table>
    </form>

</body>
</html>