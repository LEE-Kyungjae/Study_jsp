package service;

import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	
	/*
	 * Mybatis : 데이터베이스 프로그래밍을 쉽게 가능하도록 도와주는 프레임워크
	 * 기존에 DAO를 통한 DB접근 방식을 간편하게 변경한 구조
	 * */	
	static MyBatisConnector single = null;
	SqlSessionFactory factory = null;
	
	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	private MyBatisConnector() {
		try {
			//sqlMapConfig.xml의 경로를 찾아 읽어온다
			Reader reader = 
					Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
		}
	}//생성자
	
	public SqlSessionFactory getFactory() {
		return factory;
	}

}


