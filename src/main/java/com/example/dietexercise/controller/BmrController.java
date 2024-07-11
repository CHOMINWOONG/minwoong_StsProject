package com.example.dietexercise.controller;

import com.example.dietexercise.vo.BmrRequest;
import com.example.dietexercise.vo.BmrResponse;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class BmrController {

    @PostMapping("/calculateBmr")
    public BmrResponse calculateBmr(@RequestBody BmrRequest request) {
        double bmr;

        if ("남".equals(request.getGender())) {
            bmr = 88.36 + (13.4 * request.getWeight()) + (4.8 * request.getHeight()) - (5.7 * request.getAge());
        } else {
            bmr = 447.6 + (9.2 * request.getWeight()) + (3.1 * request.getHeight()) - (4.3 * request.getAge());
        }

        return new BmrResponse(bmr);
    }
}


