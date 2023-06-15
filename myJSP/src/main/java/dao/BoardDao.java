package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import common.ConnectionUtil;
import common.DBConnPool;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// Board 가 담긴 List <
	
	/**
	 * 게시글 조회
	 * 
	 * 검색조건 추가하기.
	 * @param searchField : 검색조건
	 * @param searchWord  : 검색어
	 * @return 
	 */
	public List<Board> getList(String searchField, String searchWord) {

		List<Board> list = new ArrayList<Board>();

		
		String sql = "SELECT * "
					+ "FROM BOARD ";
		
			
			if(searchWord != null && !"".equals(searchWord)) {
			
				// 변수는 문자열 안에 포함되면 안됨.
				sql     += "WHERE "+searchField+" LIKE '%" + searchWord + "%'";
				
				}else {
					
					sql		+= "ORDER BY NUM DESC";
				
				}
		    
		    

		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement pstm =  conn.prepareStatement(sql);
				ResultSet rs = pstm.executeQuery(sql);) {
			
			while(rs.next()) {
				
				
				// 게시물의 한 행을 DTO에 저장
				
				Board board = new Board();
				
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title")) ;
				board.setContent(rs.getString("content"));
				board.setId( rs.getString("id"));
				board.setPostdate( rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
				
				list.add(board);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	
	public int getTotalCnt(String searchField, String searchWord) {
		
		int totalCnt = 0;
		
		String sql = "select count(*) "
				+ "from board ";
				
		if(searchWord != null && !"".equals(searchWord)) {
			
			// 변수는 문자열 안에 포함되면 안됨.
			sql     += "WHERE "+searchField+" LIKE '%" + searchWord + "%'";
			
			}else {
				
				sql		+= "ORDER BY NUM DESC";
			
			}
		
				
		
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				ResultSet rs = psmt.executeQuery();
				rs.next();
				totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
				
				rs.close();				
			} catch (SQLException e) {
				System.err.println("총 게시물의 수를 조회 하던 도중 오류 발생");
				e.printStackTrace();
			}
		
		return totalCnt;
		
	
	}
	
	/**
	 * 게시글 등록
	 * @param board
	 * @return
	 */
	public int insert(Board board) {
		
		int res = 0;
		
		String sql ="insert into board "
				+ "(num, title, content, id, postdate, visitcount) "
				+ "values (seq_board_num.nextval, "
				+ " ?, ?, ?, sysdate, 0)";
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			
			// insert, update, delete 실행 후 몇건이 처리 되었는지 반환
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
		return res;
		
	}
	
	/**
	 * 게시글 번호를 입력받아 게시글을 조회합니다.
	 * @param num
	 * @return
	 */
	public Board selectOne(String num) {
		
		Board board = null;
		
		String sql = "SELECT * "
					+ "FROM BOARD "
					+ "WHERE NUM = ?";
		
		if(num == null || "".equals(num)) {

			return null;
		}
		
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				psmt.setString(1, num);
				
				ResultSet rs =  psmt.executeQuery();
				
				// 1건의 게시글을 조회 하여 board 객체에 담아줍니다.
				if(rs.next()) {
					
					board = new Board();
					
					board.setNum(rs.getString("num"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setId(rs.getString("id")); 
					board.setPostdate(rs.getString("postdate")) ;
					board.setVisitcount(rs.getString("visitcount"));
					 
					
				}else {
					
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return board;
		
	}
	
	public int upadateVisitCount(String num) {
		
		int res = 0;
		
		String sql ="UPDATE BOARD SET VISITCOUNT = VISITCOUNT+1 WHERE NUM = ?";
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);) {
			
			psmt.setString(1, num);
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	public int deleteBoard(String num) {
		
		int res = 0;
		
		String sql = "DELETE BOARD WHERE NUM = ?";
		
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				psmt.setString(1, num);
				
				res = psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return res;
	}
	
	
	public int EditWrite(Board board) {
		
		int res = 0;
		
		String sql ="UPDATE BOARD "
				+ "SET TITLE = ?, "
				+ "CONTENT = ?, "
				+ "POSTDATE = SYSDATE "
				+ "WHERE NUM = ?";
		
			
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
			
				psmt.setString(1, board.getTitle());
				psmt.setString(2, board.getContent());
				psmt.setString(3, board.getNum());
				
				res = psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return res;
	}
}

