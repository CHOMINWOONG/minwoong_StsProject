package com.example.dietexercise.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dietexercise.bmrService.BmrService;

@Controller
public class UsrChooseController {
    
    @Autowired
    private BmrService bmrService;

    @GetMapping("/usr/choose/writeBmr")
    public String writeBmr() {
        return "usr/choose/writeBmr";
    }
    
    @PostMapping("/usr/choose/calculateBmr")
    public String calculateBmr(
            @RequestParam String gender, 
            @RequestParam int age, 
            @RequestParam double weight, 
            @RequestParam double height, 
            @RequestParam double activity,
            Model model) {
        double bmr = bmrService.calculateBmr(gender, age, weight, height);
        double tdee = bmrService.calculateTdee(bmr, activity);
        
        model.addAttribute("bmr", bmr);
        model.addAttribute("tdee", tdee);
        
        return "usr/choose/writeBmr";
    }
    
    @GetMapping("/usr/choose/findStore")
    public String findStore() {
        return "usr/choose/findStore";
    }
    
    @PostMapping("/usr/choose/doFindStore")
    public String doFindStore() {
    	
        return "usr/choose/findStore";
    }
    
    @GetMapping("/usr/choose/exercisePlan")
    public String exercisePlan() {
    	return "usr/choose/exercisePlan";
    }
    
    @GetMapping("/usr/exerciseByLevel/beginner")
    public String beginner() {
    	return "usr/exerciseByLevel/beginner";
    }
    
    @GetMapping("/usr/exerciseByLevel/intermediate")
    public String intermediate() {
    	return "usr/exerciseByLevel/intermediate";
    }
    
    @GetMapping("/usr/exerciseByLevel/advanced")
    public String advanced() {
    	return "usr/exerciseByLevel/advanced";
    }
    
}


