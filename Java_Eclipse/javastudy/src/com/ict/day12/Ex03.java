package com.ict.day12;

public class Ex03 {
	private String cardName;
	private int lim_money;

	// 생성자는 다른 생성자를 호출 할 수 있음
	// 첫번째 줄에 this([인자]) 사용
	public Ex03() {
		this("국민카드");
		lim_money = 3000000;
		System.out.println("기본생성자");
	}

	public Ex03(String cardname) {
		this.cardName = cardname;
		this.lim_money = 2000000;
	}

	public void getCard() {
		System.out.println("카드사는 " + cardName + "입니다.");
	}
}
