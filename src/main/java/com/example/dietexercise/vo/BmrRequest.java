package com.example.dietexercise.vo;

public class BmrRequest {
	private String gender;
    private int age;
    private double weight;
    private double height;
    private double activity;

    // 기본 생성자
    public BmrRequest() {}

    // 생성자
    public BmrRequest(String gender, int age, double weight, double height, double activity) {
        this.gender = gender;
        this.age = age;
        this.weight = weight;
        this.height = height;
        this.activity = activity;
    }

    // getter와 setter
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

	public double getActivity() {
		// TODO Auto-generated method stub
		return 0;
	}
}

