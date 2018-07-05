package com.sweetk.mobile.user.controller;

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

import com.sweetk.mobile.user.mapper.UserEventMapper;
import com.sweetk.mobile.user.vo.UserEventVO;
import com.sweetk.web.common.utils.StringUtil;

@Controller
@RequestMapping("/user/*")
public class UserEventController{
	Logger log = Logger.getLogger(UserEventController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 
    
    
    // 이벤트 상세(이벤트 상세,사용하기,사용완료)
    @Transactional
    @RequestMapping(value = "/eventDetail.do", method = {RequestMethod.GET})
    protected ModelAndView EventDetail(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {
    	
    	ModelAndView mav = new ModelAndView("user/event/event_detail");
    	UserEventMapper mapper = sqlSession.getMapper(UserEventMapper.class);
    	
    	int userSeq = Integer.parseInt(StringUtil.get(req.getParameter("userSeq")));
    	int eventSeq = Integer.parseInt(StringUtil.get(req.getParameter("eventSeq")));
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
    	session.setAttribute("userSeq",userSeq );
    	session.setAttribute("userLat", userLat);
    	session.setAttribute("userLong", userLong);
    	System.out.println("req.getQueryString() : " + req.getQueryString());
    	
    	mapper.insertEventViewCnt(userSeq,eventSeq);
    	UserEventVO vo =  mapper.selectEventDetail(eventSeq,userLat,userLong,userSeq);
    	mav.addObject("pl",vo);
    	mav.addObject("userSeq",userSeq);
    	mav.addObject("userLat",userLat);
    	mav.addObject("userLong",userLong);
    	
    	int cnt =  mapper.eventDownCheckYN(userSeq,eventSeq);
    	if(cnt>0){
    		int cnt2 = mapper.eventUseCheckYN(userSeq,eventSeq);
    		if(cnt2>0){
    			mav.setViewName("user/event/event_use_finish");
    		}else{
    			mav.setViewName("user/event/event_useForm");
    		}
    		return mav;
    	}
    	
    	return mav;
    }
    
    
    // 이벤트 어디야. ( 지도) 
    @Transactional
    @RequestMapping(value = "/eventWhere.do", method = {RequestMethod.GET})
    protected ModelAndView EventWhere(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {
    	
    	ModelAndView mav = new ModelAndView("user/event/event_where");
    	
    	UserEventMapper mapper = sqlSession.getMapper(UserEventMapper.class);
    	
    	int userSeq = Integer.parseInt(StringUtil.get(req.getParameter("userSeq")));
    	int eventSeq = Integer.parseInt(StringUtil.get(req.getParameter("eventSeq")));
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
    	session.setAttribute("userSeq",userSeq );
    	session.setAttribute("userLat", userLat);
    	session.setAttribute("userLong", userLong);
    	
    	UserEventVO vo =  mapper.selectEventDetail(eventSeq,userLat,userLong,userSeq);
    	
    	// 다운로드 여부 , 사용여부  - '0' : 챙기기,  '1' : 사용하기, 'ˇ2' : 사용완료
    	String useflag = "0";
    	
    	int cnt =  mapper.eventDownCheckYN(userSeq,eventSeq);
    	int cnt2 = mapper.eventUseCheckYN(userSeq,eventSeq);
     	
    	if(cnt>0){
    		useflag = "1";
    		if(cnt2>0){
    			useflag = "2";
    		}
    	}
    	mav.addObject("flag",useflag);
    	mav.addObject("userSeq",userSeq);
    	mav.addObject("pl", vo);
    	mav.addObject("shopLat",vo.getShop_location_lat());
	    mav.addObject("shopLong",vo.getShop_location_long());
	    
    	return mav;
    }
    
    @Transactional
    @RequestMapping(value = "/eventUseOk.do", method = {RequestMethod.POST,RequestMethod.GET})
    protected void EventUse(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {
    	
    	UserEventMapper mapper = sqlSession.getMapper(UserEventMapper.class);
    	int userSeq = Integer.parseInt(StringUtil.get(req.getParameter("userSeq")));
    	int eventSeq = Integer.parseInt(StringUtil.get(req.getParameter("eventSeq")));
    	mapper.insertEventUse(userSeq,eventSeq);
    }
    
      
}
