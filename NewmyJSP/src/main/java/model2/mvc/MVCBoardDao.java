package model2.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Criteria;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}

	public int update(MVCBoardDto dto) {
		
		int res = 0;
		
		String sql  = "update mvcboard set "
						+ "name = ?, "
						+ "title = ?, "
						+ "content = ?, "
						+ "ofile = ? "
						+ "where idx = ?";
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt= conn.prepareStatement(sql);) {
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getIdx());
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
		
	}

	
	public int insert(MVCBoardDto dto) {

		int res = 0;

		String sql = "insert into mvcboard (idx, name, title, content, pass)"
				+ "    values (seq_board_num.nextval, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getPass());

			res = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;

	}

	public int totalCnt() {

		int res = 0;

		String sql = "SELECT count(*) FROM MVCBOARD";

		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {

				res = rs.getInt(1);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	/**
	 * (구) 리스트조회
	 * 
	 * @param searchField
	 * @param searchWord
	 * @return
	 */
	public List<MVCBoardDto> getList(String searchField, String searchWord) {

		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();

		String sql = "SELECT * " + "FROM MVCBOARD ";

		if (searchWord != null && !"".equals(searchWord)) {

			sql += "where " + searchField + " like '%" + searchWord + "%'";

		}

		sql += "order by idx desc";

		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

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
	 * 
	 * @param idx
	 * @return
	 */
	// 상세보기 페이지를 만들기 위해 한건의 데이터를 조회하는 메서드 작성
	public MVCBoardDto selectOne(String idx) {

		MVCBoardDto dto = null;
		String sql = "SELECT * FROM MVCBOARD WHERE IDX = ?";

		if (idx == null || "".equals(idx)) {

			return null;
		}

		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, idx);

			ResultSet rs = psmt.executeQuery();

			// 1건의 게시글조회
			if (rs.next()) {
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
			System.err.println("게시물 상세보기 조회중 오류가 발생 하였습니다.");
			e.printStackTrace();
		}

		return dto;

	}

	/**
	 * new 리스트조회
	 * 
	 * @param cri
	 * @return
	 */
	public List<MVCBoardDto> getList(Criteria cri) {
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();

		String sql = "SELECT * " + "FROM MVCBOARD ";

		// 검색어가 null 이 아니라면 검색기능을 추가한다.

		if (cri.getSearchWord() != null && !"".equals(cri.getSearchWord())) {

			sql += "where " + cri.getSearchField() + " like '%" + cri.getSearchWord() + "%'";

		}

		sql += "order by idx desc";

		System.out.println("검색 sql : " + sql);
		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

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

	// 목록 조회 + 페이징
	public List<MVCBoardDto> getListPage(Criteria cri) {
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();

		String sql = "SELECT * FROM (" + "			SELECT tb.*, ROWNUM rn FROM ( "
				+ "  			SELECT * FROM MVCBOARD ";

		// 검색어가 null 이 아니라면 검색기능을 추가한다.

		if (cri.getSearchWord() != null && !"".equals(cri.getSearchWord())) {

			sql += "where " + cri.getSearchField() + " like '%" + cri.getSearchWord() + "%'";

		}

		sql += "				order by idx desc" + "			) tb" + ")" + "where rn between ? and ?";

		System.out.println("검색 sql : " + sql);
		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			psmt.setInt(1, cri.getStartNo());
			psmt.setInt(2, cri.getEndNo());

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

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

	public boolean confirmPassword(String pass, String idx) {

		boolean res = false;

		String sql = "SELECT * FROM MVCBOARD WHERE IDX = ? and pass = ?";

		try (Connection conn = DBConnPool.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {

			psmt.setString(1, idx);
			psmt.setString(2, pass);

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {

				res = true;

			}

		} catch (SQLException e) {
			System.out.println("비밀번호 확인 도중 오류가 발생 하였습니다.");
			e.printStackTrace();
		}

		return res;
	}

	
	
	public int delete(String idx) {
		
		int res = 0;
		
		String sql = "DELETE MVCBOARD WHERE IDX = ?";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {

			psmt.setString(1, idx);
			

			res = psmt.executeUpdate();


		} catch (SQLException e) {
			System.out.println("비밀번호 확인 도중 오류가 발생 하였습니다.");
			e.printStackTrace();
		}

		return res;
	}

}
