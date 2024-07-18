package com.example.dietexercise.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dietexercise.service.DietService;
import com.example.dietexercise.vo.DietEntry;

@Controller
@RequestMapping("/usr/diet")
public class UsrDietController {

    @Autowired
    private DietService dietService;

    @GetMapping
    public String showDietPage(Model model, String date, String breakfast, String lunch, String dinner) {
        List<DietEntry> dietEntries = dietService.loadDiet(date, breakfast, lunch, dinner);
        model.addAttribute("dietEntries", dietEntries);
        return "dietEntries"; 
    }

    @PostMapping("/saveDiet")
    @ResponseBody
    public String saveDiet(@RequestBody Map<String, Object> map) {
    	dietService.saveDiet((String) map.get("date"), (String) map.get("breakfast"), (String) map.get("lunch"), (String) map.get("dinner"));
        return "{\"success\":true}";
    }

    @GetMapping("/loadDiet")
    @ResponseBody
    public List<DietEntry> loadDiet(String date, String breakfast, String lunch, String dinner) {
        return dietService.loadDiet(date, breakfast, lunch, dinner);
    }
}



