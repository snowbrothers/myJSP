package model2.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{

	MVCBoardDao dao = new MVCBoardDao();
	
	// service 에서 doget 호출
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 리스트 조회
		List<MVCBoardDto> list = dao.getList();
		
		// request영역에 저장
		req.setAttribute("list", list);
		
	
		
		
		
		// 총건수 출력
		int totalCnt = dao.totalCnt();
		
		req.setAttribute("totalCnt", totalCnt);
		
		System.out.println("총 게시물수 :" + totalCnt);
		
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
	
	}
	
	public ListController() {
		
	}

}
