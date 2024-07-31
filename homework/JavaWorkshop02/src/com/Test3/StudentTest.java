package com.Test3;

public class StudentTest {
	public static void main(String args[]) {
		Student studentArray[] = new Student[3];

		// Student 객체를 3개 생성하여 배열에 넣는다
		studentArray[0] = new Student("홍길동", 15, 170, 80);
		studentArray[1] = new Student("한사람", 13, 180, 70);
		studentArray[2] = new Student("임걱정", 16, 175, 65);

		System.out.println("이름\t나이\t신장\t몸무게");

		// 각 학생의 정보를 출력
		for (int i = 0; i < studentArray.length; i++) {
			Student student = studentArray[i];
			System.out.println(student.studentInfo());
		}

		// 합계 계산을 위한 변수 초기화
		double totalAge = 0;
		double totalHeight = 0;
		double totalWeight = 0;
		// 최소, 최대 값을 찾기 위한 초기화 (배열 0을 넣는 이유는 비교를 위해 초기값 설정)
		int minAge = studentArray[0].getAge();
		int maxAge = studentArray[0].getAge();
		int minHeight = studentArray[0].getHeight();
		int maxHeight = studentArray[0].getHeight();
		int minWeight = studentArray[0].getWeight();
		int maxWeight = studentArray[0].getWeight();
		// 최소, 최대 값을 가진 학생의 이름을 저장할 변수 초기화
		String minAgeStu = studentArray[0].getName();
		String maxAgeStu = studentArray[0].getName();
		String minHeightStu = studentArray[0].getName();
		String maxHeightStu = studentArray[0].getName();
		String minWeightStu = studentArray[0].getName();
		String maxWeightStu = studentArray[0].getName();

		// 각 학생의 정보를 반복문으로 돌면서 합계를 계산하고, 최소/최대 값 바꾸기(업데이트)
		for (int i = 0; i < studentArray.length; i++) {
			Student student = studentArray[i];
			int age = student.getAge();
			int height = student.getHeight();
			int weight = student.getWeight();

			// 나이, 신장, 몸무게의 합계를 계산
			totalAge += age;
			totalHeight += height;
			totalWeight += weight;

			// 최소 나이와 해당 학생의 이름 업데이트
			if (age < minAge) {
				minAge = age;
				minAgeStu = student.getName();
			}

			// 최대 나이와 해당 학생의 이름 업데이트
			if (age > maxAge) {
				maxAge = age;
				maxAgeStu = student.getName();
			}

			// 최소 신장과 해당 학생의 이름 업데이트
			if (height < minHeight) {
				minHeight = height;
				minHeightStu = student.getName();
			}

			// 최대 신장과 해당 학생의 이름 업데이트
			if (height > maxHeight) {
				maxHeight = height;
				maxHeightStu = student.getName();
			}

			// 최소 몸무게와 해당 학생의 이름 업데이트
			if (weight < minWeight) {
				minWeight = weight;
				minWeightStu = student.getName();
			}

			// 최대 몸무게와 해당 학생의 이름 업데이트
			if (weight > maxWeight) {
				maxWeight = weight;
				maxWeightStu = student.getName();
			}
		}

		// 평균 계산
		double ageAvg = totalAge / studentArray.length;
		double heightAvg = totalHeight / studentArray.length;
		double weightAvg = totalWeight / studentArray.length;

		// 평균 값을 출력 (소수점 이하 4째 자리에서 반올림하고 3째 자리까지 표현)
        int ageAvgInt = (int) ageAvg;
        int ageAvgDec = (int) ((ageAvg - ageAvgInt) * 1000 + 0.5);

        int heightAvgInt = (int) heightAvg;
        int heightAvgDec = (int) ((heightAvg - heightAvgInt) * 1000 + 0.5);

        int weightAvgInt = (int) weightAvg;
        int weightAvgDec = (int) ((weightAvg - weightAvgInt) * 1000 + 0.5);

        // 평균 값을 문자열로 변환하여 출력 (%03d : 0=>0으로 채우기, 3=>최소 자릿수(0 3개), d=>정수)
        String ageAvgStr = ageAvgInt + "." + String.format("%03d", ageAvgDec);
        String heightAvgStr = heightAvgInt + "." + String.format("%03d", heightAvgDec);
        String weightAvgStr = weightAvgInt + "." + String.format("%03d", weightAvgDec);

        // 평균 값 출력
        System.out.println("\n나이 평균: " + ageAvgStr);
        System.out.println("신장 평균: " + heightAvgStr);
        System.out.println("몸무게 평균: " + weightAvgStr);
        System.out.println();
		
        // printf %.f 사용법
//		System.out.printf("\n나이 평균: %.3f%n", ageAvg);
//		System.out.printf("신장 평균: %.3f%n", heightAvg);
//		System.out.printf("몸무게 평균: %.3f%n", weightAvg);
//		System.out.println();

		// 최소/최대 값을 가진 학생의 정보를 출력
		System.out.println("나이가 가장 많은 학생: " + maxAgeStu);
		System.out.println("나이가 가장 적은 학생: " + minAgeStu);
		System.out.println("신장이 가장 큰 학생: " + maxHeightStu);
		System.out.println("신장이 가장 작은 학생: " + minHeightStu);
		System.out.println("몸무게가 가장 많이 나가는 학생: " + maxWeightStu);
		System.out.println("몸무게가 가장 적게 나가는 학생: " + minWeightStu);
	}
}