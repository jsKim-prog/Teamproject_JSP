package member;

import java.sql.SQLException;

import common.DBConnPool;

public class MemberKDAO extends DBConnPool {

	// 생성자(기본)
	public MemberKDAO() {
		super();
	}

	// 메서드
	/* 아이디찾기 */
	public MemberDTO searchID(MemberDTO memberDTO) {
		String query = "select id from member where name = ? and birth = ? and phone = ?";
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getName());
			pps.setString(2, memberDTO.getBirth());
			pps.setString(3, memberDTO.getpNo());
			
			rset=pps.executeQuery();
			
			if(rset.next()) {
				memberDTO.setId(rset.getString("id"));
				memberDTO.setUsability(true);
			}else {
				memberDTO.setUsability(false);
			}
		} catch (SQLException e) {
			System.out.println("MemberKDAO.searchID()메서드 오류");
			e.printStackTrace();
		}

		return memberDTO;
	}//--searchID
	
	/* id 중복검사 */
	public int checkID(String user_id) {
		int result = 0;
		
		String sql ="select count(id) from member where id=?";
		
		try {
			pps = conn.prepareStatement(sql);
			pps.setString(1, user_id);
			
			rset = pps.executeQuery();
			rset.next();
			result = rset.getInt(1);
		} catch (SQLException e) {
			System.out.println("MemberKDAO.checkID()메서드 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}//--checkID()
	
	/* 닉네임 중복검사 */
	public int checkNick(String user_nick) {
		int result = 0;
		
		String sql ="select count(nickName) from member where nickName=?";
		
		try {
			pps = conn.prepareStatement(sql);
			pps.setString(1, user_nick);
			
			rset = pps.executeQuery();
			rset.next();
			result = rset.getInt(1);
		} catch (SQLException e) {
			System.out.println("MemberKDAO.checkNick()메서드 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}//--checkNick()

	/* C - 회원가입 */
	public int register(MemberDTO memberDTO) {
		int result = 0;
		
		String query = "insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) values (member_seq.nextval, ?, ?, ?, ?, TO_DATE(?,'YYYY/MM/DD'), ?, ?, ?, ?)";
		System.out.println("test 오류지점1" );
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getPw());
			pps.setString(3, memberDTO.getName());
			pps.setString(4, memberDTO.getNickName());
			pps.setString(5, memberDTO.getBirth());
			pps.setString(6, memberDTO.getSex());
			pps.setString(7, memberDTO.getpNo());
			pps.setString(8, memberDTO.getMail());
			pps.setInt(9, memberDTO.getAuthor());
			
			result = pps.executeUpdate();
			System.out.println("test Author: "+memberDTO.getAuthor());
			System.out.println("test result: "+result);
			
		} catch (SQLException e) {
			System.out.println("MemberKDAO.register() 메서드 예외발생");
			System.out.println("쿼리문 확인");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* R - 로그인-MemberD */
}
