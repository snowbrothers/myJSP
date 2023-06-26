package model2.mvc;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSFunction;

public class WriteController extends HttpServlet{

	MVCBoardDao dao = new MVCBoardDao();
	
	public WriteController() {
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.sendRedirect("../14MVCBoard/Write.jsp");
		
//		String name = req.getParameter("name");
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//		String file = req.getParameter("file");
//		String passwoard = req.getParameter("password");
//		
//		MVCBoardDto dto = new MVCBoardDto("", name, title, content, file, "", "", "", passwoard, "");
//		
//		
//		req.setAttribute("write", dao.insert(dto)); 
//		
//		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String saveDirectory = "C:/upload";
		
		// 파일 업로드 :  최대 사이즈
		 MultipartRequest mr = FileUtil.uploadFile(req, "C:/upload", 1024*1000);
		
		 if(mr == null) {
			 // 파일 업로드 실패 상황
			 JSFunction.alertBack(resp, "파일 저장중 오류가 발생 하였습니다.");
			 return;
		 }
		 
		 // 파일 업로드 저장
		 // form값을 DTO에 저장
		 MVCBoardDto dto = new MVCBoardDto();
		 
		 dto.setName(mr.getParameter("name")) ;
		 dto.setTitle( mr.getParameter("title"));
		 dto.setContent(mr.getParameter("content")) ;
		 dto.setPass(mr.getParameter("pass")) ;
		 
		 
		 
		 // 원본 파일명과 저장된 파일이름 설정
		 
		// 2. 새로운 파일명 생성
		    // 	동일한 파일명이 업로드 되는 경우, 기존파일이 소실될 위험이 있으므로 파일명을 변경합니다
		    String fileName = mr.getFilesystemName("ofile");
		    if(fileName != null) {
		    	
		    	// 첨부파일의 확장자
		    	String ext = fileName.substring(fileName.lastIndexOf("."));
		    	
		    	// H : 0~23, S : millisecond
		    	// 현재시간을 파일이름으로 지정
		    	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		    	String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
		    	
		    	String newFileName = oFileName +"_"+ now + ext;
		    	System.out.println("원본파일명 : " + fileName);
		    	System.out.println("신규파일명 : " + newFileName);
		    	
		    	// 3. 파일명 변경
		    	File oldFile = new File(saveDirectory + File.separator + fileName);
		    	File newFile = new File(saveDirectory + File.separator + newFileName);
		    	oldFile.renameTo(newFile);
		    
		    	
		    	dto.setOfile(fileName); // 원본파일명
		    	dto.setSfile(newFileName); // 저장된 파일명
		    }
		 
		    MVCBoardDao dao = new MVCBoardDao();
		    int res = dao.insert(dto);
		    
		    if(res > 0) {
		
		    	JSFunction.alertLocation(resp, "../mvcboard/list.do", "작성되었습니다.");
		    }else {
		    	JSFunction.alertBack(resp, "작성중 오류가 발생 하였습니다. <br> 관리자에게 문의해주세요.");
		    	
		    }
	}
	
	
	
}
