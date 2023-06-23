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
		
		// 게시물 조회
		MVCBoardDto view = dao.selectOne(req.getParameter("idx"));
		
		// 조회된 게시물 저장(request 영역에)
		req.setAttribute("dto", view);
		
		// 경로가 잘못됬었음
		// View.jsp 페이지로 포워딩
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
		
		
	}
	
}
