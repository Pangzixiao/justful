package com.xzl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/common")
public class CommenController {
    @RequestMapping("/c_prelogin")
    public ModelAndView c_prelogin(){
        ModelAndView mav = new ModelAndView("c_login");
        return mav;
    }

    @RequestMapping("/u_prelogin")
    public ModelAndView u_prelogin(){
        ModelAndView mav = new ModelAndView("u_login");
        return mav;
    }

    @RequestMapping("/a_prelogin")
    public ModelAndView a_prelogin(){
        ModelAndView mav = new ModelAndView("a_login");
        return mav;
    }

    @RequestMapping("/preregister")
    public ModelAndView preregister(){
        ModelAndView mav = new ModelAndView("register");
        return mav;
    }

    @RequestMapping("/preChangeCom")
    public ModelAndView preChangeCom (){
        ModelAndView mav = new ModelAndView("a_changeComPass");
        return mav;
    }


    @RequestMapping("/preChangeUser")
    public ModelAndView preChangeUser (){
        ModelAndView mav = new ModelAndView("a_changeUserPass");
        return mav;
    }
}
