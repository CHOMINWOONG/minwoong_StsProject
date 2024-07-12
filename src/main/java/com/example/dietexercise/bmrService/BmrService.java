package com.example.dietexercise.bmrService;

import org.springframework.stereotype.Service;

@Service
public class BmrService {
    public double calculateBmr(String gender, int age, double weight, double height) {
        if ("남".equals(gender)) {
            return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
        } else {
            return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
        }
    }

    public double calculateTdee(double bmr, double activity) {
        return bmr * activity;
    }
}



