<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection-Test</title>
</head>
<body>

	<%
		// application << 내장객체
		// 서버의 실행과 동시에 생성.
	
		Connection conn = ConnectionUtil.getConnection(application);
	
		PreparedStatement psmt =
					conn.prepareStatement("SELECT SYSDATE FROM DUAL");
		
		ResultSet rs = psmt.executeQuery();
		
		rs.next();
		out.print(rs.getString(1));
	
	
	%>

</body>
</html>