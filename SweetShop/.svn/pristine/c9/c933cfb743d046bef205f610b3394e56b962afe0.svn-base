package com.sweetk.mobile.user.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.mobile.user.mapper.AlarmMapper;
import com.sweetk.mobile.user.vo.AlarmVO;
import com.sweetk.web.common.utils.StringUtil;


@Controller
@RequestMapping("/user/*")
public class UserSettingController{
	Logger log = Logger.getLogger(UserSettingController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 

    
    
    // 설정 페이지
    @Transactional
    @RequestMapping(value = "/setting.do", method = {RequestMethod.GET})
    protected ModelAndView settingForm(HttpServletRequest req, HttpSession session, HttpServletResponse res) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/setting/setting");
    	
    	int seq = Integer.parseInt(req.getParameter("userSeq"));
    	String appVersion = StringUtil.get(req.getParameter("appVersion"));
    	mav.addObject("appVersion",appVersion);
    	session.setAttribute("userSeq", seq);
    	AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
    	
    	// 알람설정이 없을때 인서트
    	int cnt = mapper.selectAlarmUserYN(seq);
    	// 유저가 처음 들어왔을때
    	if(cnt<=0){
    		
    		mapper.insertUserToAlarm(seq);
    		mav.addObject("pushSettingYn","Y");
    		
    	}else{  // 유저가 있을때
    		int ynCnt = mapper.selectAlarmYnCount(seq);
    		if(ynCnt>0){
    			mav.addObject("pushSettingYn","Y");
    		}else{
    			mav.addObject("pushSettingYn","N");
    		}
    	}
    	return mav;
    }
    
    
    // 알람설정 폼
    @Transactional
    @RequestMapping(value = "/alarm.do", method = {RequestMethod.GET})
    protected ModelAndView alarm(HttpServletRequest req, HttpSession session, HttpServletResponse res) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/setting/setting_alarm");
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
		
    	AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		
    	// 알람설정이 없을때 인서트
//		int cnt = mapper.selectAlarmUserYN(seq);
//		if(cnt<=0){
//			mapper.insertUserToAlarm(seq);
//		}
		
		HashMap<String, AlarmVO> alarmSetting = mapper.selectAlarmSetting(seq);
		mav.addObject("alarmSetting",new Gson().toJson(alarmSetting));
    	return mav;
	}

    
    // 알람 설정 모두 0 으로
    @RequestMapping(value = "/allAlarmToZero.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected @ResponseBody String AllAlarmToZero(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws IOException  {
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	HashMap<String, String> resultMap = new HashMap<String, String>();
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int a = mapper.allAlarmToZero(seq);
		if(a>0){
			resultMap.put("result", "true");
		}else{
			resultMap.put("result", "false");
		}
		return new Gson().toJson(resultMap);
    }

    
    // 알랑 설정 모두 1로 
    @RequestMapping(value = "/allAlarmToOne.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected @ResponseBody String AllAlarmToOne(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws IOException  {
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	HashMap<String, String> resultMap = new HashMap<String, String>();
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int a = mapper.allAlarmToOne(seq);
		if(a>0){
			resultMap.put("result", "true");
		}else{
			resultMap.put("result", "false");
		}
		return new Gson().toJson(resultMap);
    }
    
    @RequestMapping(value = "/alarmOneChange.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected  @ResponseBody String alarmOneChange(HttpServletRequest req, HttpSession session, HttpServletResponse resp, AlarmVO vo) throws IOException  {
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	HashMap<String, String> resultMap = new HashMap<String, String>();
    	vo.setUser_seq(seq);
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int a=0;
		if(vo.getAlarmValue().equals("1")){
			a = mapper.alarmOneChangeToTrue(vo);
		}else{
			a = mapper.alarmOneChange(vo);
		}
		
		if(a>0){
			resultMap.put("result", "true");
		}else{
			resultMap.put("result", "false");
		}
    	Gson gson = new Gson();
		return gson.toJson(resultMap);
    }
}
