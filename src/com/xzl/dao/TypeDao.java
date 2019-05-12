package com.xzl.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface TypeDao {

    @Select("select * from type1")
    public List<Map<String,Object>> getType1();

    @Select("select distinct p2 pid,pname from type2 where p1 = #{id1}")
    List<Map<String,Object>> getType2(int id1);
    @Select("select distinct p3 pid,pname from type3 where p2 = #{id2}")
    List<Map<String,Object>> getType3(int id2);
    @Select("select a.*,b.pname p1name from type2 a left outer join type1 b on a.p1=b.p1 where a.p1=#{p1}")
    List<Map<String,Object>> getTypeByP1(int p1);

    @Insert("insert into type1(pname)values(#{pname})")
    int addType1(String pname);

    @Insert("insert into type2(pname,p1)values(#{pname},#{p1})")
    int addType2(Map<String,Object> param);

    @Delete("delete from type1 where p1 = #{p1}")
    int delType1ByP1(int p1);

    @Select("select * from type1 where p1 = #{p1}")
    Map<String,Object> getType1ByP1(int p1);

    @Update("update type1 set pname=#{pname} where p1 = #{p1}")
    int updateType1(Map<String, Object> param);

    @Delete("delete from type2 where p1 = #{p1}")
    int delType2ByP1(int p1);

    @Select("select p2 from type2 where p1 = #{p1}")
    List<Integer> getIdsByP1(int p1);

    @Delete("delete from type3 where p2 = #{p2}")
    int delType3ByP2(int p2);

    @Select("select a.*,b.pname p2name from type3 a left outer join type2 b on a.p2=b.p2 where a.p2=#{p2}")
    List<Map<String,Object>> getType3Byp2(int p2);

    @Insert("insert into type3(pname,p2)values(#{pname},#{p2})")
    int addType3(Map<String, Object> param);

    @Delete("delete from type2 where p2 = #{p2}")
    int delType2ByP2(int p2);

    @Delete("delete from type3 where p3 = #{p3}")
    int delType3ByP3(int p3);

    @Select("select * from type2 where p2 = #{p2}")
    Map<String,Object> getType2ByP2(int p2);

    @Select("select * from type3 where p3 = #{p3}")
    Map<String,Object> getType3ByP3(int p3);

    @Update("update type2 set pname = #{pname} where p2 = #{p2}")
    int updateType2(Map<String, Object> param);

    @Update("update type3 set pname = #{pname} where p3 = #{p3}")
    int updateType3(Map<String, Object> param);
}
