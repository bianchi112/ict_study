package workshop02;

public class Test01 {
	public static void main(String[] args) {
		// 입력값을 정수로 변환
		int num1 = Integer.parseInt(args[0]);
		int num2 = Integer.parseInt(args[1]);
		int num3 = Integer.parseInt(args[2]);
		int max;
		int min;
		
		// 입력값이 1~9 인지 검사
		if (num1 < 1 || num1 > 9 || num2 < 1 || num2 > 9 || num3 < 1 || num3 > 9) {
			System.out.println("1~9 사이로 입력하세요");
		} else {
			// 입력값의 최대값과 최소값을 계산
			// 최대값 계산
            if (num1 >= num2 && num1 >= num3) {
                max = num1;
            } else if (num2 >= num1 && num2 >= num3) {
                max = num2;
            } else {
                max = num3;
            }

            // 최소값 계산
            if (num1 <= num2 && num1 <= num3) {
                min = num1;
            } else if (num2 <= num1 && num2 <= num3) {
                min = num2;
            } else {
                min = num3;
            }
            // Math 함수 사용
//			max = Math.max(num1, Math.max(num2, num3));
//			min = Math.min(num1, Math.min(num2, num3));

			System.out.println("입력값 : " + num1 + " " + num2 + " " + num3);
			System.out.println("최대값 : " + max);
			System.out.println("최소값 : " + min);
		}
	}
}
