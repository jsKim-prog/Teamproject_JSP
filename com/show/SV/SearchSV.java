package com.show.SV;

import java.util.ArrayList;
import java.util.Scanner;

import com.show.DTO.DramaDTO;
import com.show.DTO.MemberDTO;
import com.show.DTO.ReviewDTO;
import com.show.DTO.ShowDTO;
import com.show.DTO.VarietyDTO;

public class SearchSV {
	public static ArrayList<ShowDTO> ShowDTO = new ArrayList<ShowDTO>();
	private static ArrayList<ShowDTO> showDTO;

	public static void menu(MemberDTO lSt, Scanner s, Scanner sL, ArrayList<MemberDTO> loginDTOs,
			ArrayList<ReviewDTO> reviewDTOs, ArrayList<ShowDTO> showDTOs, ArrayList<DramaDTO> dramaDTOs, ArrayList<VarietyDTO> varietyDTOs) {
		
		SearchListSV showList = new SearchListSV();
		
		// 리스트 가진 클래스 사용할 수 있는 빈 객체 생성
		
		// 메뉴 만들어서 
		boolean run = true;
		while (run) {
			System.out.println("============ 검색 창 ==============");
			System.out.println("1. 검색 ");
			System.out.println("2. 장르별 보기");
			System.out.println("3. OTT 시리즈별 보기");
			System.out.println("4. 메인메뉴로 돌아가기");
			int select = s.nextInt();
			switch (select) {

			case 1:
				System.out.println("검색메서드 진입합니다.");
				search(ShowDTO, reviewDTOs, showDTOs, lSt, s, sL,  dramaDTOs, varietyDTOs, showList);
				break;

			case 2:
				
				System.out.println("장르별메서드 진입합니다.");
				categorySearch(ShowDTO, showList, reviewDTOs, showDTOs, lSt, s, sL);
				break;
				
				

			case 3:
				System.out.println("OTT 시리즈 보기");
				showList.searchProgram("Netflix");
				System.out.println("------------------------------");
				showList.searchProgram("Tving");
				System.out.println("------------------------------");
				showList.searchProgram("Tving, Netflix");
				break;

			case 4:
				System.out.println("메인메뉴로 돌아갑니다.");
				run= false;
				break;

			default:
				System.out.println(" 잘못 입력 하셨습니다. 1 ~ 3까지의 번호를 입력 해주세요.");

			}//스위치 종료
		}
		

	}


	private static void categorySearch(ArrayList<com.show.DTO.ShowDTO> showDTO2, SearchListSV showList, ArrayList<ReviewDTO> reviewDTOs,
			ArrayList<com.show.DTO.ShowDTO> showDTOs, MemberDTO lSt, Scanner s, Scanner sL) {
		System.out.println("----- 장르별 작품 보기 -----");
		System.out.println("1.로맨스 \t2.액션");
		System.out.println("3.코미디 \t4.SF");
		System.out.println("5.판타지 \t6.미스터리");
		System.out.println("7.예능 \t8.뒤로가기");
		System.out.print(">> ");
		int no = s.nextInt(); // 메뉴 번호 입력

		switch (no) { // 번호 입력받고 상세정보 제공하는 기능 필요함.
		case 1:
			showList.searchCategory("로맨스");
			System.out.println("--------------------------");
			break;
		case 2:
			showList.searchCategory("액션");
			System.out.println("--------------------------");
			break;
		case 3:
			showList.searchCategory("코미디");
			System.out.println("--------------------------");
			break;
		case 4:
			showList.searchCategory("SF");
			System.out.println("--------------------------");
			break;
		case 5:
			showList.searchCategory("판타지");
			System.out.println("--------------------------");
			break;
		case 6:
			showList.searchCategory("미스터리");
			System.out.println("--------------------------");
			break;
		case 7:
			showList.searchVariety("예능");
			System.out.println("--------------------------");
			break;	
		case 8:
			System.out.println("-----------뒤로가기-----------");
			break;
		default:
			System.out.println("1 ~ 6 번호만 입력하세요");
		}// 장르 switch
		
		
	}


	private static void search(ArrayList<ShowDTO> showDTO, ArrayList<ReviewDTO> reviewDTOs, ArrayList<ShowDTO> showDTOs, MemberDTO lSt, Scanner s,
			Scanner sL, ArrayList<DramaDTO> dramaDTOs, ArrayList<VarietyDTO> varietyDTOs, SearchListSV showList) {
		
		System.out.println(" 검색 하실 제목을 입력해 주세요.");
		System.out.print(">>>");
		String kwd1 = sL.nextLine();
//		System.out.println(kwd1);
		showList.searchTitle(kwd1);
		System.out.println("몇번 컨텐츠를 조회하시겠습니까?");
		System.out.print(">>>");
		int pNo = s.nextInt();
		
		showList.searchNo(pNo);
		
		
		
	}//search close

						
	}