package com.xzl.service;

import com.xzl.dao.TypeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TypeService {
    @Resource
    TypeDao typeDao;

    public List<Map<String,Object>> getType1(){
        return typeDao.getType1();
    }

    public List<Map<String,Object>> getType2(int id1) {
        return typeDao.getType2(id1);
    }

    public List<Map<String,Object>> getType3(int id2) {
        return typeDao.getType3(id2);
    }

    public List<Map<String,Object>> getType2ByP1(int p1) {
        return typeDao.getTypeByP1(p1);
    }

    public boolean addType1(String pname) {
        return typeDao.addType1(pname)==1;
    }

    public boolean addType2(String pname, int p1) {
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("pname",pname);
        param.put("p1",p1);
        return typeDao.addType2(param)==1;
    }

    public boolean deleteType1ByP1(int p1) {
        List<Integer> nums = typeDao.getIdsByP1(p1);
        for (int p2 : nums){
            System.out.println(typeDao.delType3ByP2(p2));
        }
        typeDao.delType2ByP1(p1);
        return (typeDao.delType1ByP1(p1)==1);
    }

    public Map<String,Object> getTypeByP1(int p1) {
        return typeDao.getType1ByP1(p1);
    }

    public boolean updateType1(Map<String, Object> param) {
        return typeDao.updateType1(param)==1;
    }

    public List<Map<String,Object>> getType3Byp2(int p2) {
        return typeDao.getType3Byp2(p2);
    }

    public boolean addType3(String pname, int p2) {
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("pname",pname);
        param.put("p2",p2);
        return typeDao.addType3(param)==1;
    }

    public boolean deleteType2ByP2(int p2) {
        typeDao.delType3ByP2(p2);
        return (typeDao.delType2ByP2(p2)==1);
    }

    public boolean deleteType3ByP3(int p3) {
        return typeDao.delType3ByP3(p3)==1;
    }

    public Map<String,Object> getType2ByP2(int p2) {
        return typeDao.getType2ByP2( p2);
    }

    public Map<String,Object> getType3ByP3(int p3) {
        return typeDao.getType3ByP3( p3);
    }

    public boolean updateType2(Map<String, Object> param) {
        return typeDao.updateType2(param)==1;
    }

    public boolean updateType3(Map<String, Object> param) {
        return typeDao.updateType3(param)==1;
    }


}
