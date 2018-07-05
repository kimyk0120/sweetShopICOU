package com.sweetk.mobile.user.controller;

import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import com.sweetk.mobile.user.mapper.UserLikeitMapper;
import com.sweetk.mobile.user.vo.UserPromotionVO;
import com.sweetk.web.common.constants.Constant;



@Controller
@RequestMapping("/user/*")
public class UserLikeItController{
	Logger log = Logger.getLogger(UserLikeItController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 
    
    @Transactional
    @RequestMapping(value = "/likeit.do", method = {RequestMethod.GET})
    protected ModelAndView LikeList(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

    	ModelAndView mav = new ModelAndView("user/likeit/like_list");
    	
    	int seq = Integer.parseInt(req.getParameter("userSeq"));
    	//37.5759879,126.9747342
    	double userLat;
    	double userLong;
    	if(req.getParameter("userLat")==null||"".equals(req.getParameter("userLat").toString())){
    		userLat = 37.5759879; 
    		userLong = 126.9747342; 
    		
    	}else{
    		userLat = Double.parseDouble(req.getParameter("userLat").toString());
    		userLong = Double.parseDouble(req.getParameter("userLong").toString());
    	}
    	session.setAttribute("userSeq", seq);
    	session.setAttribute("userLat", userLat);
    	session.setAttribute("userLong", userLong);
    	
    	UserLikeitMapper mapper = sqlSession.getMapper(UserLikeitMapper.class);
    	
	    int cnt  = mapper.selectLikeCnt(seq);;
	    if(cnt==0){
	    	mav.setViewName("user/likeit/like_empty");
	    	return mav;
	    }
	    
	    int page = 0;
    	int pageSize = Constant.PAGE_SIZE;
	    
	    ArrayList<UserPromotionVO> likeList =  mapper.selectLikeList(seq,userLat,userLong,page,pageSize);
	    mav.addObject("likeList",likeList);
    	
    	return mav;
	}
    
    
    @RequestMapping(value = "/likeitScrollLoad.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected ModelAndView likeitScrollLoad(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	ModelAndView mav = new ModelAndView("user/likeit/like_list_temp");
    	UserLikeitMapper mapper = sqlSession.getMapper(UserLikeitMapper.class);
    	
    	int page = Integer.parseInt(req.getParameter("page"));
		int seq = Integer.parseInt(session.getAttribute("userSeq").toString()); 
		double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
    	
    	page = page*10;
		int pageSize = Constant.PAGE_SIZE;
    	
	    ArrayList<UserPromotionVO> likeList =  mapper.selectLikeList(seq,userLat,userLong,page,pageSize);
   	    mav.addObject("likeList",likeList);
    	
    	return mav;
    }   	
    
      
}
