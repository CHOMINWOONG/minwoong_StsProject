package com.example.dietexercise.vo;

public class BmrResponse {
    private double bmr;
    private double tdee;
    // 기본 생성자
    public BmrResponse() {}

    // 생성자
    public BmrResponse(double bmr, double tdee) {
        this.bmr = bmr;
        this.tdee = tdee;
    }

    // getter와 setter
    public double getBmr() {
        return bmr;
    }

    public void setBmr(double bmr) {
        this.bmr = bmr;
    }
}
