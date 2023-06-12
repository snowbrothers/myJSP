<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPoolTest</title>
</head>
<body>
	
	<%
	
		
		/**
		 * <Resource name="jdbc/myoracle" auth="Container"
	              type="javax.sql.DataSource" 
	              driverClassName="oracle.jdbc.OracleDriver"
	              url="jdbc:oracle:thin:@localhost:1521:orcl"
	              username="jsp" 
	              password="1234" 
	              maxTotal="20" 
	              maxIdle="10"
	              maxWaitMillis="-1"/>
		 * 
		 */
	
		 
		Connection con = DBConnPool.getConnection();
	
		PreparedStatement psmt = 
				con.prepareStatement("SELECT SYSDATE FROM DUAL");
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			out.print(rs.getString(1));
		}
		
		rs.close();
		psmt.close();
		con.close();
		
	%>
	
	

</body>
</html>