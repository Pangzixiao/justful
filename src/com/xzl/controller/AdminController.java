package com.xzl.controller;

import com.github.pagehelper.PageInfo;
import com.xzl.service.AdmService;
import com.xzl.service.CompanyService;
import com.xzl.service.IntroduceService;
import com.xzl.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
            mav.setViewName("redirect:a_login");
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
    public ModelAndView mutilqueryUsers(@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam Map<String,Object>param){
        ModelAndView mav = new ModelAndView("a_edituser");
        PageInfo info = userService.mutilqueryUsers(page,param);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/mutiQueryCompany")
    public ModelAndView queryCompanys(@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam Map<String,Object>param){
        ModelAndView mav = new ModelAndView("a_editCompany");
        PageInfo info = companyService.mutiQueryCompany(page,param);
        mav.addObject("info",info);
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
}
