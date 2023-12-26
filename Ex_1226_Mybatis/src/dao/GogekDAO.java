package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	
	static GogekDAO single = null;
	private SqlSessionFactory factory = null;
	
	private GogekDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
		
	}
	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	//고객목록 전체조회
	public List<GogekVO> selectGogek(){
		
		SqlSession sqlSession = factory.openSession();
		List<GogekVO> list = sqlSession.selectList("gogek_list");
		sqlSession.close();
		return list;
	}
}
