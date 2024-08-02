package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnPool {//JDBC 이용시 DBPool 이용
	//커넥션 풀은 미리 커넥션 객체를 생성해주고 접속하면 제공 후 반납을 받음
	//필드
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pps;
	public PreparedStatement pps1;
	public PreparedStatement pps2;
	public ResultSet rset;
	public ResultSet rset1;
	public ResultSet rset2;
	
	//생성자
	public DBConnPool() {
		// 커넥션 풀(DataSource) 얻기
		try {
			Context initCtx = new InitialContext();
			 // Context : 네이밍 서버스에서 이름과 실제 객체를 연결해주는 개념
			// InitialContext : 네이밍 서비스를 이용하기 위한 시작점(객체 생성)
			
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			// lookup() 메서드에 이름을 건네 원하는 객체를 찾아옴
			// java:comp/env -> 현재 웹 애플리케이션 루트 디렉토리 
			// 모든 자원은 java:comp/env 아래에 위치한다.
			
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			// 전역 자원에 설정한 이름을 이용해서 데이터 소스객체로 얻어옴
			 // 커넥션 풀을 통해 연결 얻기
			conn = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (NamingException e) {
			System.out.println("네이밍 서비스 연결 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
		
	}//객체 생성시 자동으로 커넥션 풀객체 생성용
	
	//메서드-연결해제(자원반납)
	public void close() {
		try {
			if(rset != null) {
				rset.close();
				System.out.println("ResultSet 종료 성공");
			}
			if(rset1 != null) {
				rset1.close();
				System.out.println("ResultSet1 종료 성공");
			}
			if(rset2 != null) {
				rset2.close();
				System.out.println("ResultSet2 종료 성공");
			}
			if(stmt != null) {
				stmt.close();
				System.out.println("Statement 종료 성공");
			}
			if(pps != null) {
				pps.close();
				System.out.println("PrepareStatement 종료 성공");
			}
			if(pps1 != null) {
				pps1.close();
				System.out.println("PrepareStatement1 종료 성공");
			}
			if(pps2 != null) {
				pps2.close();
				System.out.println("PrepareStatement2 종료 성공");
			}
			if(conn != null) {
				conn.close();
				System.out.println("Connection 종료 성공");
			}
		} catch (SQLException e) {
			System.out.println("자원반납 실패(close() 메서드 실패)");
			e.printStackTrace();
		}
	}

}