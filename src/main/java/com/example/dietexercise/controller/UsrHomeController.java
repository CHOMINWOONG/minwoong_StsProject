package com.example.dietexercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "usr/home/main";
	}
	

}
