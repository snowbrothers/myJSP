package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;
import dto.Criteria;

public class NewBoardDao {

	public NewBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Board> getList(Criteria criteria){
		
		List<Board> BoardList = new ArrayList<Board>();
		
		String sql ="SELECT num,"
				+ "title,"
				+ "content,"
				+ "id, "
				+ "DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE), TO_CHAR(POSTDATE,'hh24:mi:ss'), TO_CHAR(POSTDATE,'YYYY-MM-DD')) postdate"
				+ ",visitcount from board ";
		
		if(criteria.getSearchWord() !=null
				&& !"".equals(criteria.getSearchWord())) {
			
			sql += "WHERE "+criteria.getSearchField()+" LIKE '%" 
					+ criteria.getSearchWord() +"%'";
		}else {
			
			sql += " order by num desc";
		}
		
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery(sql);) {
			
			
			
			
			while(rs.next()) {
				
				Board board = new Board();
				
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
				
				BoardList.add(board);
			}
			
				
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return BoardList;
		
	}

	public List<Board> getListPage(Criteria criteria){
		
		List<Board> BoardList = new ArrayList<Board>();
		
		String sql =
				
				"SELECT * FROM ("
				+ "    SELECT ROWNUM rn, t.*"
				+ "    from("
				+ "SELECT num,"
				+ "title,"
				+ "content,"
				+ "id, "
				+ "DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE), TO_CHAR(POSTDATE,'hh24:mi:ss'), TO_CHAR(POSTDATE,'YYYY-MM-DD')) postdate"
				+ ",visitcount from board ";
		
		if(criteria.getSearchWord() !=null
				&& !"".equals(criteria.getSearchWord())) {
			
			sql += "WHERE "+criteria.getSearchField()+" LIKE '%" 
					+ criteria.getSearchWord() +"%'";
		} 
			
			
			sql += " order by num desc"
					+ " ) t"
					+ " )"
					+ "where rn between "+criteria.getStartNo()+" and "+criteria.getEndNo();
		
			
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery(sql);) {
			
			
			
			
			while(rs.next()) {
				
				Board board = new Board();
				
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
				
				BoardList.add(board);
			}
			
				
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return BoardList;
		
	}
	
	public int insert(Board board) {
		
		int res = 0;
		String sql = "insert into board "
				+ "values (seq_board_num.nextval,?,?,?,sysdate,0)";
		try(Connection conn =DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			
			res = psmt.executeUpdate();
		
			System.out.println(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
		
	}
	
	public Board selectOne(String num) {
		String sql ="select * from board where num=?";
		Board board = null;
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt= conn.prepareStatement(sql);) {
			
			psmt.setString(1, num);
			ResultSet rs =  psmt.executeQuery();
			
			if(rs.next()) {
				
				
				board = new Board();
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setNum(rs.getString("num"));
				board.setPostdate(rs.getString("postdate"));
				board.setTitle(rs.getString("title"));
				board.setVisitcount(rs.getString("visitcount"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return board;
	}
	
}
