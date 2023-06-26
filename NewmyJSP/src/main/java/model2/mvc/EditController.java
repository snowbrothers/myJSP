package model2.mvc;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

	MVCBoardDao dao = new MVCBoardDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idx = req.getParameter("idx");
		MVCBoardDto dto =  dao.selectOne(idx);
		req.setAttribute("dto", dto); 
		
	// jsp 파일로 포워딩
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp?idx="+idx).forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idx = req.getParameter("idx");
		System.out.println("idx 출력 : " + idx);
		
		String saveDirectory = "C:/upload";
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, 1024*1000);
		
		if(mr == null) {
			
			JSFunction.alertBack(resp, "수정 저장중 오류 발생");
		}
		
		MVCBoardDto dto = new MVCBoardDto();
		
		 dto.setName(mr.getParameter("name")) ;
		 dto.setTitle( mr.getParameter("title"));
		 dto.setContent(mr.getParameter("content")) ;
		 dto.setPass(mr.getParameter("pass")) ;
		 dto.setIdx(mr.getParameter("idx"));
		 
		 String fileName = mr.getFilesystemName("ofile");
		 
		 if(fileName != null) {
			 
			 String ext = fileName.substring(fileName.lastIndexOf("."));
			 
			 String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			 String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
			 
			 String newFileName = oFileName +"_"+ now + ext;
			 
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
		 
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
		 
		 }
		
		MVCBoardDao dao = new MVCBoardDao();
		
		int res = dao.update(dto);
		
		System.out.println("수정 테스트 : " + res);
		
		if(res > 0) {
			
			JSFunction.alertLocation(resp, "../mvcboard/list.do", "작성되었습니다.");
		}else {
			JSFunction.alertBack(resp, "작성중 오류가 발생 하였습니다. <br> 관리자에게 문의해주세요.");
			
		}
		
		
		
	}
	public EditController()  {
		// TODO Auto-generated constructor stub
	}

}
