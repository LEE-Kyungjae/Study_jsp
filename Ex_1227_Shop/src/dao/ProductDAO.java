package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ProductVO;

public class ProductDAO {
	static ProductDAO single = null;
	private SqlSessionFactory factory = null;
	
	private ProductDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
		
	}
	
	public static ProductDAO getInstance() {
		if (single == null)
			single = new ProductDAO();
		return single;
	}
	
//	public List<ProductVO> select(){
//		SqlSession sqlSession = factory.openSession();
//		List<ProductVO> list = sqlSession.selectList("p.table_list");
//		sqlSession.close();
//		return list;
//	}
	public List<ProductVO> select(String category){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = sqlSession.selectList("p.product_list",category);
		sqlSession.close();
		return list;
	}
	public int insert(ProductVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res =sqlSession.insert("p.product_insert",vo);
		//factory.openSession(true)->true를 넣지않았다면
		//sqlSession.commit();을 해야한다
		sqlSession.close();
		return res;
	}
	public ProductVO selectOne(int idx){
		SqlSession sqlSession = factory.openSession();
		ProductVO vo = sqlSession.selectOne("p.product_one",idx); 
		return vo;
	}
	
}
