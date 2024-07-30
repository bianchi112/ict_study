package com.ict.day05;

public class Homework {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// Q4
		
		int h = 4; 
        for (int i = 0; i < h; i++) {
            for (int j = 0; j < h - i - 1; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }
            System.out.println();
        }
        
        System.out.println("-------------------");
        
        int height = 4; 
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < 2 * height - 1; j++) {
                if (j >= height - i - 1 && j <= height + i - 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
        
        System.out.println("-------------------");
		// Q5
        int n = 4;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }
            System.out.println();
        }
        // 역 삼각형
        for (int i = n - 2; i >= 0; i--) {
            for (int j = 0; j < n - i - 1; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }
            System.out.println(); 
        }
        System.out.println("-------------------");
        
        int n1 = 7; // 삼각형의 높이 설정

        for (int i = 0; i < n1; i++) {
            // 정방향 삼각형 출력
            for (int j = 0; j < n1 - i - 1; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }

            // 역방향 삼각형 출력
            for (int j = 0; j < n1 - i - 1; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }

            System.out.println();
        }
        
        System.out.println("-------------------");
        for (int i = 0; i < 7; i++) {
            if (i <= 3) {
                for (int j = 0; j < 3 - i; j++) {
                    System.out.print(" ");
                }
                for (int j = 0; j < 2 * i + 1; j++) {
                    System.out.print("*");
                }
                System.out.println();
            } else {
                for (int j = 0; j < i - 3; j++) {
                    System.out.print(" ");
                }
                for (int j = 0; j < 7 - 2 * (i - 3); j++) {
                    System.out.print("*");
                }
                System.out.println();
            }
        }   
	}

}
