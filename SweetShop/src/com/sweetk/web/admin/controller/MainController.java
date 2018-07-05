package com.sweetk.web.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MainController{
	Logger log = Logger.getLogger(MainController.class);

    @Autowired
    private PlatformTransactionManager transactionManager;

    @RequestMapping("/main.do")
    protected ModelAndView webView(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(MainController.class);

    	ModelAndView mav = new ModelAndView("main/main");

   	return mav;
	}

}
