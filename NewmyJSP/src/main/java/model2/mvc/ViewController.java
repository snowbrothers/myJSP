package model2.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



// 요청명
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	MVCBoardDao dao = new MVCBoardDao();
	
	public ViewController() {
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MVCBoardDto view = dao.selectOne(req.getParameter("idx"));
		
		req.setAttribute("view", view);
		
		req.getRequestDispatcher("View.jsp").forward(req, resp);
		
		
	}
	
}
