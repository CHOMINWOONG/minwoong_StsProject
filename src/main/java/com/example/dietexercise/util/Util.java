package com.example.dietexercise.util;

public class Util {
	
    public static double calculateBMR(String gender, int age, double weight, double height) {
    	
        if (gender.equals("male")) {
            return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
        } else if (gender.equals("female")) {
            return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
        } else {
            throw new IllegalArgumentException("성별은 'male' 또는 'female'로 입력해주세요.");
        }
    }
}

