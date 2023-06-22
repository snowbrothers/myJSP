package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;


public class MemberAuth extends HttpServlet{

	
	MemberDao dao;
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	@Override
	public void init() throws ServletException {
		
		dao = new MemberDao();
		
		
	}
	
	// 
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		Member member = dao.login(id, pw);
		
		if(member != null) {
			
			req.setAttribute("authMessage", "Hello, " + member.getName());
			
		} else {
			req.setAttribute("authMessage"
					,  "login fail");
		}
		
		
//		req.getRequestDispatcher("/13서블릿/MemberAuth.jsp")
//								.forward(req, resp);
		
		String str = URLEncoder.encode("./MemberAuth.jsp");
		resp.sendRedirect(str);
		
	}
	
	

}
