package com.show;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.show.DTO.DramaDTO;
import com.show.DTO.MemberDTO;
import com.show.DTO.ReviewDTO;
import com.show.DTO.ShowDTO;
import com.show.DTO.VarietyDTO;
import com.show.SV.FindSV;
import com.show.SV.LoginSV;
import com.show.SV.SearchSV;
import com.show.exception.NoExistException;

public class MainExam {

	public static Scanner s = new Scanner(System.in);// 단어 입력
	public static Scanner sL = new Scanner(System.in);// 긴 문장 입력
	public static ArrayList<MemberDTO> memberDTOs = new ArrayList<MemberDTO>();
	public static ArrayList<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
	public static ArrayList<ShowDTO> showDTOs = new ArrayList<ShowDTO>();
	public static ArrayList<DramaDTO> dramaDTOs = new ArrayList<DramaDTO>();
	public static ArrayList<VarietyDTO> varietyDTOs = new ArrayList<VarietyDTO>();
	
	public static MemberDTO loginState;

	static {
		MemberDTO user1 = new MemberDTO("aaa", "aaa", "kim", "2012122******", "tester", "0101234567", "aaa@aaa.com");
		memberDTOs.add(user1);
		MemberDTO user2 = new MemberDTO("bbb", "bbb", "lee", "9901011******", "tester2", "0109876543", "bbb@bbb.com");
		memberDTOs.add(user2);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MemberDTO guest = new MemberDTO();
		loginState = guest;

		boolean run = true;
		System.out.println("<오잼>(가제 : 오늘은 무엇이 재밌을까?)에 오신것을 환영합니다.");

		while (run) {

			System.out.println("아래의 메뉴에서 골라주세요.");
			System.out.println("1. 찾아보기  |  2. 로그인 | 3. 회원정보 찾기");
			System.out.print(">>>");
			int select = s.nextInt();
			switch (select) {
			case 1:
				SearchSV.menu(guest, s, sL, memberDTOs, reviewDTOs, showDTOs, dramaDTOs, varietyDTOs);
				break;
			case 2:
				LoginSV.menu(s, memberDTOs, loginState);
				break;
			case 3:
				FindSV.menu(s, memberDTOs);
				break;
			default:
				System.out.println("1~3값만 입력하세요.");

			}
		} // while close

	}// main close

}// class close
