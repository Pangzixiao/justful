package com.xzl.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzl.dao.ApplyDao;
import com.xzl.dao.IntroduceDao;
import com.xzl.dao.UserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class ApplyService {
    @Resource
    ApplyDao applyDao;
    @Resource
    UserDao userDao;
    @Resource
    PositionService positionService;
    @Resource
    IntroduceDao introduceDao;

    public boolean applyPositionById(HttpSession session,int position_id) {
        String username = (String)session.getAttribute("user_login");
        if(username == null || username.equals("")){
            return false;
        }else{
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("username",username);
            Map<String,Object> m  = userDao.queryByName(param);
            int user_id = (int) m.get("user_id");
            Map<String,Object> p = new HashMap<String, Object>();
            p.put("user_id",user_id);
            p.put("position_id",position_id);
            p.put("position_status","有效");
            p.put("apply_status","已申请");
            p.put("apply_date",new Date());
            if(applyDao.saveApply(p)==1){
                return positionService.addCount(position_id);
            }else{
                return false;
            }
        }
    }

    public PageInfo queryByUserId(HttpSession session,Integer page, String position_status) {
        PageHelper.startPage(page,3);
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("position_status",position_status);
        String username = (String)session.getAttribute("user_login");
        Map<String,Object> p = new HashMap<String, Object>();
        p.put("username",username);
        Map<String,Object> m  = userDao.queryByName(p);
        int user_id = (int) m.get("user_id");
        param.put("user_id",user_id);
        List<Map<String,Object>> list = applyDao.queryApplyByUserId(param);
        return new PageInfo<Map<String,Object>>(list);
    }

    public PageInfo queryApplyByPositionId(Integer page, int position_id) {
        PageHelper.startPage(page,3);
        List<Map<String,Object>> list = applyDao.queryApplyByPosition(position_id);
        return new PageInfo<Map<String,Object>>(list);
    }

    public PageInfo queryApplyByCom(Integer page,HttpSession session,String apply_status) {
        PageHelper.startPage(page,3);
        Map<String ,Object> param = new HashMap<String, Object>();
        String p_cname = (String)session.getAttribute("company_login");
        param.put("p_cname",p_cname);
        param.put("apply_status",apply_status);
        List<Map<String,Object>> list = applyDao.queryApplyByCom(param);
        return new PageInfo<Map<String,Object>>(list);
    }

    public List<Map<String,Object>> queryApplyByCom(HttpSession session) {
        String p_cname = (String)session.getAttribute("company_login");
        List<Map<String,Object>> apply = applyDao.queryApplyByComs(p_cname);
        List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
        for(Map<String,Object> m : apply){
            int user_id = (int)m.get("user_id");
            List<Map<String , Object>> intrs = introduceDao.queryIntroducesByid(user_id);
            if(!intrs.isEmpty()){
                Map<String,Object> intr = intrs.get(0);
                String fullname = (String)intr.get("fullname");
                String school = (String) intr.get("school");
                String major = (String) intr.get("major");
                String sex = (String) intr.get("sex");
                String now_address = (String)intr.get("now_address");
                m.put("fullname",fullname);
                m.put("school",school);
                m.put("major",major);
                m.put("sex",sex);
                m.put("now_address",now_address);
            }

            Map<String , Object> user = userDao.queryUserById(user_id);
            if(!user.isEmpty()){
                String username = (String)user.get("username");
                String tel = (String)user.get("tel");

                m.put("username",username);
                m.put("tel",tel);
            }

            list.add(m);
        }
        return list;
    }

    public PageInfo queryPassByUserId(HttpSession session, Integer page, String apply_status) {
        PageHelper.startPage(page,3);
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("position_status",apply_status);
        String username = (String)session.getAttribute("user_login");
        Map<String,Object> p = new HashMap<String, Object>();
        p.put("username",username);
        Map<String,Object> m  = userDao.queryByName(p);
        int user_id = (int) m.get("user_id");
        param.put("user_id",user_id);
        param.put("apply_status",apply_status);
        List<Map<String,Object>> list = applyDao.queryPassApplyByUserId(param);
        return new PageInfo<Map<String,Object>>(list);
    }

    public PageInfo dealedApplyByCom(Integer page, HttpSession session) {
        PageHelper.startPage(page,3);
        Map<String ,Object> param = new HashMap<String, Object>();
        String p_cname = (String)session.getAttribute("company_login");
        List<Map<String,Object>> list = applyDao.dealedApplyByCom(p_cname);
        return new PageInfo<Map<String,Object>>(list);
    }

    public boolean updateApplay(int apply_id) {
        return applyDao.updateApplay(apply_id)==1;
    }

    public boolean mianshi(int apply_id) {
        return applyDao.mianshi(apply_id)==1;
    }

    public PageInfo passedApplyByCom(Integer page, HttpSession session) {
        PageHelper.startPage(page,3);
        Map<String ,Object> param = new HashMap<String, Object>();
        String p_cname = (String)session.getAttribute("company_login");
        List<Map<String,Object>> list = applyDao.passedApplyByCom(p_cname);
        return new PageInfo<Map<String,Object>>(list);
    }
}
