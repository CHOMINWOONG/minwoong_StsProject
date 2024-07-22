package com.example.dietexercise.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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
    List<DietEntry> loadDiet();

    @Delete("""
    		DELETE FROM dietEntry
    			WHERE `date` = #{date}
                AND breakfast = #{breakfast}
                AND lunch = #{lunch}
                AND dinner = #{dinner}
    		""")
	public void deleteDiet(String date, String breakfast, String lunch, String dinner);
}

