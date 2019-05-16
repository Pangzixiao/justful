package com.xzl.controller;

import com.github.pagehelper.PageInfo;
import com.xzl.service.*;
import com.xzl.util.ExportExcel;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
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
    @Resource
    IntroduceService introduceService;

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
    public ModelAndView queryPositionInfo(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam(required = false,defaultValue = "") String p_state){
        ModelAndView mav = new ModelAndView("c_editPositionInfo");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{
            PageInfo info  = positionService.queryPositionInfoByCom(page,company_name,p_state);
            mav.addObject("info",info);
            mav.addObject("p_state",p_state);
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
        return type2;
    }

    @RequestMapping("/type3")
    @ResponseBody
    public List<Map<String,Object>> getType3(int id2){
        List<Map<String,Object>> type3 = typeService.getType3(id2);
        return type3;
    }

    @RequestMapping("/queryApplyByCom")
    public ModelAndView queryApplyByCom(HttpSession session,@RequestParam(required = false,defaultValue = "1") Integer page,@RequestParam(required = false,defaultValue = "") String apply_status ){
        ModelAndView mav = new ModelAndView("c_dealApplyByCom");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{

            PageInfo info = applyService.queryApplyByCom(page,session,apply_status);
            mav.addObject("info",info);
            mav.addObject("apply_status",apply_status);
        }
        return mav;
    }

    /*@RequestMapping("/dealedApplyByCom")
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
    }*/

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
    @ResponseBody
    public  void exports(HttpSession session ,HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.reset(); //清除buffer缓存
        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
        // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
        String fn = "users";
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(fn.getBytes("GBK"),"ISO-8859-1")+".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires",0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        List<Map<String,Object>> list = applyService.queryApplyByCom(session);
        workbook = new ExportExcel().export_excel(list);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("/changeComPass")
    public ModelAndView changeComPass(HttpSession session,String oldpassword,String password){
        ModelAndView mav = new ModelAndView("/c_changePass");
        String company_name = (String)session.getAttribute("company_login");
        if(company_name == null || company_name.equals("")){
            mav.setViewName("error");
            mav.addObject("msg","请先登录");
        }else{
            Map<String,Object> map  = companyService.queryCompanyByName(company_name);
            String pass = (String) map.get("c_password");
            if(oldpassword.equals(pass)){
                boolean b = companyService.updatePasswordByName(company_name,password);
                Map<String,Object> m = companyService.queryCompanyByName(company_name);
                mav.addObject("info",m);
                mav.setViewName("/companyMain");
            }else{
                mav.addObject("msg","用户名或密码错误");
                mav.setViewName("/c_changePass");
            }
        }
        return mav;
    }

    @RequestMapping("/layout")
    public ModelAndView layout(HttpSession session){
        ModelAndView mav = new ModelAndView("index");
        session.removeAttribute("company_login");
        return mav;
    }
}
