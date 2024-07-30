package com.ict.day11;

public class Ex01 {
	// 인자를 기본자료형으로 전달 받음
	// 값 호출(Call By Value)
	// 원본 값이 변경하지 않는다.
	public int add(int k) {
		++k;
		return k;
	}

	// 인자를 배열, 객체로 전달 받음
	// 참조(주소) 호출(Call By Reference)
	// 원본 값이 변한다.
	public void add2(int[] k) {
		for (int i = 0; i < k.length; i++) {
			k[i] = k[i] + 10;
		}
	}

}
