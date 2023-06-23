package model2.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idx = req.getParameter("idx");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String file = req.getParameter("file");
		
		MVCBoardDto dto = new MVCBoardDto("", name, title, content, "" , file, "", "", "", "");
		
		int res = dao.update(dto);
		
	
		if(res > 0) {
			
			JSFunction.alertLocation(resp, "../mvcboard/view.do?idx='"+idx+"'", "게시물이 수정되었습니다.");
		}else {
			JSFunction.alertBack(resp, "게시물 수정이 실패하였습니다.");			
		}
		
		
	}
	public EditController()  {
		// TODO Auto-generated constructor stub
	}

}
