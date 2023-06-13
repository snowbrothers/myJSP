package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import common.DBConnPool;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// Board 가 담긴 List <
	public List<Board> getList() {

		List<Board> list = new ArrayList<Board>();

		
		String sql = "SELECT * FROM BOARD ORDER BY NUM DESC";

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
	
	
	public int getTotalCnt() {
		
		int totalCnt = 0;
		
		String sql = "select count(*) "
				+ "from board "
				+ "order by num desc";
		
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
	

	
	public static void main(String[] args) {
		
		
		BoardDao boardDao = new BoardDao();
		
		List<Board> list = boardDao.getList();
			for(Board board : list) {
				System.out.println(board);
		}
	}
}


