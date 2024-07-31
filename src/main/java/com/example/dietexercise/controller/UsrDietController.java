package com.example.dietexercise.controller;

import java.util.HashMap;


import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
    public String showDietPage(Model model) {
        List<DietEntry> dietEntries = dietService.loadDiet();
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
    public List<DietEntry> loadDiet() {
        return dietService.loadDiet();
    }
    
    @PostMapping("/deleteDiet")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteDiet(@RequestBody Map<String, Object> map) {
        Map<String, Object> response = new HashMap<>();
        try {
            dietService.deleteDiet((String) map.get("date"), (String) map.get("breakfast"), (String) map.get("lunch"), (String) map.get("dinner"));
            response.put("success", true);
            response.put("message", "식단이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "식단 삭제에 실패했습니다.");
        }
        return ResponseEntity.ok(response);
    }
}



