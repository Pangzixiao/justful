package com.xzl.controller;

import com.github.pagehelper.PageInfo;
import com.xzl.service.*;
import javafx.beans.binding.ObjectExpression;
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
@RequestMapping("/user")
public class UserController {
    @Resource
    UserService userService;
    @Resource
    IntroduceService introduceService;
    @Resource
    PositionService positionService;
    @Resource
    CompanyService companyService;
    @Resource
    ApplyService applyService;
    @Resource
    TypeService typeService;

    @RequestMapping("/regist")
    public ModelAndView regist(@RequestParam Map<String, Object> param, HttpSession session) {
        ModelAndView mav = new ModelAndView("/u_login");
        boolean b = userService.regist(param);
        if (!b) {
            mav.setViewName("/u_regist");
            mav.addObject("msg", "用户名已存在");
        }

        return mav;
    }

    @RequestMapping("/getIndex")
    public ModelAndView getUserIndex(HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:/userMain");
        String username = (String) session.getAttribute("user_login");
        if (username == null || username.equals("")) {
            mav.setViewName("error");
            mav.addObject("msg", "请先登录");
        }
        return mav;
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpSession session, @RequestParam Map<String, Object> param) {
        ModelAndView mav = new ModelAndView("userMain");
        boolean b = userService.login(param);
        if (!b) {
            mav.setViewName("/u_login");
            mav.addObject("msg", "用户名错误或密码错误");
        } else {
            session.setAttribute("user_login", param.get("username"));
        }
        return mav;
    }

    @RequestMapping("/showIntroduce")
    public ModelAndView showIntroduce(HttpSession session) {
        ModelAndView mav = new ModelAndView("u_showIntroduce");
        String username = (String) session.getAttribute("user_login");
        if (username == null || username.equals("")) {
            mav.setViewName("error");
            mav.addObject("msg", "请先登录");
        } else {
            int id = userService.checkIdByName(username);
            Map<String, Object> info = introduceService.queryIntroduceById(id);
            if (info == null || info.isEmpty()) {
                mav.setViewName("u_addIntroduce");
                mav.addObject("id", id);
            } else {
                mav.addObject("info", info);
            }
        }
        return mav;
    }

    @RequestMapping("/addIntroduce")
    public ModelAndView addIntroduce(@RequestParam Map<String, Object> param) {
        ModelAndView mav = new ModelAndView("u_showIntroduce");
        boolean b = introduceService.addIntroduce(param);
        if (!b) {
            mav.setViewName("error");
            mav.addObject("msg", "添加简历失败");
        } else {
            Map<String, Object> info = introduceService.queryIntroduceById(Integer.parseInt((String) param.get("user_id")));
            mav.addObject("info", info);
        }

        return mav;
    }

    @RequestMapping("/queryIntroduce")
    public ModelAndView queryIntroduce(HttpSession session) {
        ModelAndView mav = new ModelAndView("u_editIntroduce");
        String username = (String) session.getAttribute("user_login");
        if (username == null || username.equals("")) {
            mav.setViewName("error");
        } else {
            int id = userService.checkIdByName(username);
            Map<String, Object> info = introduceService.queryIntroduceById(id);
            mav.addObject("info", info);
        }
        return mav;
    }

    @RequestMapping("/updateIntroduceById")
    public ModelAndView updateIntroduceById(@RequestParam Map<String, Object> param) {
        ModelAndView mav = new ModelAndView("userMain");
        boolean b = introduceService.updateIntroduceById(param);
        if (!b) {
            mav.addObject("msg", "修改简历失败");
            mav.setViewName("error");
        }
        return mav;
    }

    @RequestMapping("/selectPositionPre")
    public ModelAndView selectPositionPre() {
        ModelAndView mav = new ModelAndView("u_findPosition");
        List<Map<String, Object>> types = typeService.getType1();
        mav.addObject("types", types);
        return mav;
    }

    @RequestMapping("/findPosition")
    public ModelAndView findPosition(HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam Map<String, ObjectExpression> param) {
        ModelAndView mav = new ModelAndView("u_queriedPosition");
        PageInfo info = positionService.MutiqueryPosition(page, param);
        mav.addObject("info", info);
        session.setAttribute("param", param);
        return mav;
    }

    @RequestMapping("/findPositionPage")
    public ModelAndView findPositionPage(HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page) {
        ModelAndView mav = new ModelAndView("u_queriedPosition");
        Map<String, ObjectExpression> param = (Map<String, ObjectExpression>) session.getAttribute("param");
        PageInfo info = positionService.MutiqueryPosition(page, param);
        mav.addObject("info", info);
        session.setAttribute("param", param);
        return mav;
    }

    @RequestMapping("/queryPositionsByCompanyId")
    public ModelAndView queryPositionsByCompanyId(@RequestParam(required = false, defaultValue = "1") Integer page, int company_id) {
        ModelAndView mav = new ModelAndView("u_companyPositionList");
        PageInfo info = positionService.queryPositionByCompanyId(page, company_id);
        Map<String, Object> comp = companyService.queryCompanyById(company_id);
        mav.addObject("info", info);
        mav.addObject("comp", comp);
        return mav;
    }

    @RequestMapping("/queryPositionById")
    public ModelAndView queryPositionById(int position_id) {
        ModelAndView mav = new ModelAndView("u_showPositionInfo");
        Map<String, Object> info = positionService.queryPositionById(position_id);
        String company_name = (String) info.get("company_name");
        Map<String, Object> com = companyService.queryCompanyByName(company_name);
        mav.addObject("info", info);
        mav.addObject("com", com);
        return mav;
    }

    @RequestMapping("/queryCompanyById")
    public ModelAndView queryCompanyById(int company_id) {
        ModelAndView mav = new ModelAndView("u_showCompanyInfo");
        Map<String, Object> info = companyService.queryCompanyById(company_id);
        mav.addObject("info", info);
        return mav;
    }

    @RequestMapping("/applyPositionById")
    public ModelAndView applyPositionById(HttpSession session, int position_id) {
        ModelAndView mav = new ModelAndView("redirect:/userMain");

        boolean isExit = applyService.isApplyExit(session, position_id);
        if (isExit) {
            mav.setViewName("/u_apply_error");
            mav.addObject("msg", "不可以重复申请");
        } else {
            boolean b = applyService.applyPositionById(session, position_id);
            if (!b) {
                mav.setViewName("error");
                mav.addObject("msg", "请登录");
            }
        }

        return mav;
    }

    @RequestMapping("/showMyApplay")
    public ModelAndView showMyApplay(HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page,
                                     @RequestParam(required = false, defaultValue = "") String apply_status) {
        ModelAndView mav = new ModelAndView("u_showMyApply");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("apply_status", apply_status);
        String username = (String) session.getAttribute("user_login");
        Map<String, Object> m = userService.queryUserByName(username);
        int user_id = (int) m.get("user_id");
        param.put("user_id", user_id);
        PageInfo info = applyService.queryByUserId( page, param);
        mav.addObject("info", info);
        mav.addObject("apply_status", apply_status);
        return mav;
    }
    @RequestMapping("/showMyoutdateApply")
    public ModelAndView showMyoutdateApply(HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page,
                                     @RequestParam(required = false, defaultValue = "") String apply_status) {
        ModelAndView mav = new ModelAndView("u_showMyoutdateApply");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("apply_status", apply_status);
        String username = (String) session.getAttribute("user_login");
        Map<String, Object> m = userService.queryUserByName(username);
        int user_id = (int) m.get("user_id");
        param.put("user_id", user_id);
        PageInfo info = applyService.queryoutByUserId( page, param);
        mav.addObject("info", info);
        mav.addObject("apply_status", apply_status);
        return mav;
    }
    /*@RequestMapping("/myPassApplay")
    public ModelAndView myPassApplay(HttpSession session, @RequestParam(required = false,defaultValue = "1") Integer page,
                                     @RequestParam(required = false,defaultValue = "邀请面试") String apply_status) {
        ModelAndView mav = new ModelAndView("u_showMyPassApply");
        PageInfo info = applyService.queryPassByUserId(session, page, apply_status);
        mav.addObject("info", info);
        return mav;
    }

    @RequestMapping("/myNoPassApplay")
    public ModelAndView myNoPassApplay(HttpSession session, @RequestParam(required = false,defaultValue = "1") Integer page,
                                     @RequestParam(required = false,defaultValue = "抱歉") String apply_status) {
        ModelAndView mav = new ModelAndView("u_showMyNoPassApply");
        PageInfo info = applyService.queryPassByUserId(session, page, apply_status);
        mav.addObject("info", info);
        return mav;
    }*/

    @RequestMapping("/updatePass")
    public ModelAndView updatePass(String oldpassword, String password, HttpSession session) {
        ModelAndView mav = new ModelAndView("u_updateInfo");
        String username = (String) session.getAttribute("user_login");
        if (username == null || username.equals("")) {
            mav.setViewName("error");
            mav.addObject("msg", "请先登录");
        } else {
            Map<String, Object> map = userService.queryUserByName(username);
            String pass = (String) map.get("password");
            if (oldpassword.equals(pass)) {
                boolean b = userService.updatePasswordByName(username, password);
                mav.setViewName("redirect:/userMain");
            } else {
                mav.addObject("msg", "用户名或密码错误");
                mav.setViewName("u_updateInfo");
            }
        }
        return mav;
    }

    @RequestMapping("/layout")
    public ModelAndView layout(HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:/index");
        session.removeAttribute("user_login");
        return mav;
    }

    @RequestMapping("/findJobPre")
    public ModelAndView findJobPre(String p_name){
        ModelAndView mav = new ModelAndView("u_findPosition");
        List<Map<String, Object>> types = typeService.getType1();
        mav.addObject("types", types);
        mav.addObject("p_name",p_name);
        return mav;
    }
}
