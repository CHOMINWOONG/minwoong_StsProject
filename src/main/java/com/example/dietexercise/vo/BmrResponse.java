package com.example.dietexercise.vo;

public class BmrResponse {
    private double bmr;

    // 기본 생성자
    public BmrResponse() {}

    // 생성자
    public BmrResponse(double bmr) {
        this.bmr = bmr;
    }

    // getter와 setter
    public double getBmr() {
        return bmr;
    }

    public void setBmr(double bmr) {
        this.bmr = bmr;
    }
}
