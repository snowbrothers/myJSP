<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exeUpdate</title>
</head>
<body>

	<h2>회원가입</h2>


	<%
	
	Member member = new Member("id", "pw", "이름", "");
	MemberDao dao = new MemberDao();
	
	int res = dao.insert(member);
	
	if(res>0){
		out.print(res +"건 회원가입 되었습니다.");	
	} else {
		out.print("입력 실패");
	}
	
	
	
	%>

</body>
</html>