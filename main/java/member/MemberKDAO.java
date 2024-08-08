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
	
	/* 패스워드찾기(회원검증) */
	public int searchPW(MemberDTO memberDTO) {
		int result = 0;
		
		String query = "select count(*) as cnt from member where id=? and birth=? and phone=?";
		
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getBirth());
			pps.setString(3, memberDTO.getpNo());
			
			rset = pps.executeQuery();
			rset.next();
			result = rset.getInt("cnt");
			
			
		} catch (SQLException e) {
			System.out.println("MemberKDAO.searchPW()메서드 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 회원정보변경-정보가져오기 */
	public MemberDTO searchMem(MemberDTO memberDTO) {
		MemberDTO findMem = new MemberDTO();
		
		String query = "select * from member where id =? and nickName=?";
		
		try {
			pps= conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getNickName());
			
			rset = pps.executeQuery();
			
			while(rset.next()) {
				findMem.setId(rset.getString("id"));
				findMem.setPw(rset.getString("pw"));
				findMem.setName(rset.getString("name"));
				findMem.setNickName(rset.getString("nickName"));
				findMem.setBirth(rset.getString("birth"));
				findMem.setSex(rset.getString("sex"));
				findMem.setpNo(rset.getString("phone"));
				findMem.setMail(rset.getString("mail"));				
			}
			
		} catch (SQLException e) {
			System.out.println("MemberKDAO.searchMem()메서드 예외발생");
			//e.printStackTrace();
		}		
		return findMem;
	}
	
	/* 회원정보변경 - 변경정보 업데이트*/
	public int updateMem(MemberDTO memberDTO) {
		int result = 0;
		String query = "update member set pw=?, nickName=?, phone=?, mail=? where id=? and name=?";
		
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getPw());
			pps.setString(2, memberDTO.getNickName());
			pps.setString(3, memberDTO.getpNo());
			pps.setString(4, memberDTO.getMail());
			pps.setString(5, memberDTO.getId());
			pps.setString(6, memberDTO.getName());
			
			result = pps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("MemberKDAO.updateMem()메서드 예외발생");
			e.printStackTrace();
		}
			return result;
	}
	
	/* 패스워드찾기(임시비번 업데이트) */
	public void inserttempPW(MemberDTO memberDTO) {
		int result = 0;
		
		String query = "update member set pw = ? where id=? and phone=?";
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getPw());
			pps.setString(2, memberDTO.getId());
			pps.setString(3, memberDTO.getpNo());

			result = pps.executeUpdate();
			
			if (result > 0) {
				System.out.println(result + "건의 패스워드 변경 완료");
			} else {
				throw new SQLException();
			}
			
		} catch (SQLException e) {
			System.out.println("MemberKDAO.inserttempPW()메서드 예외발생");
			e.printStackTrace();
		}
		
	}
	
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
	
	/* 로그인-회원검증 */
	public int loginVal(MemberDTO memberDTO) {
		int result = 0;
		String query = "select count(*) as cnt from member where id =? and pw=?";
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getPw());
			
			rset = pps.executeQuery();
			rset.next();
			
			result = rset.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("MemberKDAO.loginVal() 메서드 예외발생");
			//e.printStackTrace();
		}
		
		return result;
	}
	
	/* 로그인-정보가져오기 */
	public MemberDTO login(MemberDTO memberDTO) {
		MemberDTO loginMem = new MemberDTO();
		
		String query = "select * from member where id =? and pw = ?";
		
		try {
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getPw());
			
			rset = pps.executeQuery();
			while(rset.next()) {
				loginMem.setId(rset.getString("id"));
				loginMem.setPw(rset.getString("pw"));
				loginMem.setName(rset.getString("name"));
				loginMem.setNickName(rset.getString("nickName"));
				loginMem.setBirth(rset.getString("birth"));
				loginMem.setSex(rset.getString("sex"));
				loginMem.setpNo(rset.getString("phone"));
				loginMem.setMail(rset.getString("mail"));
				loginMem.setLoginStatus(true);
			}
			
		} catch (SQLException e) {
			System.out.println("MemberKDAO.login() 메서드 예외발생");
			e.printStackTrace();
		}
		
		return loginMem;
	}
	
	/* D-회원탈퇴 */
	public void delete(MemberDTO memberDTO) {
		int result = 0;
		try {
			String query = "delete from member where id=? and pw=?";
			pps = conn.prepareStatement(query);
			pps.setString(1, memberDTO.getId());
			pps.setString(2, memberDTO.getPw());

			result = pps.executeUpdate();

			if (result > 0) {
				System.out.println(result + "건의 회원정보 삭제 완료");
			} else {
				throw new SQLException();
			}

			pps.close();
		} catch (SQLException e) {
			System.out.println("회원정보 검색 실패.관리자에게 문의하세요.");
			// e.printStackTrace();
		}

	}// --delete()
}
