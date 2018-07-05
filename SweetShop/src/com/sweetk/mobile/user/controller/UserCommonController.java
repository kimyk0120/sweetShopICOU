package com.sweetk.mobile.user.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sweetk.mobile.user.mapper.UserCommonMapper;




@Controller
@RequestMapping("/user/*")
public class UserCommonController{
	Logger log = Logger.getLogger(UserCommonController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 

    @Transactional
    @RequestMapping(value = "/common/delFavorite.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected @ResponseBody String DelFavorite(HttpServletRequest req, HttpSession session, HttpServletResponse resp,@RequestParam("shopSeq") int shopSeq) throws Exception  {
    		
    		int userSeq = Integer.parseInt(session.getAttribute("userSeq").toString());

    		UserCommonMapper mapper = sqlSession.getMapper(UserCommonMapper.class);
    		
    		int a = mapper.delFavorite(userSeq,shopSeq);
    		
    		HashMap<String, String> resultMap = new HashMap<String, String>();
    		if(a==1){
        		resultMap.put("result", "success");
        	}else{
        		resultMap.put("result", "error");
        	}
    		Gson gson = new Gson();
    		return gson.toJson(resultMap);
    }
    
    @Transactional
    @RequestMapping(value = "/common/addFavorite.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected @ResponseBody String AddFavorite(HttpServletRequest req, HttpSession session, HttpServletResponse resp,@RequestParam("shopSeq") int shopSeq) throws Exception  {
    	
		int userSeq = Integer.parseInt(session.getAttribute("userSeq").toString());

		UserCommonMapper mapper = sqlSession.getMapper(UserCommonMapper.class);
		
		int a = mapper.addFavorite(userSeq,shopSeq);
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(a==1){
    		resultMap.put("result", "success");
    	}else{
    		resultMap.put("result", "error");
    	}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
    }
    
}
