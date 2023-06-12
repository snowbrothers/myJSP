package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

public class MemberDao {

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}

	/** 로그인 / 조회
	 * 회원이 존재하면 Member 객체 반환
	 * @param id : 입력한 회원 id
	 * @param pw : 비번
	 * @return
	 */
	public Member login(String id, String pw){
		
		// 멤버생성
		Member member = null;
		
		// sql 문장
		String sql = "SELECT * FROM MEMBER"
						+ " WHERE id =? and pass =?";
		
		
		// 리소스 / 자원을 자동반환(close())
		try(Connection con = ConnectionUtil.getConnection();
				PreparedStatement psmt =  con.prepareStatement(sql);) {

			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			ResultSet rs =  psmt.executeQuery();
			
			// 아이디 비밀번호가 일치하는 회원이 있으면 조회.
			if(rs.next()) {
				
				String loginId = rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				
				// 비밀번호는 가지고 다니지 않는다.
				member = new Member(loginId,"",name, regidate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}
	
	/**
	 * 
	 * 회원등록
	 * @param member
	 * @return 몇건이 처리 되었는지 반환
	 */
	public int insert(Member member) {
		
		int i = 0;
	
		String sql = "insert into member values (?, ?, ?, sysdate)";
		
		try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql);) {
			
			pstm.setString(1, member.getId());
			pstm.setString(2, member.getPass());
			pstm.setString(3, member.getName());
			
			i = pstm.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
		
	}
	
}
