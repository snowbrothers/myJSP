package model2.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public int totalCnt() {
		
		int res = 0;
		
		String sql = "SELECT count(*) FROM MVCBOARD";
		
			try(Connection conn =DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					
					
					res = rs.getInt(1);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return res;
	}
	
	public List<MVCBoardDto> getList(){
		
		String sql ="SELECT * FROM MVCBOARD order by idx desc";
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
							
				MVCBoardDto dto = new MVCBoardDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getString("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	/**
	 * 게시글 번호를 입력받아 게시글 조회
	 * @param idx
	 * @return
	 */
	// 상세보기 페이지를 만들기 위해 한건의 데이터를 조회하는 메서드 작성
	public  MVCBoardDto selectOne(String idx) {
		
		MVCBoardDto dto = null;
		String sql ="SELECT * FROM MVCBOARD WHERE IDX = ?";
		
		if(idx == null || "".equals(idx)) {
			
			return null;
		}
		
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				psmt.setString(1, idx);
				
				ResultSet rs = psmt.executeQuery();
				
				// 1건의 게시글조회
				if(rs.next()) {
					dto = new MVCBoardDto();
					
					dto.setIdx(rs.getString("idx"));
					dto.setName(rs.getString("name"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostdate(rs.getString("postdate"));
					dto.setOfile(rs.getString("ofile"));
					dto.setSfile(rs.getString("sfile"));
					dto.setDowncount(rs.getString("downcount"));
					dto.setPass(rs.getString("pass"));
					dto.setVisitcount(rs.getString("visitcount"));
				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return dto;
		
	}
	
	

}
