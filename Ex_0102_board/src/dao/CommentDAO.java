package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import service.MyBatisConnector;
import vo.CommentVO;

public class CommentDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static CommentDAO single = null;
	SqlSessionFactory factory;

	private CommentDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}

	public static CommentDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new CommentDAO();
		// 생성된 객체정보를 반환
		return single;
	}

	// 전체댓글
	public List<CommentVO> selectList(int b_idx) {
		SqlSession sqlSession = factory.openSession();
		List<CommentVO> list = sqlSession.selectList("c.comm_list", b_idx);
		sqlSession.close();
		return list;
	}

	public int insert(CommentVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("c.comm_insert", vo);
		sqlSession.close();
		return res;
	}
}
