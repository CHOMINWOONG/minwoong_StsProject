package com.example.dietexercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dietexercise.util.Util;

@Controller
public class UsrChooseController {

    @GetMapping("/usr/choose/writeBmr")
    public String showForm() {
        return "usr/choose/writeBmr";
    }

    @PostMapping("/usr/choose/calculateBmr")
    public String calculateBmr(@RequestParam String gender, @RequestParam int age, @RequestParam double weight, @RequestParam double height, Model model) {
        double bmr = Util.calculateBMR(gender, age, weight, height);
        model.addAttribute("bmr", bmr);
        return "writeBmr";
    }
}

