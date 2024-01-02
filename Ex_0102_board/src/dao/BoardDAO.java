package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	static BoardDAO single = null;
	SqlSessionFactory factory;
	
	private BoardDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public static BoardDAO getInstance() {
		if (single == null)
			single = new BoardDAO();
		return single;
	}
	public List<BoardVO> selectList() {
		SqlSession sqlSession = factory.openSession();
		List<BoardVO> list = sqlSession.selectList("board_list");		
		sqlSession.close();
		return list;
	}
	public int insert(BoardVO vo){
		SqlSession sqlSession = factory.openSession(true);
		int res= sqlSession.insert("board_insert",vo);
		sqlSession.close();
		return res;
	}
	public BoardVO selectone(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		BoardVO vo = sqlSession.selectOne("board_list_one",idx);
		sqlSession.close();
		return vo;
	}
	public int delete(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res =sqlSession.delete("board_delete",idx);
		sqlSession.close();
		return res;
	}
	public int update(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("board_update",vo);
		return res; 
	}
}
