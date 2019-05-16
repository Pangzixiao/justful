package com.xzl.controller;

import com.github.pagehelper.PageInfo;
import com.xzl.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/adm")
public class AdminController {
    @Resource
    UserService userService;
    @Resource
    AdmService admService;
    @Resource
    CompanyService companyService;
    @Resource
    IntroduceService introduceService;

    @Resource
    TypeService typeService;


    @RequestMapping("getIndex")
    public ModelAndView getIndex(HttpSession session){
        ModelAndView mav = new ModelAndView("adminMain");
        String username = (String)session.getAttribute("admin_login");
        if(username == null || username.equals("")){
            mav.setViewName("redirect:a_login");
            mav.addObject("msg","请登录");
        }
        return mav;
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpSession session, @RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("adminMain");
        boolean b = admService.login(param);
        if(!b){
            mav.setViewName("a_login");
            mav.addObject("msg","用户名错误或密码错误");
        }else{
            session.setAttribute("admin_login",param.get("username"));
        }
        return mav;
    }

    @RequestMapping("/queryCompanys")
    public ModelAndView queryCompanys(@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("a_editCompany");
        PageInfo info = companyService.queryCompanys(page);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/queryUsers")
    // 默认返回第一页
    public ModelAndView queryUsers(@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("a_edituser");
        PageInfo info = userService.queryUsers(page);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/queryUsersByName")
    public ModelAndView queryUsersByName(String username,@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("a_edituser");
        PageInfo info = userService.queryUsersByName(username,page);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/deleteUserById")
    public ModelAndView deleteUserById(int id){
        ModelAndView mav = new ModelAndView("adminMain");
        boolean b = userService.deleteUserById(id);
        if(!b){
            mav.addObject("msg","程序出现错误");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/queryCompanyById")
    public ModelAndView queryCompanyById(int id){
        ModelAndView mav = new ModelAndView("a_showCompanyInfo");
        Map<String,Object> info = companyService.queryCompanyById(id);
        if(info==null || info.isEmpty()){
            mav.setViewName("redirect:error");
        }
        System.out.println(info.size());
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/deleteCompanyById")
    public ModelAndView deleteCompanyById(int id){
        ModelAndView mav = new ModelAndView("adminMain");
        boolean b = companyService.deleteCompanyById(id);
        if(!b){
            mav.addObject("msg","程序出现错误");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/checkCompanyById")
    public ModelAndView checkCompanyById(int id ){
        ModelAndView mav = new ModelAndView("adminMain");
        boolean b = companyService.checkCompanyById(id);
        if(!b){
            mav.setViewName("/error");
            mav.addObject("msg","审查失败");
        }
        return mav;
    }

    @RequestMapping("/checkUserById")
    public ModelAndView checkUserById(int id ){
        ModelAndView mav = new ModelAndView("adminMain");
        boolean b = userService.checkUserById(id);
        if(!b){
            mav.setViewName("/error");
            mav.addObject("msg","审查失败");
        }
        return mav;
    }

    @RequestMapping("/mutilqueryUsers")
    public ModelAndView mutilqueryUsers(@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam(required = false,defaultValue = "") String check_type,@RequestParam(required = false,defaultValue = "")String username){
        ModelAndView mav = new ModelAndView("a_edituser");
        HashMap<String,Object> param = new HashMap<String, Object>();
        param.put("username",username);
        param.put("check_type",check_type);
        PageInfo info = userService.mutilqueryUsers(page,param);
        mav.addObject("info",info);
        mav.addObject("check_type",check_type);
        mav.addObject("username",username);
        return mav;
    }

    @RequestMapping("/mutiQueryCompany")
    public ModelAndView queryCompanys(@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam(required = false,defaultValue = "") String check_type,@RequestParam(required = false,defaultValue = "")String company_name){
        ModelAndView mav = new ModelAndView("a_editCompany");
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("company_name",company_name);
        param.put("check_type",check_type);
        PageInfo info = companyService.mutiQueryCompany(page,param);
        mav.addObject("info",info);
        mav.addObject("check_type",check_type);
        mav.addObject("company_name",company_name);
        return mav;
    }

    @RequestMapping("/changeCompanyPass")
    public  ModelAndView changeCompanyPass(@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("redirect:/adminMain");
        String company_name = (String) param.get("company_name");
        String c_password = (String)param.get("c_password");
        Map<String ,Object> m = companyService.queryCompanyByName(company_name);
        m.put("c_password",c_password);
        if(m==null || m.isEmpty()){
            mav.setViewName("error");
            mav.addObject("msg","请核对用户名");
        }else{
            boolean b = companyService.changeCompanyPass(m);
            if(!b){
                mav.setViewName("/error");
                mav.addObject("msg","修改密码失败");
            }
        }

        return mav;
    }

    @RequestMapping("/changeUserPass")
    public ModelAndView updatePasswordById(String username ,String password ){
        ModelAndView mav = new ModelAndView("redirect:/adminMain");

        boolean b = userService.updatePasswordByName(username,password);
        if(!b){
            mav.setViewName("/error");
            mav.addObject("msg","修改密码失败");
        }

        return mav;
    }

    @RequestMapping("/showIntroduce")
    public ModelAndView showIntroduce(int id){
        ModelAndView mav = new ModelAndView("u_showIntroduce");
        Map<String,Object> m = introduceService.queryIntroduceById(id);
        if(m==null || m.isEmpty()){
            mav.addObject("msg","暂时还没有简历");
            mav.setViewName("error");
        }
        mav.addObject("info",m);
        return mav;
    }

    @RequestMapping("/type1")
    public ModelAndView getAllType1(){
        ModelAndView mav = new ModelAndView("a_editType1");
        List<Map<String,Object>> list = typeService.getType1();
        mav.addObject("types",list);
        return mav;
    }

    @RequestMapping("/getType2Byp1")
    public ModelAndView getType2Byp1(int p1){
        ModelAndView mav = new ModelAndView("a_editType2");
        List<Map<String,Object>> list = typeService.getType2ByP1(p1);
        mav.addObject("types",list);
        mav.addObject("p1",p1);
        return mav;
    }

    @RequestMapping("/addtype1")
    public ModelAndView addtype1(String pname){
        ModelAndView mav = new ModelAndView("a_editType1");
        if(typeService.addType1(pname)){
            List<Map<String,Object>> list = typeService.getType1();
            mav.addObject("types",list);
        }
        return mav;
    }

    @RequestMapping("/addtype2")
    public ModelAndView addtype2(String pname,int p1){
        ModelAndView mav = new ModelAndView("a_editType2");
        if(typeService.addType2(pname,p1)){
            List<Map<String,Object>> list = typeService.getType2ByP1(p1);
            mav.addObject("types",list);
            mav.addObject("p1",p1);
        }
        return mav;
    }

    @RequestMapping("/deletetype1Byp1")
    public ModelAndView deletetypeByP1(int p1){
        ModelAndView mav = new ModelAndView("a_editType1");
        if(typeService.deleteType1ByP1(p1)){
            List<Map<String,Object>> list = typeService.getType1();
            mav.addObject("types",list);
        }else{
            mav.addObject("msg","删除失败");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/changType1Pre")
    public ModelAndView changType1Pre(int p1){
        ModelAndView mav = new ModelAndView("a_changeType1");
        Map<String ,Object> type = typeService.getTypeByP1(p1);
        mav.addObject("type",type);
        return mav;
    }

    @RequestMapping("/changType2Pre")
    public ModelAndView changType2Pre(int p2,int p1){
        ModelAndView mav = new ModelAndView("a_changeType2");
        Map<String ,Object> type = typeService.getType2ByP2(p2);
        mav.addObject("type",type);
        mav.addObject("p1",p1);
        return mav;
    }

    @RequestMapping("/changType3Pre")
    public ModelAndView changType1Pre(int p3,int p2){
        ModelAndView mav = new ModelAndView("a_changeType3");
        Map<String ,Object> type = typeService.getType3ByP3(p3);
        mav.addObject("type",type);
        mav.addObject("p2",p2);
        return mav;
    }



    @RequestMapping("/updateType1")
    public ModelAndView updateType1(@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("a_editType1");
        if(typeService.updateType1(param)){
            List<Map<String,Object>> list = typeService.getType1();
            mav.addObject("types",list);
        }else{
            mav.addObject("msg","修改失败");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/updateType2")
    public ModelAndView updateType2(@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("a_editType2");
        if(typeService.updateType2(param)){
            String pp1 = (String) param.get("p1");
            int p1 = Integer.parseInt(pp1);
            List<Map<String,Object>> list = typeService.getType2ByP1(p1);
            mav.addObject("types",list);
            mav.addObject("p1",p1);
        }else{
            mav.addObject("msg","修改失败");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/updateType3")
    public ModelAndView updateType3(@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("a_editType3");
        System.out.println(param);
        if(typeService.updateType3(param)){
            String pp2 = (String) param.get("p2");
            int p2 = Integer.parseInt(pp2);
            List<Map<String,Object>> list = typeService.getType3Byp2(p2);
            mav.addObject("types",list);
            mav.addObject("p2",p2);
        }else{
            mav.addObject("msg","修改失败");
            mav.setViewName("error");
        }
        return mav;
    }



    @RequestMapping("/getType3Byp2")
    public ModelAndView getType3Byp2(int p2){
        ModelAndView mav = new ModelAndView("a_editType3");
        List<Map<String,Object>> list = typeService.getType3Byp2(p2);
        mav.addObject("types",list);
        mav.addObject("p2",p2);
        return mav;
    }

    @RequestMapping("/addtype3")
    public ModelAndView addtype3(String pname,int p2){
        ModelAndView mav = new ModelAndView("a_editType3");
        if(typeService.addType3(pname,p2)){
            List<Map<String,Object>> list = typeService.getType3Byp2(p2);
            mav.addObject("types",list);
            mav.addObject("p2",p2);
        }
        return mav;
    }
    @RequestMapping("/delType2ByP2")
    public ModelAndView delType2ByP2(int p2,int p1){
        ModelAndView mav = new ModelAndView("a_editType2");
        if(typeService.deleteType2ByP2(p2)){
            List<Map<String,Object>> list = typeService.getType2ByP1(p1);
            mav.addObject("types",list);
        }else{
            mav.addObject("msg","删除失败");
            mav.setViewName("error");
        }
        mav.addObject("p1",p1);
        return mav;
    }

    @RequestMapping("/delType3ByP3")
    public ModelAndView delType3ByP3(int p3,int p2){
        ModelAndView mav = new ModelAndView("a_editType3");
        if(typeService.deleteType3ByP3(p3)){
            List<Map<String,Object>> list = typeService.getType3Byp2(p2);
            mav.addObject("types",list);
        }else{
            mav.addObject("msg","删除失败");
            mav.setViewName("error");
        }
        mav.addObject("p2",p2);
        return mav;
    }

    @RequestMapping("/checkCompany")
    public ModelAndView checkCompany(@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("a_editCompany");
        Map<String,Object> param = new HashMap<String, Object>();
        String check_type = "未审批";
        param.put("check_type",check_type);
        PageInfo info = companyService.mutiQueryCompany(page,param);
        mav.addObject("info",info);
        mav.addObject("check_type",check_type);
        return mav;
    }

    @RequestMapping("/checkusers")
    public ModelAndView checkusers(@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("a_edituser");
        Map<String,Object> param = new HashMap<String, Object>();
        String check_type = "未审核";
        param.put("check_type",check_type);
        PageInfo info = userService.mutilqueryUsers(page,param);
        mav.addObject("info",info);
        mav.addObject("check_type",check_type);
        return mav;
    }
    @RequestMapping("/layout")
    public ModelAndView layout(HttpSession session){
        ModelAndView mav = new ModelAndView("index");
        session.removeAttribute("admin_login");
        return mav;
    }
}
