package com.xzl.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzl.dao.ApplyDao;
import com.xzl.dao.PositionDao;
import javafx.beans.binding.ObjectExpression;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PositionService {
    @Resource
    PositionDao positionDao;
    @Resource
    ApplyDao applyDao;

    public PageInfo queryPositionInfoByCom(Integer page, String company_name ,String p_state) {
        PageHelper.startPage(page,3);
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("company_name",company_name);
        param.put("p_state",p_state);
        List<Map<String,Object>> list = positionDao.queryPositionInfoByCom(param);
        return new PageInfo<Map<String,Object>>(list);
    }

    public boolean newPosition(Map<String, Object> param) {
        param.put("apply_count",0);
        param.put("p_state","有效");
        param.put("p_date",new Date());
        return positionDao.newPosition(param)==1;
    }

    public Map<String,Object> queryPositionById(int position_id) {
        return positionDao.queryPositionById(position_id);
    }

    public boolean updatePosition(Map<String, Object> param) {
        return positionDao.updatePosition(param)==1;
    }

    public boolean delPositionById(int position_id) {
        boolean b = positionDao.delPositionById(position_id)==1;
        boolean flag = true;
        if(b){

            String position_status = "已过期";
            List<Map<String,Object>> list = applyDao.queryApplyByPositionId(position_id);
            for(Map<String,Object> param:list){
                String apply_id = (String) param.get("apply_id");
                flag = applyDao.checkPositionStatus(apply_id,position_status)==1;
                if(!flag)
                    break;
            }
        }
        return (flag&&b);
    }

    public boolean outdate(int position_id) {

        boolean b = positionDao.outdate(position_id)==1;
        List<Map<String,Object>> list = applyDao.queryApplyByPosition(position_id);
        for(Map<String,Object> map:list){
            int apply_id =  (int)map.get("apply_id");
            applyDao.updatePosition_status(apply_id);
        }
        return b;
    }



    public PageInfo MutiqueryPosition(Integer page,Map<String, ObjectExpression> param) {
        PageHelper.startPage(page,3);
        List<Map<String,Object>> list = positionDao.MutiqueryPosition(param);
        return new PageInfo<Map<String,Object>>(list);
    }

    public PageInfo queryPositionByCompanyId(Integer page, int company_id) {
        PageHelper.startPage(page,3);
        List<Map<String,Object>> list = positionDao.queryPositionByCompanyId(company_id);
        return new PageInfo<Map<String,Object>>(list);
    }

    public boolean addCount(int position_id) {
        Map<String,Object> m = positionDao.queryPositionById(position_id);
        int apply_count = (int) m.get("apply_count");
        m.put("apply_count",apply_count+1);
        return positionDao.addCount(m)==1;
    }

    public Map<String,Object> selectPositionById(int position_id) {
        return positionDao.queryPositionById(position_id);
    }
}
