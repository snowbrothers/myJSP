package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// HttpServletRequest : request의 클래스이름
		// HttpServletResponse : response 클래스이름
		
		// request 영역에 값 저장 
		// 포워드
		req.setAttribute("message", "서블릿 호출 !");
//		PrintWriter out = resp.getWriter();
//		out.print("서블릿 호출 ! ! !");
//		
		// request영역이 공유가 안됨
		// resp.sendRedirect("HelloServlet.jsp");
		
		// forward : request 영역이 공유된다.
		// 보통 request영역에 객체를 공유한다.
		 req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}

	public HelloServlet() {
		
	}

}
