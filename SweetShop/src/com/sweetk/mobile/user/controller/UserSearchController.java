package com.sweetk.mobile.user.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sweetk.mobile.user.mapper.SearchMapper;
import com.sweetk.mobile.user.vo.UserPromotionVO;
import com.sweetk.web.common.constants.Constant;


@Controller
@RequestMapping("/user/*")
public class UserSearchController{
	Logger log = Logger.getLogger(UserSearchController.class);

	@SuppressWarnings("unused")
	@Autowired
    private SqlSession sqlSession;
	
	@SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 

    // 검색 페이지
    @RequestMapping(value = "/search.do", method = {RequestMethod.GET})
    protected ModelAndView search_Form(HttpServletRequest req, HttpSession session, HttpServletResponse res) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/search/search_main");
    	
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
    	
    	return mav;
    }
    
    // 검색어 입력 후 로딩 - 검색에에 해당하는 전체 스토어 리스트 출력 , 즐겨찾기 했는지 여부 포함
    @Transactional
    @RequestMapping(value = "/search_result.ajax", method = {RequestMethod.POST})
    protected ModelAndView search_result_ajax(HttpServletRequest req, HttpSession session, HttpServletResponse res
    		,@RequestParam(value="searchText",defaultValue="") String searchText ) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/search/search_temp");
    	SearchMapper mapper = sqlSession.getMapper(SearchMapper.class);
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
    	System.out.println(seq+" , "+ userLat + " , " + userLong + " , " + searchText);
    	int page = 0;
    	int pageSize = Constant.PAGE_SIZE;
    	
		ArrayList<UserPromotionVO> storeList = mapper.getSearchStoreList(seq,userLat,userLong,page,pageSize,searchText);
		mav.addObject("storeList",storeList);
		mav.addObject("searchText",searchText);
    	
    	return mav;
    }

    @RequestMapping(value = "/search_result_scroll_load.ajax", method = {RequestMethod.POST})
    protected ModelAndView search_result_scroll_load(HttpServletRequest req, HttpSession session, HttpServletResponse res
    		,@RequestParam(value="searchText") String searchText ) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/search/search_temp_sub");
    	SearchMapper mapper = sqlSession.getMapper(SearchMapper.class);
    	int page = Integer.parseInt(req.getParameter("page"));
    	
    	System.out.println("page : " + page);
    	System.out.println("searchText : " + searchText);
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	double userLat = Double.parseDouble(session.getAttribute("userLat").toString());
    	double userLong = Double.parseDouble(session.getAttribute("userLong").toString());
    	page = page*10;
		int pageSize = Constant.PAGE_SIZE;
		ArrayList<UserPromotionVO> storeList = mapper.getSearchStoreList(seq,userLat,userLong,page,pageSize,searchText);
		mav.addObject("storeList",storeList);
		
    	return mav;
    }
    
    
}//.class
