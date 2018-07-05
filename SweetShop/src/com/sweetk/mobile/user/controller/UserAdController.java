package com.sweetk.mobile.user.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.mobile.user.mapper.UserPromotionMapper;
import com.sweetk.mobile.user.vo.UserPromotionVO;
import com.sweetk.web.common.constants.Constant;




@Controller
@RequestMapping("/user/*")
public class UserAdController{
	Logger log = Logger.getLogger(UserAdController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 

    
    // 홍보전단 리스트
    @RequestMapping(value = "/ad.do", method = {RequestMethod.GET})
    protected ModelAndView ad(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {
    
    	ModelAndView mav = new ModelAndView("user/ad/ad_list");
    	int seq = Integer.parseInt(req.getParameter("userSeq"));
    	
    	//37.5759879,126.9747342
    	double userLat;
    	double userLong;
    	if(req.getParameter("userLat")==null||"".equals(req.getParameter("userLat").toString())){
    		userLat = 37.5759879; 
    		userLong = 126.9747342; 
    		
    	}else{
    		System.out.println(req.getQueryString());
    		userLat = Double.parseDouble(req.getParameter("userLat").toString());
    		userLong = Double.parseDouble(req.getParameter("userLong").toString());
    	}
    	session.setAttribute("userLat", userLat);
    	session.setAttribute("userLong", userLong);
    	session.setAttribute("userSeq", seq);
//    	System.out.println("userSeq =  " + seq + " ,  userLat = " + userLat + " , userLong = " + userLong );
    	
    	UserPromotionMapper mapper = sqlSession.getMapper(UserPromotionMapper.class);

	    int cnt  = mapper.selectPromotionCnt(seq);
	    //홍보전단 없을때 
	    if(cnt==0){
	    	mav.setViewName("user/ad/ad_empty");
	    	return mav;
	    }
	    
	    int page = 0;
    	int pageSize = Constant.PAGE_SIZE;
	    
	    ArrayList<UserPromotionVO> promotionList =  mapper.selectPromotionList(seq,userLat,userLong,page,pageSize);
	    
	    /*for(UserPromotionVO a : promotionList ){
	    	System.out.println("a.getDistanceKmeter() : " + a.getDistanceKmeter());
	    	System.out.println("a.getDistanceMeter() : " + a.getDistanceMeter());
	    }*/
	    
	    Date curDate = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String todayDate = sdf.format(curDate);
	    
	    mav.addObject("promotionList",promotionList);
	    mav.addObject("todayDate",todayDate);
    	
    	return mav;
	}
	
    @RequestMapping(value = "/adScrollLoad.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected ModelAndView adScrollLoad(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	ModelAndView mav = new ModelAndView("user/ad/ad_list_temp");
    	UserPromotionMapper mapper = sqlSession.getMapper(UserPromotionMapper.class);

   	 	int page = Integer.parseInt(req.getParameter("page"));
		int seq = Integer.parseInt(session.getAttribute("userSeq").toString()); 
		double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
    	
    	page = page*10;
		int pageSize = Constant.PAGE_SIZE;
		
		ArrayList<UserPromotionVO> promotionList =  mapper.selectPromotionList(seq,userLat,userLong,page,pageSize);
		
	    Date curDate = new Date();
   	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   	    String todayDate = sdf.format(curDate);
   	    
   	    mav.addObject("promotionList",promotionList);
   	    mav.addObject("todayDate",todayDate);
		
		return mav;
    }   	
	
    @RequestMapping(value = "/adDel.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected void adDel(HttpServletRequest req, HttpSession session, HttpServletResponse resp, @RequestParam("down_seq") int downSeq) throws Exception  {
    	
    	log.info("adDel cont called....");
    	System.out.println("downSeq: " + downSeq);
    	UserPromotionMapper mapper = sqlSession.getMapper(UserPromotionMapper.class);
    	int a = mapper.deleteDownPromotion(downSeq);
    	
    	HashMap<String, String> resultMap = new HashMap<String, String>();
    	if(a==1){
    		resultMap.put("result", "success");
    	}else{
    		resultMap.put("result", "error");
    	}
		Gson gson = new Gson();
		PrintWriter printWriter = resp.getWriter();
		printWriter.print(gson.toJson(resultMap));
		printWriter.close();
    		
    }

    @RequestMapping(value = "/adWhere.do", method = {RequestMethod.GET})
    protected ModelAndView adWhere(HttpServletRequest req, HttpSession session, HttpServletResponse resp,@RequestParam("promotionSeq") int promotionSeq) throws Exception {
    	
    	UserPromotionMapper mapper = sqlSession.getMapper(UserPromotionMapper.class);
    	ModelAndView mav = new ModelAndView("/user/ad/ad_where");
    	
    	int userSeq  = Integer.parseInt(session.getAttribute("userSeq").toString());
    	double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
    	
    	UserPromotionVO vo = mapper.selectPromotionDetail(userSeq,userLat,userLong,promotionSeq);
    	
    	Date curDate = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String todayDate = sdf.format(curDate);
	    
	    mav.addObject("shopLat",vo.getShop_location_lat());
	    mav.addObject("shopLong",vo.getShop_location_long());
	    mav.addObject("todayDate",todayDate);
    	mav.addObject("pl",vo);
    	
    	return mav;
    }
    
    @Transactional
    @RequestMapping(value = "/adDetail.do", method = {RequestMethod.GET})
    protected ModelAndView adDetail(HttpServletRequest req, HttpSession session, HttpServletResponse resp,@RequestParam("promotionSeq") int promotionSeq) throws Exception {

    	UserPromotionMapper mapper = sqlSession.getMapper(UserPromotionMapper.class);
    	ModelAndView mav = new ModelAndView("/user/ad/ad_detail");
    	
    	int userSeq  = Integer.parseInt(session.getAttribute("userSeq").toString());
    	double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
//    	System.out.println("userSeq : " +  userSeq + " , promotionSeq : " + promotionSeq); // 5, 12 
    	
    	mapper.insertPromotionViewCnt(promotionSeq,userSeq);
    	UserPromotionVO vo = mapper.selectPromotionDetail(userSeq,userLat,userLong,promotionSeq);
    	
    	Date curDate = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String todayDate = sdf.format(curDate);
    	
	    mav.addObject("userSeq",userSeq);
	    mav.addObject("todayDate",todayDate);
    	mav.addObject("pl",vo);
    	
    	return mav;
    }
    
}
