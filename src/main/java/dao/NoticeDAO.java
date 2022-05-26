package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.NoticeDTO;

public class NoticeDAO {

	public void noticeWrite(NoticeDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO notice (n_title, n_content, m_email)"
				+ "values (?, ?, ?)";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getN_title());
			pstmt.setString(2, dto.getN_content());
			pstmt.setString(3, dto.getM_email());
			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public List<NoticeDTO> noticeList() {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM notice";
				
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setN_no(rs.getInt("n_no"));
				dto.setM_email(rs.getString("m_email"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_date(rs.getString("n_date"));
				dto.setN_viewcount(rs.getInt("n_viewcount"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public NoticeDTO noticeDetail(int n_no) {
		NoticeDTO dto = new NoticeDTO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM notice WHERE n_no=?";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setM_email(rs.getString("m_email"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_date(rs.getString("n_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public void countUp(int n_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE notice SET n_viewcount=n_viewcount + 1 WHERE n_no=?";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	

}
