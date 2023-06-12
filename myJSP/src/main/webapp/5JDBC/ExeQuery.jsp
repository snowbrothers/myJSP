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
<title>ConnectionTest</title>
</head>
<body>
	<h2>회원 목록 조회</h2>
	
	<table border= 1>
	
	<%
		Connection con = ConnectionUtil.getConnection();
		
		String sql = "SELECT ID, NAME, REGIDATE FROM MEMBER";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		
		// 쿼리 실행
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regidate = rs.getString("regidate");
			
			
			out.println(
				
					String.format("<tr> <td>%s</td> <td>%s</td> <td>%s</td> </tr>",id, name, regidate)					
					
					);
			
		}
		
		rs.close();
		stmt.close();
		con.close();

	%>
	</table>
	
</body>
</html>