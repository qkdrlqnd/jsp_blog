package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class MainDAO {

	public MainDTO read(int no){
		MainDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select * from fname  ");
		sql.append(" where no = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new MainDTO();
				
				dto.setFname(rs.getString("fname"));
				dto.setNo(rs.getInt("no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
		
	}
	
	public List<MainDTO> list(Map map){
		
		List<MainDTO> list = new ArrayList<MainDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		sql.append(" select  fname, r from(	 ");
		sql.append(" 	select  fname, rownum r from(	 ");
		sql.append(" 		select fname from fname ");
		sql.append(" 		order by rownum ");
		sql.append(" 	) ");
		sql.append(" )where r >= ? and r <= ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, sno);
			pstmt.setInt(2, eno);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MainDTO dto = new MainDTO();
				dto.setFname(rs.getString("fname"));

				
				list.add(dto);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		

		return list;
	}
	
	public int total(Map map){
		
		int total = 0;
		

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from fname ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next())
				total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		return total;
		
	}
	
	
	
	
}
