package com.xzl.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface ApplyDao {
    @Select("select * from t_apply where position_id = #{position_id}")
    List<Map<String,Object>> queryApplyByPositionId(int position_id);

    @Update("update t_apply set position_status = #{position_status} where apply_id = #{apply_id}")
    int checkPositionStatus(String apply_id, String position_status);

    int saveApply(Map<String, Object> param);
    @Select("select a.* , p.p_name,p.p_cname,p.salary,p.p_address ,p.company_id from t_apply a left outer join  t_position p on a.position_id = p.position_id where a.user_id = #{user_id} and a.position_status=#{position_status} and a.apply_status='已申请'")
    List<Map<String,Object>> queryApplyByUserId(Map<String, Object> param);

    @Select("select a.* , p.p_name,p.p_cname,p.salary,p.p_address from t_apply a left outer join  t_position p on a.position_id = p.position_id where a.position_id = #{position_id} and a.position_status='有效'")
    List<Map<String,Object>> queryApplyByPosition(int position_id);

    List<Map<String,Object>> queryApplyByCom(Map<String, Object> p_cname);

    @Select("select a.* , p.p_name,p.p_cname,p.salary,p.p_address ,p.company_id from t_apply a left outer join  t_position p on a.position_id = p.position_id where a.user_id = #{user_id} and a.apply_status=#{apply_status} and a.position_status='有效'")
    List<Map<String,Object>> queryPassApplyByUserId(Map<String, Object> param);

    @Select("select a.* , p.p_name,p.p_cname,p.salary,p.p_address from t_apply a left outer join  t_position p on a.position_id = p.position_id where p.p_cname = #{p_cname} and a.position_status='有效' and a.apply_status!='已申请'")
    List<Map<String,Object>> dealedApplyByCom(String p_cname);

    @Update("update t_apply set apply_status='抱歉' where apply_id = #{apply_id}")
    int updateApplay(int apply_id);

    @Update("update t_apply set apply_status='邀请面试' where apply_id = #{apply_id}")
    int mianshi(int apply_id);

    @Select("select a.* , p.p_name,p.p_cname,p.salary,p.p_address from t_apply a left outer join  t_position p on a.position_id = p.position_id where p.p_cname = #{p_cname} and a.position_status='有效' and a.apply_status='邀请面试'")
    List<Map<String,Object>> passedApplyByCom(String p_cname);

    @Update("update t_apply set position_status='失效' where apply_id = #{apply_id} " )
    int updatePosition_status(int apply_id);

    @Select("select a.* , p.p_name,p.salary,p.p_address from t_apply a left outer join  t_position p on a.position_id = p.position_id where p.p_cname = #{p_cname} and a.position_status='有效' and a.apply_status='邀请面试' order by position_id")
    List<Map<String,Object>> queryApplyByComs(String p_cname);
}
