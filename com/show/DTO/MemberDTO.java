package com.show.DTO;

import java.util.ArrayList;
import java.util.List;

public class MemberDTO {
	// 필드
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String birth;// 주민번호 앞자리 string으로 저장
	private int sex; // 주민번호 뒷자리 첫번째 숫자 x%2이용하여 판별
	private String pNo; // 전화번호 - 없이 저장
	private String mail;
	private Boolean loginStatus;
	private Author author;
	private boolean usability;

	// 생성자
	public MemberDTO() {
		this.id = "guest";
		this.nickName = "guest";
		this.author = Author.GUEST;
		this.loginStatus = false;
	}

	public MemberDTO(String id, String pw) {// 로그인시 생성자
		this.id = id;
		this.pw = pw;
		this.loginStatus = false; // 로그인 검증후 성공시 변경
	}

	public MemberDTO(String id, String pw, String name, String ssn, String nickName, String pNo, String mail) {// 회원가입시
																												// 생성자
		this.id = id;
		this.pw = pw;
		setBirth(ssn);
		this.birth = getBirth();
		this.sex = (int) ssn.charAt(6);
		this.name = name;
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

	public int getSex() {
		return sex;
	}

	public String getpNo() {
		return pNo;
	}

	public String getMail() {
		return mail;
	}

	public void setId(String id, List<MemberDTO> memberDTOs) {
		if (memberDTOs.size() > 0) {// 리스트에 값이 아무것도 없을 때는 배열 돌지 않도록
		for (MemberDTO findId : memberDTOs) {
			if (findId.getId().equals(id)) {
				this.usability = false; //같은 id가 있으면 사용불가능한 id
				this.id = id;
				break;
			} else {
				this.usability = true;//같은 id가 없으면 사용가능한 id
				this.id = id;
				break;

			}
		}
		}else {
			this.id = id;
		}

	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setBirth(String ssn) {
		this.birth = ssn.substring(0, 6);
	}

	public void setSex(int sex) {
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

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isUsability() {
		return usability;
	}

}
