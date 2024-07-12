package com.example.dietexercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.dietexercise.bmrService.BmrService;
import com.example.dietexercise.vo.BmrRequest;
import com.example.dietexercise.vo.BmrResponse;

@RestController
@RequestMapping("/api")
public class BmrController {
    @Autowired
    private BmrService bmrService;

    @PostMapping("/calculateBmr")
    public BmrResponse calculateBmr(@RequestBody BmrRequest request) {
        double bmr = bmrService.calculateBmr(request.getGender(), request.getAge(), request.getWeight(), request.getHeight());
        double tdee = bmrService.calculateTdee(bmr, request.getActivity());
        return new BmrResponse(bmr, tdee);
    }
}





