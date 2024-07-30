package com.ict.day04;

public class Ex01 {

	public static void main(String[] args) {
		// 다중 if문 ( if ~ else if 문)
		// 형식) if(조건식1){
		// 조건식1이 참일 때 실행할 문장;
		// 조건식1이 참일 때 실행할 문장;
		// }else if(조건식2){
		// 조건식1에는 거짓이지만, 조건식2에는 참일 때 실행할 문장;
		// 조건식1에는 거짓이지만, 조건식2에는 참일 때 실행할 문장;
		// }else if(조건식3){
		// 조건식1,2에는 거짓이지만, 조건식3에는 참일 때 실행할 문장;
		// 조건식1,2에는 거짓이지만, 조건식3에는 참일 때 실행할 문장;
		// }else{
		// 조건식 1,2,3 모두 거짓인 경우 실행할 문장(나머지)
		// }

		// int k1이 90이상이면 "A", 80이상이면 "B", 70이상이면 "C", 나머지 "F"
		int k1 = 94;
		String str = "";
		if (k1 >= 90) {
			str = "A";
		} else if (k1 >= 80) {
			str = "B";
		} else if (k1 >= 70) {
			str = "C";
		} else {
			str = "F";
		}
		System.out.println("결과 : " + str);

		// char k2가 대문자인지, 소문자인지, 숫자인지, 기타문자인지 판별
		char k2 = '1';
		String str2 = "";
		if (k2 >= 'A' && k2 <= 'Z') {
			str2 = "대문자";
		} else if (k2 >= 'a' && k2 <= 'z') {
			str2 = "소문자";
		} else if (k2 >= '0' && k2 <= '9') {
			str2 = "숫문자";
		} else {
			str2 = "기타문자";
		}
		System.out.println("결과 : " + str2);

		// 나이가 8살 미만이면 1000원, 초등학생(14미만)이면 2000원, 중.고등학생(20살미만)은 2500원
		// 그 이상은 3000원 인 입장료이다.
		// 당신의 입장료는 XXXX원 입니다.
		int age = 12;
		int pay = 0;
		if (age < 8) {
			pay = 1000;
		} else if (age < 14) {
			pay = 2000;
		} else if (age < 20) {
			pay = 2500;
		} else {
			pay = 3000;
		}
		System.out.println("당신의 입장료는 " + pay + "원 입니다.");

		// char k3가 A 이거나 a 이면 아프리카, B 이거나 b 이면 브라질, C 이거나 c 이면 캐나다
		// 나머지는 한국
		char k3 = 'a';
		String str3 = "";
		if (k3 == 'A' || k3 == 'a') {
			str = "아프리카";
		} else if (k3 == 'B' || k3 == 'b') {
			str = "브라질";
		}else if (k3 == 'C' || k3 == 'c') {
			str = "캐나다";
		} else {
			str = "한국";
		}
		System.out.println("당신이 선택한 나라는 " + str+"입니다.");
		
		
		// menu 1이면 카페모카 3500, 2이면 카페라테 4000;
		// 3이면 아메리카노 1500, 4이면 과일쥬스 3000
		// 친구와 2잔을 10000원 내고 주문했다. (부가세 10% 포함시키자)
		// 주문 내역을 출력하시오(지불금액, 선택음료, 단가, 개수, 총 금액, 부가세, 잔돈)
		
		int menu = 3;
		int price = 0;
		int input = 10000;
		String name = "";
		
		// 메뉴가지고 dan, drink가 선택된다.
		if(menu == 1) {
			name = "카페모카";
			price = 3500;
		}else if(menu == 2) {
			name = "카페라테";
			price = 4000;
		}else if(menu == 3) {
			name = "아메리카노";
			price = 1500;
		}else if(menu ==41) {
			name = "과일쥬스";
			price = 3000;
		}
		
		int total = price * 2;
		int vat = (int)(total * 0.1);
		int charge = input - total - vat;
		
		System.out.println("지불금액 : " + input);
		System.out.println("선택음료 : " + name);
		System.out.println("단가 : " + price);
		System.out.println("개수 : " + 2);
		System.out.println("총 금액 : " + total);
		System.out.println("부가세 : " + vat);
		System.out.println("잔돈 : " + charge);
		
		

	}

}
