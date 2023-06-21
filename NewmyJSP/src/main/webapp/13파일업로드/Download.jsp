<%@page import="common.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download.jsp</title>
</head>
<body>
		<%
			// 업로드 파일이 저장된 경로
			String saveDirectory = "c:/upload";
			// 원본 파일이름
			String originFileName = request.getParameter("oName");
			// 저장된 파일이름
			String saveFileName = request.getParameter("sName");
			
			out.print("originFileName : " + originFileName + "<br>");
			out.print("saveFileName : " + saveFileName);
			
		try{	
			
			File file = new File(saveDirectory, saveFileName);
			out.print("file : " + file);
			
			// 파일 입력 스트림 생성
			InputStream inStream = new FileInputStream(file);
			
			
			// 한글 파일명 깨짐 방지
			String client = request.getHeader("User-Agent");
			// ie 체크
			if(client.indexOf("WOW64") == -1){
				originFileName =
							new String(originFileName.getBytes("UTF-8"), "ISO-8859-1");
			}else{
				originFileName = 
						new String(originFileName.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			
			// 파일 다운로드용 응답 헤더 설정
			response.reset();
			
			
			// 파일 다운로드 창을 띄우기 위한 콘텐츠 타입을 지정
			// octet-stream은 8비트 단위의 바이너리 데이터를 의미
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition",
								"attachment; filename=\"" + originFileName + "\"");
			
			response.setHeader("Content-Length", "" + file.length());
			
			// 출력 스트림 초기화
			out.clear();
			out = pageContext.pushBody();
			// response내장 객체로 부터 새로운 출력 스트림을 생성
			OutputStream outStream = response.getOutputStream();
			
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = inStream.read(b)) > 0 ) {
				outStream.write(b, 0, readBuffer);
				
			}
			
			// 입 / 출력 스트림 닫음;
			inStream.close();
			outStream.close();
		}catch (FileNotFoundException e) {
			JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
			
		}catch (Exception e){
			JSFunction.alertBack("파일 다운로드 중 오류가 발생 하였습니다.", out);
		}
		%>
</body>
</html>