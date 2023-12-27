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
	
	public List<ProductVO> select(){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = sqlSession.selectList("p.table_list");
		sqlSession.close();
		return list;
	}
	public List<ProductVO> select(String a){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = sqlSession.selectList("p.table_list",a);
		sqlSession.close();
		return list;
	}
	public List<ProductVO> select(String a, boolean b){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = sqlSession.selectList("p.table_list",a);
		sqlSession.close();
		return list;
	}
}
