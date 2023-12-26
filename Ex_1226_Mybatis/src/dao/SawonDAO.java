package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;
	private SqlSessionFactory factory = null;
	
	private SawonDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}

	public List<SawonVO> select(){
		//mapper로 접근하기 위한 sqlSession객체 생성
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("sawon.sawon_list");
		sqlSession.close();
		return list;
	}
	//부서별 사원목록 조회
	//selectList메서드는 파라미터 2개이상을 받지 못한다. 하려면 객체던, map이던 싸서 보내야함
	public List<SawonVO> select(int deptno){
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("sawon.sawon_deptno",deptno);
		sqlSession.close();
		return list;
	}
}
