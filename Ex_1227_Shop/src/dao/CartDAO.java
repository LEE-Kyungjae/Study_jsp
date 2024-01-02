package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVO;

public class CartDAO {
	static CartDAO single = null;
	SqlSessionFactory factory;
	private CartDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	public static CartDAO getInstance() {
		if (single == null)
			single = new CartDAO();
		return single;
	}
	//회원별 장바구니 목록
	public List<CartVO> select(int m_idx){
		SqlSession sqlSession = factory.openSession();
		List<CartVO> list = sqlSession.selectList("c.cart_list",m_idx);
		sqlSession.close();
		return list;
	}
	//회원별 장바구니 상품의 총계
	public int selecTotalAmount(int m_idx){
		SqlSession sqlSession = factory.openSession();
		int total = sqlSession.selectOne("c.cart_total_amount",m_idx);
		sqlSession.close();
		return total;
	}
	public int update_cnt(int c_idx, int c_cnt) {
		SqlSession sqlSession = factory.openSession(true);
		Map<String,Integer> map = new HashMap<>();
		map.put("idx", c_idx);
		map.put("cnt", c_cnt);
		int res= sqlSession.update("c.cart_cnt_upd", map);
		sqlSession.close();
		return res;
	}
	public CartVO selectOne(CartVO vo) {
		SqlSession sqlSession = factory.openSession();
		CartVO res_vo = sqlSession.selectOne("c.cart_one",vo);
		sqlSession.close();
		return res_vo;
	}
	public int insert(CartVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("c.cart_insert",vo);
		sqlSession.close();
		return res;
	}
	public int delete(int c_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("c.cart_del",c_idx);
		sqlSession.close();
		return res;
	}
}
