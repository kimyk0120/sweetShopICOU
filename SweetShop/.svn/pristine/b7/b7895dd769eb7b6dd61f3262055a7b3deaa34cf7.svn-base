package com.sweetk.mobile.user.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.mobile.user.mapper.UserShopMapper;
import com.sweetk.web.common.utils.StringUtil;

@Controller
@RequestMapping("/user/*")
public class UserShopController {

	Logger log = Logger.getLogger(UserShopController.class);
	
	@Autowired
    private SqlSession sqlSession;
	
    @Autowired 
    private PlatformTransactionManager transactionManager; 

    
    
//    @RequestMapping(value = "/store_main_list.do", method = {RequestMethod.GET})
//    protected ModelAndView store_main_list(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {
//    	
//    	ModelAndView mav = new ModelAndView("user/shop/store_main");
//    	
//    	return mav;
//    }
    
    
    //스토어상세
    @RequestMapping(value = "/shopInfo.do", method = {RequestMethod.GET})
    protected ModelAndView shopInfo(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

    	ModelAndView mav = new ModelAndView("user/shop/shopInfo");
		UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);
		
		String shopSeq = StringUtil.get(req.getParameter("shopSeq"));
		mav.addObject("shopSeq",shopSeq);
		
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

		Object sv = mapper.shop(StringUtil.get(req.getParameter("shopSeq")),StringUtil.get(req.getParameter("userSeq")),userLat,userLong );
		req.setAttribute("shop_info", sv);
   	
		List userEventVOList = mapper.shopEventList(StringUtil.get(req.getParameter("shopSeq")),StringUtil.get(req.getParameter("userSeq")));
		req.setAttribute("shopEvnetList", userEventVOList);

		Object sr = mapper.shopReview(StringUtil.get(req.getParameter("shopSeq")) );
		req.setAttribute("shop_review_info", sr);
		
		List shopReviewGradeList = mapper.shopReviewGrade(StringUtil.get(req.getParameter("shopSeq")));
		req.setAttribute("shopReviewGradeList", shopReviewGradeList);
		
		List shopReviewDetailList = mapper.shopReviewDetail(StringUtil.get(req.getParameter("shopSeq")));
		req.setAttribute("shopReviewDetailList", shopReviewDetailList);
		
		Date curDate = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String todayDate = sdf.format(curDate);
	    mav.addObject("todayDate",todayDate);
		
    	return mav;
	}

	@RequestMapping(value = "/eventDownload.json", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String owner_regis_check(@RequestParam Map<String,Object>map) {
	    String eventSeq = StringUtil.get(map.get("eventSeq"));
	    String userSeq = StringUtil.get(map.get("userSeq"));

	    UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);

	    HashMap<String, String> resultMap = new HashMap<String, String>();
	    try {
	    	mapper.eventDownloadInsert(eventSeq, userSeq);
	    	resultMap.put("result", "true");
	    }catch (Exception e) {
	    	resultMap.put("result", "false");
	    }

		Gson gson = new Gson();

		return gson.toJson(resultMap);
	}

	
	// 리뷰전체보기
    @RequestMapping(value = "/reviewList.do", method = {RequestMethod.GET})
    protected ModelAndView reviewList(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

    	ModelAndView mav = new ModelAndView("user/shop/reviewList");
		UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);
   	
		String userSeq = StringUtil.get(session.getAttribute("userSeq"));
		mav.addObject("shopSeq",StringUtil.get(req.getParameter("shopSeq")));
		
		Object sr = mapper.shopReview(StringUtil.get(req.getParameter("shopSeq")) );
		req.setAttribute("shop_review_info", sr);
		
		List shopReviewGradeList = mapper.shopReviewGrade(StringUtil.get(req.getParameter("shopSeq")));

		req.setAttribute("shopReviewGradeList", shopReviewGradeList);
		
		List shopReviewDetailList = mapper.shopReviewDetail(StringUtil.get(req.getParameter("shopSeq")));

		req.setAttribute("shopReviewDetailList", shopReviewDetailList);
		
		HashMap<String, String> lMap = new HashMap();
		lMap.put("shopSeq", StringUtil.get(req.getParameter("shopSeq")));
		lMap.put("ord", StringUtil.get(req.getParameter("ord")));
		
		int shopReviewCount = mapper.shopReviewListCount(lMap);
		
		req.setAttribute("shopReviewListCount", shopReviewCount);
		req.setAttribute("shopSeq", StringUtil.get(req.getParameter("shopSeq")));
		req.setAttribute("userSeq", userSeq);
		req.setAttribute("ord", StringUtil.get(req.getParameter("ord")));

    	return mav;
	}

    
    // 리스트 상세영역 (아코디언) 부분 
    @RequestMapping(value = "/reviewListUnit.do", method = {RequestMethod.GET, RequestMethod.POST})
    protected ModelAndView reviewListUnit(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

    	ModelAndView mav = new ModelAndView("user/shop/reviewListUnit");
		UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);
   	
		String userSeq = StringUtil.get(session.getAttribute("userSeq"));
		int shopSeq = Integer.parseInt(req.getParameter("shopSeq"));
		System.out.println("shopSeq : " + shopSeq);
		
		int page = 0;
		
		if(req.getParameter("page") != null){
		   page = Integer.parseInt(req.getParameter("page"));
		   System.out.println("page : " + page);
		}

		String ord = "rgDt";
		if(req.getParameter("ord") != null){
			ord = StringUtil.get(req.getParameter("ord"));
		}

		List shopReviewList = mapper.shopReviewList(shopSeq ,StringUtil.get(req.getParameter("ord")),page);
		req.setAttribute("shopReviewList", shopReviewList);
		req.setAttribute("shopSeq", StringUtil.get(req.getParameter("shopSeq")));
		req.setAttribute("userSeq", userSeq);
		req.setAttribute("ord", StringUtil.get(req.getParameter("ord")));

    	return mav;
	}

    @RequestMapping(value = "/reviewWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
    protected ModelAndView reviewWrite(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

    	ModelAndView mav = new ModelAndView("user/shop/reviewWrite");
   	
		String userSeq = StringUtil.get(session.getAttribute("userSeq"));
		UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);

		java.util.Calendar cal = java.util.Calendar.getInstance();

		int yyyy = cal.get(cal.YEAR) ;
		
		Object ui = mapper.userInfo(StringUtil.get(req.getParameter("userSeq")) );
		req.setAttribute("userInfo", ui);
		req.setAttribute("yyyy", yyyy);
 
		req.setAttribute("shopSeq", StringUtil.get(req.getParameter("shopSeq")));
		req.setAttribute("userSeq", userSeq);

    	return mav;
	}

    
    
    // 리뷰 저장하기
    @Transactional
    @RequestMapping(value = "/reviewSave.do", method = {RequestMethod.GET, RequestMethod.POST})
    protected void reviewSave(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws Exception  {

		HashMap<String, String> lMap = new HashMap<String, String>();
		lMap.put("shopSeq", StringUtil.get(req.getParameter("shopSeq")));
		lMap.put("userSeq", StringUtil.get(req.getParameter("userSeq")));
		lMap.put("totalJumsu", StringUtil.get(req.getParameter("totalJumsu")));
		lMap.put("visitType", StringUtil.get(req.getParameter("visitType")));
		lMap.put("visitDate", StringUtil.get(req.getParameter("visitDate")));
		lMap.put("reviewTitle", StringUtil.get(req.getParameter("reviewTitle")));
		lMap.put("reviewText", StringUtil.get(req.getParameter("reviewText")));
		lMap.put("serviceJumsu", StringUtil.get(req.getParameter("serviceJumsu")));
		lMap.put("foodJumsu", StringUtil.get(req.getParameter("foodJumsu")));
		lMap.put("payJumsu", StringUtil.get(req.getParameter("payJumsu")));
		lMap.put("cleanJumsu", StringUtil.get(req.getParameter("cleanJumsu")));
		lMap.put("facilityJumsu", StringUtil.get(req.getParameter("facilityJumsu")));
		lMap.put("locationJumsu", StringUtil.get(req.getParameter("locationJumsu")));
		lMap.put("gender", StringUtil.get(req.getParameter("gender")));
		lMap.put("birthDayH", StringUtil.get(req.getParameter("birthDayH")));
		lMap.put("reviewSeq", "0");
    	
		UserShopMapper mapper = sqlSession.getMapper(UserShopMapper.class);

		mapper.reviewInsert(lMap);
		
		String reviewSeq = StringUtil.get(lMap.get("reviewSeq"));
		//System.out.println("reviewSeq: " +reviewSeq);

		mapper.reviewDetailInsert(reviewSeq, "d01", StringUtil.get(req.getParameter("payJumsu")));
		mapper.reviewDetailInsert(reviewSeq, "d02", StringUtil.get(req.getParameter("foodJumsu")));
		mapper.reviewDetailInsert(reviewSeq, "d03", StringUtil.get(req.getParameter("cleanJumsu")));
		mapper.reviewDetailInsert(reviewSeq, "d04", StringUtil.get(req.getParameter("serviceJumsu")));
		mapper.reviewDetailInsert(reviewSeq, "d05", StringUtil.get(req.getParameter("facilityJumsu")));
		mapper.reviewDetailInsert(reviewSeq, "d06", StringUtil.get(req.getParameter("locationJumsu")));
		
		PrintWriter out = resp.getWriter();
		out.print("success");
		
	}

}
