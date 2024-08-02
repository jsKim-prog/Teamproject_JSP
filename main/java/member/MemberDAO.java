package member;

import java.sql.SQLException;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {
	// 기본생성자
	public MemberDAO() {
		super();//1,2단계(dbconnection pool 연결)
	}

	
	// 메서드
	public MemberDTO loginUser(MemberDTO memberDTO) {
		MemberDTO loginMem = new MemberDTO();// 빈객체 생성
		int result = 0; // count 결과 받을 정수 변수
		// 1차 회원가입여부 확인
		try {
			String sql1 = "select count(*) as cnt from member where id=? and pass=?";
			pps1 = conn.prepareStatement(sql1);
			pps1.setString(1, memberDTO.getId());
			pps1.setString(2, memberDTO.getPw());
			rset1 = pps1.executeQuery();
			rset1.next();
			result = rset1.getInt("cnt");
			//System.out.println("test : id - " + memberDTO.getId());
			//System.out.println("test : pw - " + memberDTO.getPw());
			//System.out.println("test : result - " + result);
			//System.out.println("test : cnt - " + rset1.getInt("cnt"));

			int select = (result != 0) ? 1 : 2;
			//System.out.println("test : select - " + select);
			switch (select) {
			case 1: // 회원정보가 있는 경우(검증완료) 정보를 가져온다.
				String sql2 = "select * from member where id=? and pass=?";
				pps2 = conn.prepareStatement(sql2);
				pps2.setString(1, memberDTO.getId());
				pps2.setString(2, memberDTO.getPw());
				rset2 = pps2.executeQuery();
				while (rset2.next()) {
					loginMem.setId(rset2.getString("id"));
					loginMem.setName(rset2.getString("name"));
					//loginMem.setRegdate(rset2.getString("regidate"));
					loginMem.setLoginStatus(true);
				} // --while()
				break;
			case 2:
				loginMem.setLoginStatus(false);
			default:
				throw new SQLException();
			}// --select()

		} catch (SQLException e) {
			System.out.println("loginUser() 3, 4단계 오류");
			e.printStackTrace();
		}
		return loginMem;
	}

}
