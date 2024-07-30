package com.ict.day04;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		// 키보드로 나라 입력 받아서 해당 나라의 수도를 출력하자.
		// 데이터의 없는 나라는 데이터 없음 표시하자.
		// 한국 = 서울, 중국 = 베이징, 일본 = 도쿄, 미국 = 워싱턴

		System.out.print("나라 입력 : ");
		String country = scan.next();
		String capital = "";
		switch (country) {
		case "한국":
			capital = "서울";
			break;
		case "중국":
			capital = "베이징";
			break;
		case "일본":
			capital = "도쿄";
			break;
		case "미국":
			capital = "워싱턴";
			break;
		default:
			capital = "데이터 없음";
			break;
		}
		System.out.println(country+"의 수도는 " + capital + "입니다.");

	}

}
