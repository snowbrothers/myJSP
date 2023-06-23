package model2.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		// mode : 수정; 삭제
		// req.setAttribute("mode", req.getParameter("mode"));
		// req.setAttribute("idx", req.getParameter("idx"));
		
		
		
		req.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(req, resp);
		
		
		
	}
	
	// 하나의 페이지에서 두가지 요청 해결.
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mode = req.getParameter("mode"); // 삭제, 수정 값
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		MVCBoardDao dao = new MVCBoardDao();
		
		// 게시글의 비밀번호가 일치하는지 확인한다.
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		// 비밀번호 체크 성공
		if(confirmed) {
			
			System.out.println("비밀번호 확인 ! ");
			
			if(mode.equals("edit")) {
				
				//req.getRequestDispatcher("/mvcboard/edit.do").forward(req, resp);
				resp.sendRedirect("../mvcboard/edit.do?idx="+idx);
			}else if(mode.equals("delete")) {
				
				int res = dao.delete(idx);

				if(res > 0) {

					JSFunction.alertLocation(resp
											,"../mvcboard/list.do",
											"삭제 성공");
					
				}else {
					
					JSFunction.alertBack(resp, "게시물 삭제 실패.");
					
				}
				
			}
			
		} else {
			// 비밀번호 체크 실패
			// 메세지 처리 후 이전화면으로.
			JSFunction.alertBack(resp, "비밀번호 검증에 실패 하였습니다.");
		}
		
		
		
		
		
		
		// 삭제메서드 호출
		
	}
	
	public PassController() {
		// TODO Auto-generated constructor stub
	}

}
