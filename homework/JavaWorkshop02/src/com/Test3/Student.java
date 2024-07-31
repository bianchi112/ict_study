package com.Test3;

public class Student {
    private String name; // 학생의 이름
    private int age;	 // 학생의 나이
    private int height;  // 학생의 신장
    private int weight;  // 학생의 몸무게

    // 기본 생성자
    public Student() {
    }

    // 매개변수가 있는 생성자
    public Student(String name, int age, int height, int weight) {
        this.name = name;       // 이름을 설정합니다.
        this.age = age;         // 나이를 설정합니다.
        this.height = height;   // 신장을 설정합니다.
        this.weight = weight;   // 몸무게를 설정합니다.
    }

    // 학생의 이름, 나이, 신장, 몸무게를 출력
    public String studentInfo() {
        return name + "\t" + age + "\t" + height + "\t" + weight;
    }

    // 이름 반환
    public String getName() {
        return name;
    }

    // 이름 설정
    public void setName(String name) {
        this.name = name;
    }

    // 나이 반환
    public int getAge() {
        return age;
    }

    // 나이 설정
    public void setAge(int age) {
        this.age = age;
    }

    // 신장 반환
    public int getHeight() {
        return height;
    }

    // 신장 설정
    public void setHeight(int height) {
        this.height = height;
    }

    // 몸무게 반환
    public int getWeight() {
        return weight;
    }

    // 몸무게 설정
    public void setWeight(int weight) {
        this.weight = weight;
    }
}
