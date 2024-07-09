package com.show.SV;
import java.util.ArrayList;
import java.util.Scanner;

import com.show.DTO.DramaDTO;
import com.show.DTO.ShowDTO;
import com.show.DTO.VarietyDTO;

public class SearchListSV {

	// 드라마, 예능 등 프로그램 정보 담고 있는 리스트 관리 클래스

	public static Scanner sL = new Scanner(System.in);

	public static ArrayList<DramaDTO> dramas; // 드라마 객체 배열
	public static ArrayList<VarietyDTO> varieties; // 예능 객체 배열
	public static ArrayList<ShowDTO> allList; // 드라마 + 예능 배열 합칠 부모클래스 배열

	public SearchListSV() {
		// 리스트에 미리 값 추가
		dramas = new ArrayList<DramaDTO>();
		varieties = new ArrayList<VarietyDTO>();
		

		dramas.add(new DramaDTO("Tving", "로맨스", "선재업고튀어", "윤종호, 이시은", "변우석, 김혜윤, 송건희, 이승협, 정영주, 성병숙 등",
				"만약, 당신의 최애를 구할 수 있는 기회가 된다면? \n삶의 의지를 놓아버린 순간, 자신을 살게 해줬던 유명아티스트 류선재 \n그의 죽음으로 절망했던 열성팬 임솔이 최애를 살리기 위해 시간을 거슬러 2008년으로 돌아간다!\n다시 살게 된 열아홉, 목표는 최애 류선재를 지키는 것!"));

		dramas.add(1, new DramaDTO("Netflix", "로맨스", "이번 생도 잘 부탁해", "이나정, 최영림, 한아름", "신혜선, 안보현, 하윤경, 안동구",
				"반지음에겐 전생을 기억할 수 있는 신비한 능력이 있다. \n18회차 인생이 이른 나이에 끝난 후 다시 태어난 그녀.\n이번 생은 어느덧 어른이 된 어린 시절의 사랑을 찾는데 올인한다."));

		dramas.add(2, new DramaDTO("Tving, Nexflix", "로맨스", "낮과 밤이 다른 그녀", "이형민, 박지하", "이정은, 정은지, 최진혁",
				"어느날 갑자기 노년타임에 갇혀버린 취준생과 낮과 밤 올 타임 \n그녀에게 휘말린 능력캐 검사의 기상천외한 인턴쉽과 앙큼달콤 로맨틱 코미디를 그리는 드라마"));

		dramas.add(3, new DramaDTO("Tving, Netflix", "판타지", "미씽:그들이있었다", "민연홍, 반기리", "고수, 허준호, 안소희, 하준, 서은수, 송건희",
				"실종된 사망자들이 모인 영혼 마을을 배경으로, 사라진 시체를 찾고 \n사건배후의 진실을 쫓는 미스터리 추적 판타지"));

		dramas.add(4, new DramaDTO("Tving, Netflix", "판타지", "경이로운 소문", "유선동, 김새봄", "조병규, 유준상, 김세정, 엄혜란 등",
				"악귀 사냥꾼 '카운터'들이 국수집 직원으로 위장해, 지상의 악귀들을 물리치는 \n통쾌하고 땀내나는 악귀타파 히어로물"));

		dramas.add(5, new DramaDTO("Tving", "액션", "스틸러", "최준배, 신경일", "주원, 이주우, 조한철, 김재원, 최화정, 이덕화 등",
				"베일에 싸인 문화재 도둑 스컹크와 비공식 문화재 환수팀 '카르마'가 뭉쳐, \n법이 심판하지 못하는 자들을 상대로 펼치는 케이퍼 코믹액션"));

		dramas.add(new DramaDTO("Tving", "판타지", "이재, 곧 죽습니다", "하병훈", "서인국, 박소담, 김지훈, 이재욱, 이도현, 고윤정 등",
				"지옥으로 떨어지기 직전의 이재가 12번의 죽음과 삶을 경험하게 되는 인생 환승 드라마"));

		dramas.add(new DramaDTO("Netflix", "액션", "마이네임", "김바다, 김진민", "한소희, 박희순, 안보현, 김상호, 이학주, 장률",
				"겉으로는 마약 범죄를 소탕하는 경찰. \n하지만 실제로 그녀가 충성을 바치는 인물은 따로 있다. \n그것은 바로, 그녀에게 새로운 삶을 주고 복수의 길을 열어준 범죄 조직의 보스"));

		dramas.add(new DramaDTO("Tving", "스릴러", "운수 오진날", "필감성, 김민성, 송한나", "이성민, 유연석, 이정은",
				"평범한 택시기사 오택이 고액을 제시하는 지방행 손님을 태우고 가다 \n그가 연쇄살인마임을 깨닫게 되면서 공포의 주행을 시작하게 되는 이야기"));

		varieties.add(new VarietyDTO("Netflix", "예능", "지구마불 세계여행", "김태호", "노홍철, 주우재, 주현영, 빠니보틀, 원지, 곽준빈",
				"주사위를 던져 그 결과에 따라 다음 목적지가 정해지는 일생일대의 모험을 시작한다.\n우승자에게는 우주여행이 기다리고 있다!!"));

	}

//	public void searchTitle(String title) { // 제목으로 검색
//		for (DramaDTO dramaTitle : dramas) {
//			if (dramaTitle.getTitle().equalsIgnoreCase(title)) {
//				dramaTitle.showList(Integer.toString(i));
//			}
//		}
//	}

	public void searchCategory(String category) { // 카테고리별 검색
		int i = 1;
		for (DramaDTO dramaCategory : dramas) {
			if (dramaCategory.getCategory().equalsIgnoreCase(category)) {
				dramaCategory.showList(Integer.toString(i));
				// System.out.println(drama2.no);
				i++; // 번호 생성해주는 변수 

			}
		}
	}// searchCategory 메서드

	public void searchProgram(String program) {
		// program 종류에 따라 리스트 출력하는 메서드
		int i = 1;
		for (DramaDTO ott : dramas) {
			if (ott.getProgram().equalsIgnoreCase(program)) {
				ott.showList(Integer.toString(i));
				i++;
			}
		}
	}// searchProgram 메서드

	public void searchVariety(String category) {
		// 예능 category 출력 메서드
		int i = 1;
		for (VarietyDTO variety : varieties) {
			if (variety.getCategory().equalsIgnoreCase(category)) {
				System.out.println(variety.getNo());
				i++;
			}
		}
	}// searchProgram 메서드
	
	public void searchTitle(String kwd1) {
		// program 종류에 따라 리스트 출력하는 메서드
		int i = 1;
		for (DramaDTO ott : dramas) {
			if (ott.getTitle().equalsIgnoreCase(kwd1)) {
				ott.showList(Integer.toString(i));
				i++;
			}
		}
	}// searchProgram 메서드
	
	public void searchNo(int pNo) {
		// 번호에 따라 출력하는 메서드
		for (DramaDTO ott : dramas) {
			try {
				if (ott.getNo().equalsIgnoreCase(Integer.toString(pNo))) {
					System.out.println(ott.toString());
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
//				System.out.println(e);
			}
		}
	}// searchProgram 메서드

	public void search() { // 검색 기능 가능한 메서드 (보류)
		int i = 0;
		allList = new ArrayList<ShowDTO>();
		allList.addAll(dramas);
		allList.addAll(varieties);
		// 부모객체 ArrayList 에 자식객체 리스트 합침.
		System.out.println("----- 검 색 -----");
		String kwd = sL.nextLine();
		for (ShowDTO allLists : allList) { // 향상된 for 문 사용
			// 출력값 문제있음(보류..)
			if (allLists.getActor().contains(kwd)) {
				allLists.showList(Integer.toString(i));
			} else if (allLists.getCategory().contains(kwd)) {
				allLists.showList(Integer.toString(i));
			} else if (allLists.getDirector().contains(kwd)) {
				allLists.showList(Integer.toString(i));
			} else if (allLists.getTitle().contains(kwd)) {
				allLists.showList(Integer.toString(i));
			} else if (allLists.getProgram().contains(kwd)) {
				allLists.showList(Integer.toString(i));
			} 

		} // for
	}
}
