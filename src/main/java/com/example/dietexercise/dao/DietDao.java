package com.example.dietexercise.dao;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.dietexercise.vo.DietEntry;

@Mapper
public interface DietDao {
    
    @Insert("""
            INSERT INTO dietEntry 
                SET `date` = #{date}
                , breakfast = #{breakfast}
                , lunch = #{lunch}
                , dinner = #{dinner}
            """)
    public void saveDiet(String date, String breakfast, String lunch, String dinner);

    @Select("""
            SELECT *
                FROM dietEntry
            """)
    List<DietEntry> loadDiet(@Param("date") String date,
                             @Param("breakfast") String breakfast,
                             @Param("lunch") String lunch,
                             @Param("dinner") String dinner);
}

