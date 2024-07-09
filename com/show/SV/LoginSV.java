package com.show.SV;

//import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.show.DTO.Author;
import com.show.DTO.MemberDTO;
//import com.show.exception.NoExistException;

public class LoginSV {

	/* 메뉴 */
	public static void menu(Scanner s, List<MemberDTO> memberDTOs, MemberDTO loginState) {
		boolean run = true;
		while (run) {
			System.out.println("1. 로그인 | 2. 회원가입 | 3. 닫기");
			System.out.print(">>>");
			int select = s.nextInt();
			switch (select) {
			case 1:
				loginState = login(s, memberDTOs, loginState);
				break;
			case 2:
				register(s, memberDTOs, loginState);
				break;
			case 3:
				run = false;
				break;
			default:
				System.out.println("1~3값만 입력하세요.");
			}
		} // --while()

	}// --menu()

	/* 메소드-로그인 */
	public static MemberDTO login(Scanner s, List<MemberDTO> memberDTOs, MemberDTO loginState) {
		
		
		System.out.println("로그인을 위한 ID / PW를 입력하세요.");
		System.out.print("ID : ");
		String id = s.next();
		System.out.print("PW : ");
		String pw = s.next();
		
		

		//MemberDTO login = new MemberDTO(id, pw); // login정보 담은 객체생성

		if (memberDTOs.size() > 0) {// 리스트에 값이 아무것도 없을 때는 배열 돌지 않도록
			for (MemberDTO find : memberDTOs) { // 리스트 돌면서 객체들 불러오기
				if (find.getId().equals(id)) {
					System.out.println("ID를 확인했습니다.");
					if (find.getPw().equals(pw)) {
						System.out.println("PW를 확인했습니다.");
						System.out.println("로그인 성공!!");
						int i = memberDTOs.indexOf(find); //리스트에서 id, pw 일치하는 정보의 인덱스 번호 추출
						loginState = memberDTOs.get(i); //해당 인덱스 정보를 loginstate 에 저장
						loginState.setLoginStatus(true); //loginstate 의 로그인 상태 변경
						break; //반복 빠져나가기
					} else { //pw가 일치하지 않으면 
						System.out.println("현우냐?");
						break;
					} // if-if문 종료
				} else { //id가 일치하지 않으면
					System.out.println("누구냐 넌?");
					System.out.println(loginState.getId());
					break;
				} // if문 종료
			} // for문 종료
		} else {
			System.out.println("해당하는 계정이 없습니다.");
			System.out.println("회원가입을 진행해 주세요.");
			//register();
		}
		// --for(size)
		return loginState;
	}// --login()

	/* 메소드-회원가입 */
	public static void register(Scanner s, List<MemberDTO> memberDTOs, MemberDTO loginState) {
		MemberDTO join = new MemberDTO();
        System.out.println("회원 가입을 시작합니다.");
        
     //   System.out.println("test :리스트 size:"+memberDTOs.size());

        
        boolean run = true;
        while(run) {                       
           System.out.println("원하시는 ID를 입력하세요");
           System.out.print(">>>");
           String joinID = s.next();
            join.setId(joinID, memberDTOs);
  //          System.out.println(join.toString());
           if(join.isUsability()) {  //사용성=true          
              System.out.println("사용 가능한  ID 입니다.");
              System.out.println("------------------");
              run = false;
           }else {
              System.out.println("사용불가능한 ID입니다.");
              run = true;               
           }           
        }
        

        System.out.println("원하시는 PW를 입력하세요");
        System.out.print(">>>");
        String joinPW = s.next();
        
        System.out.println("------------------");
        System.out.println("이름을 입력하세요");
        System.out.print(">>>");
        String joinName = s.next();
        
        System.out.println("------------------");
        System.out.println("생년월일을 입력하세요");
        System.out.print(">>>");
        String joinBirth = s.next();
        
        System.out.println("------------------");
        System.out.println("닉네임을 입력하세요");
        System.out.print(">>>");
        String joinNickName = s.next();
        
        System.out.println("------------------");
        System.out.println("이메일을 입력하세요");
        System.out.print(">>>");
        String joinEmail = s.next();
        
        System.out.println("------------------");
        System.out.println("전화번호를 입력하세요");
        System.out.print(">>>");
        String joinPNo = s.next();
        
        
        join.setPw(joinPW);
        join.setName(joinName);
        join.setBirth(joinBirth);
        join.setMail(joinEmail);
        join.setNickName(joinNickName);
        memberDTOs.add(join);
        System.out.println("Id : " + join.getId());
        System.out.println("PW : " + join.getPw());
        System.out.println("으로 가입이 완료 되었습니다.");
        System.out.println("---------------------");
	}// --register()

}
