package com.example.dietexercise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dietexercise.dao.DietDao;
import com.example.dietexercise.vo.DietEntry;

@Service
public class DietService {
	@Autowired
    private DietDao dietDao;
    
    public void saveDiet(String date, String breakfast, String lunch, String dinner) {
        dietDao.saveDiet(date, breakfast, lunch, dinner);
    }
    
    public List<DietEntry> loadDiet(String date, String breakfast, String lunch, String dinner) {
        return dietDao.loadDiet(date, breakfast, lunch, dinner);
    }
}




