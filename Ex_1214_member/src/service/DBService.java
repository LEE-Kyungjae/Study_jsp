package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	DataSource dataSource;
	// single-ton pattern: 
	// 객체를 1개만 생성해서 지속적으로 서비스하기 위함
	static DBService single = null;
	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	private DBService() {
		try {
			InitialContext ic= new InitialContext();
			Context ctx = (Context)ic.lookup( "java:comp/env" );
			dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//DBService
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}


