package com.example.dietexercise.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate; // RestTemplate import 추가


import com.example.dietexercise.bmrService.BmrService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
    @GetMapping("/usr/exerciseByLevel/getSearchExercise")
    public String getSearchExercise() {
    	return "usr/exerciseByLevel/getSearchExercise";
    }
    
    @PostMapping("/usr/exerciseByLevel/searchExercise")
    @ResponseBody
    public void doSearchExercise(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String query = request.getParameter("query").toLowerCase();
        String apiUrl = "https://wger.de/api/v2/exercise/?language=2&status=2&name=" + query;

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Accept", "application/json");

        ResponseEntity<String> apiResponse = restTemplate.exchange(apiUrl, HttpMethod.GET, null, String.class);
        if (apiResponse.getStatusCode() == HttpStatus.OK) {
            String jsonResponse = apiResponse.getBody();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
        } else {
            response.sendError(HttpStatus.BAD_REQUEST.value(), "API 호출 실패");
        }
    }
}


