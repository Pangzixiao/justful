package com.xzl.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface IntroduceDao {
    @Select("select * from t_introduce where user_id = #{id}")
    Map<String,Object> queryIntroduceByid(int id);

    int addIntroduce(Map<String, Object> param);

    int updateIntroduceById(Map<String, Object> param);

    @Select("select * from t_introduce where user_id = #{id}")
    List<Map<String,Object>> queryIntroducesByid(int user_id);
}
