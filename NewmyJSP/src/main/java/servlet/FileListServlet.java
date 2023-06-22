package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FileDao;
import fileUpload.FileDto;

@WebServlet("/13파일업로드/File.do")
public class FileListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		
		req.setAttribute("listSize", list.size());
		
		req.getRequestDispatcher("./1FileList.jsp").forward(req, resp);
		
		//out.print("총건수" + list.size());
		
		
	}
	
	public FileListServlet() {
		
		
	}

}
