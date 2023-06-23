package model2.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
}
