package model2.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

/**
 * 모든 조회는 컨트롤러에서 수행한다.
 * @author user
 *
 */
public class ListController extends HttpServlet{

	MVCBoardDao dao = new MVCBoardDao();
	
	// service 에서 doget 호출
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
//		int pageNo = 1;
//		
//		if(req.getParameter("pageNo") != null) {
//			try {
//
//				pageNo = Integer.parseInt(req.getParameter("pageNo"));
//				
//			} catch (Exception e) {
//				System.err.println("페이지 번호를 숫자로 변환중 오류 발생");
//				System.err.println("pageNo : " + req.getParameter("pageNo").toString());
//				pageNo = 1;
//			}
//		}
		
			
		// 검색어, 페이지정보 세팅
		
		// 총건수 출력
		int totalCnt = dao.totalCnt();
		
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String pageNo = req.getParameter("pageNo");
		
		Criteria cri = new Criteria(searchField, searchWord, pageNo);
		
		cri.setSearchField(req.getParameter("searchField"));;
		cri.setSearchWord(req.getParameter("searchWord"));
		
		System.out.println("--- 페이지관련 파라메터");
		System.out.println("페이지번호 : " + cri.getPageNo());
		System.out.println("시작번호 : " +cri.getStartNo());
		System.out.println("끝번호 : " +cri.getEndNo());
		System.out.println("=====================");
		
		// 검색어, 페이지 정보를 담은 객체를 매개변수로 넣어줍니다.
		List<MVCBoardDto> list = dao.getListPage(cri);
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		// request영역에 저장
		req.setAttribute("list", list);
		
		
		
		req.setAttribute("totalCnt", totalCnt);
		
		System.out.println("총 게시물수 :" + totalCnt);
		
		
		// 페이지 네비게이션 생성을 위해 pageDto 생성
		
		req.setAttribute("pageDto", pageDto);
		
		
		
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
	
	}
	
	public ListController() {
		
	}

}
