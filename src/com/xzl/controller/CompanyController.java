package com.xzl.controller;

import com.github.pagehelper.PageInfo;
import com.xzl.service.ApplyService;
import com.xzl.service.CompanyService;
import com.xzl.service.PositionService;
import com.xzl.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/company")
public class CompanyController {
    @Resource
    CompanyService companyService;
    @Resource
    PositionService positionService;
    @Resource
    TypeService typeService;
    @Resource
    ApplyService applyService;

    @RequestMapping("/c_regist")
    public ModelAndView regist(@RequestParam Map<String,Object> param, HttpSession session){
        ModelAndView mav = new ModelAndView("redirect:/c_login");
        param.put("check_type","未审批");
        Date date = new Date();
        param.put("regist_date",date);
        boolean b = companyService.regist(param);
        if( !b ){
            mav.setViewName("/c_regist");
            mav.addObject("msg","用户名已存在");
        }


        return mav;
    }

    @RequestMapping("/c_login")
    public ModelAndView login(HttpSession session,@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("companyMain");
        boolean b = companyService.login(param);
        if(!b){
            mav.setViewName("redirect:c_login");
            mav.addObject("msg","用户名错误或密码错误");
        }else{
            session.setAttribute("company_login",param.get("company_name"));
            Map<String,Object> m = companyService.queryCompanyByName((String)param.get("company_name"));
            mav.addObject("info",m);
        }
        return mav;
    }

    @RequestMapping("/getIndex")
    public ModelAndView getIndex(HttpSession session){
        ModelAndView mav = new ModelAndView("companyMain");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
        }else{
            Map<String , Object> info = companyService.queryCompanyByName(company_name);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/queryCompanyInfo")
    public ModelAndView queryCompanyInfo (HttpSession session){
        ModelAndView mav = new ModelAndView("c_editCompanyInfo");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
        }else{
            Map<String , Object> info = companyService.queryCompanyByName(company_name);
            mav.addObject("info",info);
        }
        return mav;

    }

    @RequestMapping("/updateCompanyInfo")
    public ModelAndView updateCompanyInfo(@RequestParam Map<String,Object> param){
        ModelAndView mav = new ModelAndView("c_showCompanyInfo");
        boolean b = companyService.updateCompany(param);
        if(!b){
            mav.setViewName("error");
            mav.addObject("msg","修改公司名称失败");
        }
        String company_name = (String ) param.get("company_name");
        Map<String,Object> info = companyService.queryCompanyByName(company_name);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/showCompanyInfo")
    public ModelAndView showCompanyInfo(HttpSession session){
        ModelAndView mav = new ModelAndView("c_showCompanyInfo");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
        }else{
            Map<String , Object> info = companyService.queryCompanyByName(company_name);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/queryPositionInfoByCom")
    public ModelAndView queryPositionInfo(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("c_editPositionInfo");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{
            PageInfo info  = positionService.queryPositionInfoByCom(page,company_name);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/showPositionById")
    public ModelAndView showPositionById(int position_id){
        ModelAndView mav = new ModelAndView("c_showPosition");
        Map<String,Object> info = positionService.queryPositionById(position_id);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/addPosition")
    public ModelAndView addPosition(HttpSession session){
        ModelAndView mav = new ModelAndView("c_newPosition");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
        }else{
            Map<String,Object> info = companyService.queryCompanyByName(company_name);
            mav.addObject("info",info);
            List<Map<String,Object>> types = typeService.getType1();
            mav.addObject("types",types);
        }
        return mav;
    }

    @RequestMapping("/newPosition")
    public ModelAndView newPosition(@RequestParam Map<String,Object> param,HttpSession session){
        ModelAndView mav = new ModelAndView("companyMain");
        boolean b = positionService.newPosition(param);
        if(!b){
            mav.setViewName("error");
            mav.addObject("msg","添加职位失败");
        }
        Map<String,Object> info = companyService.getCompanyInfo(session);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/queryPositionById")
    public ModelAndView queryPositionById(int position_id){
        ModelAndView mav = new ModelAndView("c_updatePosition");
        Map<String,Object> info = positionService.selectPositionById(position_id);
        mav.addObject("info",info);
        List<Map<String,Object>> types = typeService.getType1();
        mav.addObject("types",types);
        return mav;
    }

    @RequestMapping("/updatePosition")
    public ModelAndView updatePosition(@RequestParam Map<String,Object> param,HttpSession session){
        ModelAndView mav = new ModelAndView("redirect:/companyMain");
        boolean b = positionService.updatePosition(param);
        if(!b){
            mav.setViewName("error");
            mav.addObject("msg","职位信息修改失败");
        }
        Map<String,Object> info = companyService.getCompanyInfo(session);
        mav.addObject("info",info);
        return mav;
    }

    @RequestMapping("/outdate")
    public ModelAndView outdate(HttpSession session,int position_id){
        ModelAndView mav = new ModelAndView("redirect:/companyMain");
        boolean b = positionService.outdate(position_id);
        if(!b){
            mav.addObject("msg","职位失效失败");
            mav.setViewName("error");
        }
        Map<String,Object> info = companyService.getCompanyInfo(session);
        mav.addObject("info",info);
        return mav;
    }
    @RequestMapping("/delPositionById")
    public ModelAndView delPositionById(int position_id){
        ModelAndView mav = new ModelAndView("redirect:/companyMain");
        boolean b = positionService.delPositionById(position_id);
        if(!b){
            mav.addObject("msg","职位删除失败");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/type2" )
    @ResponseBody
    public List<Map<String,Object>> getType2(@RequestParam int id1){
        List<Map<String,Object>> type2 = typeService.getType2(id1);
        System.out.println(type2);
        return type2;
    }

    @RequestMapping("/type3")
    @ResponseBody
    public List<Map<String,Object>> getType3(int id2){
        List<Map<String,Object>> type3 = typeService.getType3(id2);
        return type3;
    }

    @RequestMapping("/queryApplyByCom")
    public ModelAndView queryApplyByCom(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("c_showDoApplyByCom");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{

            PageInfo info = applyService.queryApplyByCom(page,session);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/dealedApplyByCom")
    public ModelAndView dealedApplyByCom(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("c_showNoDoApplyByCom");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{

            PageInfo info = applyService.dealedApplyByCom(page,session);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/passedApplyByCom")
    public ModelAndView passedApplyByCom(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page){
        ModelAndView mav = new ModelAndView("c_showPassApplyByCom");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{

            PageInfo info = applyService.passedApplyByCom(page,session);
            mav.addObject("info",info);
        }
        return mav;
    }

    @RequestMapping("/queryApplyByPositionId")
    public  ModelAndView queryApplyByPositionId(@RequestParam(required = false,defaultValue = "1") Integer page,int position_id){
        ModelAndView mav = new ModelAndView("c_showApplyByPosition");
        mav.addObject("position_id",position_id);
        PageInfo info = applyService.queryApplyByPositionId(page,position_id);
        mav.addObject("info",info);
        mav.addObject("id",position_id);
        return mav;
    }

    @RequestMapping("/updateApplay")
    public ModelAndView updateApplay(int apply_id){
        ModelAndView mav = new ModelAndView("redirect:/companyMain");
        if(! applyService.updateApplay(apply_id)){
            mav.addObject("msg","修改申请信息失败");
            mav.setViewName("/error");
        }
        return mav;
    }

    @RequestMapping("/mianshi")
    public ModelAndView mianshi(int apply_id){
        ModelAndView mav = new ModelAndView("redirect:/companyMain");
        if(! applyService.mianshi(apply_id)){
            mav.addObject("msg","修改申请信息失败");
            mav.setViewName("/error");
        }
        return mav;
    }
}
