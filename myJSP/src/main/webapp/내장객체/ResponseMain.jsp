<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>1. 로그인 폼</h2>
   
   <%
   
   String err = request.getParameter("loginErr");
   
   // if(err != null && err.equals("Y")  ){
   if("Y".equals(err)){
	
	   %>
	 
	 <script type="text/javascript">
	 	alert("아이디 / 비밀번호를 확인해주세요");
	 </script>
	 
	   <% 
   }
   %>
   
   
   	<!--  ./ : 내가 지금 있는 위치를 기준으로.. 찾는다. -->
   		
    <form action="./ResponseLogin.jsp" method="post" >
        아이디 : <input type="text" name="user_id"  required="required" value="<%=request.getParameter("user_id")%>"/><br />
        패스워드 : <input type="text" name="user_pwd" required="required" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>
</html>
