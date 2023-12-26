package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;
	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	private SawonDAO() {
	}
	
	public List<SawonVO> selectList() {
		List<SawonVO> list = new ArrayList<SawonVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SawonVO vo = new SawonVO();
				//현재레코드값=>Vo저장
				vo.setSABUN(rs.getInt("sabun"));
				vo.setSAHIRE(rs.getString("sahire"));
				vo.setSAJOB(rs.getString("sajob"));
				vo.setSANAME(rs.getString("saname"));
				
				//ArrayList추가
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}