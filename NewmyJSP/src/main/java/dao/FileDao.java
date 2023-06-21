package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import fileUpload.FileDto;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}

	
	// 파일 정보 저장
	public int insertFile(FileDto dto) {
		
		int res = 0;
		
		String sql ="insert into mYfile"
				+ " (idx,name,title,cate,ofile,sfile,postdate)"
				+ " values "
				+ "(seq_board_idx.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt =  conn.prepareStatement(sql);) {
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			
			res = psmt.executeUpdate();
	
			
			System.out.println("파일이 업로드 되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
		
	}
	
	// 파일 목록 조회
	public List<FileDto> getFileList(){
		
		List<FileDto> list = new ArrayList<FileDto>();
		
		String sql ="SELECT * FROM myfile order by idx desc";
		
			try(Connection conn = DBConnPool.getConnection();
					PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				ResultSet rs = psmt.executeQuery();
				
				while(rs.next()) {
					
					FileDto dto = new FileDto();
					dto.setIdx(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setCate(rs.getString(4));
					dto.setOfile(rs.getString(5));
					dto.setSfile(rs.getString(6));
					dto.setPostdate(rs.getString(7));
					
					list.add(dto);
					
				}
				
				
			} catch (SQLException e) {
				System.err.println("게시물 조회중 오류 발생");
				e.printStackTrace();
			}
		
		
		return list;
		
	}

	
}
