package com.show.DTO;

import java.util.ArrayList;

public class MemberDTO {
	// 필드
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String birth;// 주민번호 앞자리 string으로 저장
	private String sex; // 주민번호 뒷자리 첫번째 숫자 x%2이용하여 판별
	private String pNo; // 전화번호 - 없이 저장
	private Boolean loginStatus;
	private boolean usability;
	private Author author;

	// 생성자
	public MemberDTO() {
	      this.id = "guest";
	      this.nickName = "guest";
	      this.author = Author.GUEST;
	      this.loginStatus=false;
	}

	public MemberDTO(String id, String pw) {// 로그인시 생성자
		this.id = id;
		this.pw = pw;
		// this.nickName = LoginDTO. 로그인한 정보의 닉네임을 가져온다.
		this.loginStatus = false; // 로그인 검증후 성공시 변경
	}

	public MemberDTO(String id, String pw, String name, String ssn, String nickName, String pNo, String mail) {// 회원가입시 생성자
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;//ssn에서 숫자추출하여 삽입(메서드)
		// this.sex = ssn에서 숫자추출하여 삽입(메서드)
		this.nickName = nickName;
		this.pNo = pNo;
		this.mail = mail;
		this.author = Author.USER; // 회원가입시 권한부여
		this.loginStatus = false; // 로그인하면 상태수정
	}

	// 메서드
	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getNickName() {
		return nickName;
	}

	public String getBirth() {
		return birth;
	}

	public String getSex() {
		return sex;
	}

	public String getpNo() {
		return pNo;
	}

	public String getMail() {
		return mail;
	}

	public boolean setId(String joinID, ArrayList<MemberDTO> memberDTOs, boolean pass) {// 회원가입시 Id 생성 중복 검증용 setter	
//		System.out.println("여기는 왓냐");			
//		System.out.println(memberDTOs.size());
			for (MemberDTO findId : memberDTOs) {
				if (findId.getId().equals(joinID)) {					
					this.usability = false;
					System.out.println("사용중인 ID입니다.");
					pass = false;
					break;}
								
				}
			this.id = joinID;
			return pass;
			
			
		

	}

	public void setUsability(boolean usability) {
		this.usability = usability;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Boolean getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(Boolean loginStatus) {
		this.loginStatus = loginStatus;
	}

	private String mail;

	public Object getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	

	public boolean isUsability() {
		return usability;
	}

	/*
	 * public void setUsability(boolean usability) { this.usability = usability; }
	 */

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName + ", birth=" + birth
				+ ", sex=" + sex + ", pNo=" + pNo + ", loginStatus=" + loginStatus + ", usability=" + usability
				+ ", author=" + author + ", mail=" + mail + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setid(String string) {
		// TODO Auto-generated method stub
		
	}

}