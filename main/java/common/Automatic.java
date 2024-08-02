package common;

import member.MemberDTO;

public class Automatic { // 자동변환 등의 공통 메서드 모음

	/* 메서드-주민번호 추출 : 주민번호 앞-뒤 자리를 받아 생년월일-성별로 변환 */
	public static MemberDTO ssnChager(String fr_ssn, String bk_ssn, MemberDTO member) {// 주민번호 앞자리(fr_ssn)과 뒷자리(bk_ssn)을
		// 받아
		// 생년월일과 성별을 추출한다.
		// 주민번호 앞자리 YY-MM-DD 형태로 추출하기
		int calyear = Integer.parseInt(fr_ssn.substring(0, 2)); // 앞 2자리
		int calmonth = Integer.parseInt(fr_ssn.substring(2, 4)); // 중간 2자리
		int calday = Integer.parseInt(fr_ssn.substring(4)); // 끝 2자리

		int sexnum = Integer.parseInt(bk_ssn); // 뒷번호 첫 글자 (한글자만 받음-> string으로 받아 int로)

		String year = (sexnum == 1 || sexnum == 2) ? "19" : "20"; // 주민번호 뒷자리 첫 글자가 1 또는 2면 앞에 19년을, 아니면 20년을 적용
		String birth = year + String.format("%02d", calyear) + "/" + String.format("%02d", calmonth) + "/"
				+ String.format("%02d", calday); // YYYY/MM/DD 형태로 birth 저장
		String sex = (sexnum % 2 == 0) ? "여" : "남"; // 주민번호 뒷자리 첫 글자가 짝수면 여, 홀수면 남
		member.setBirth(birth);
		member.setSex(sex);

		return member;
	}

	/* 메서드-휴대폰 번호 합치기 */
	public static String phoneJoin(String pno_frn, String pno_mid, String pno_last) {
		String phoneNum = pno_frn + "-" + pno_mid + "-" + pno_last;
		return phoneNum;
	}

	/* 메서드-메일주소 합치기 */
	public static String mailJoin(String mail_frn, String mail_last) {
		String mailAddr = mail_frn + mail_last;
		return mailAddr;
	}

}
