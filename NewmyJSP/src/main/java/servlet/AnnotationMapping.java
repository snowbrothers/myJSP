package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /13서블릿/식별자이름
@WebServlet("/13서블릿/AnnotationMapping.do")
public class AnnotationMapping extends HttpServlet{

	
	// 앞에 do가 붙은 메서드들 .. 요청이 가능토록 하는 메서드라고 생각하면 됨...
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("message", "AnnotationMapping.do 호출");

		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
		
		
	}
	
	public AnnotationMapping() {
		// TODO Auto-generated constructor stub
	}

}
