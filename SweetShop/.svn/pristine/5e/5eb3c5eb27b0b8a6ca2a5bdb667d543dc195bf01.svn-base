package com.sweetk.mobile.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.ibatis.session.SqlSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.sweetk.mobile.api.mapper.AppApiMapper;
import com.sweetk.mobile.api.vo.AppApiCouponVo;
import com.sweetk.mobile.api.vo.AppApiEventVo;
import com.sweetk.mobile.api.vo.AppApiShopVo;
import com.sweetk.mobile.api.vo.AppApiSiDoVo;
import com.sweetk.mobile.api.vo.AppApiSiGuGunVo;
import com.sweetk.web.common.utils.StringUtil;

@Controller

public class AppApiController {
	static Logger log = Logger.getLogger(AppApiController.class);

	@Autowired
    private SqlSession sqlSession;
	
	@RequestMapping("/userAdd.do")
	public void userAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    
		//String deviceUDID = StringUtil.get(map.get("deviceUDID"));
		//String deviceOS = StringUtil.get(map.get("deviceOS"));

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		int is = mapper.user_check(reqMap);
		
		if(is==0) {
			mapper.user_insert(reqMap);
		} else {
			mapper.user_update(reqMap);
		}
		
		String userSeq = mapper.getUserSeq(reqMap);
		
		//TODO 아이폰 호출 문제 
		if(userSeq == null || userSeq.equals("null")){
			userSeq = "1";
		}
		
		HashMap<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("result", "1");
		resultMap.put("userSeq", userSeq);

		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultMap));
		printWriter.close();
		
	}

	@RequestMapping("/userMainShopList.do")
	public void userMainShopList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");
		System.out.println("request = "+request);

		String sido = StringUtil.get(request.getParameter("sido"));
		String city = StringUtil.get(request.getParameter("city"));

		Map reqMap = getRequestMap(request);

		reqMap.put("addr", sido+" "+city );

		System.out.println("sido = "+sido);
		System.out.println("city = "+city);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		List aasVoList = mapper.mainShopList(reqMap);

		JsonObject resultObj =  new JsonObject();
		
		resultObj.addProperty("result", "1");
		
		JsonArray shipInfoList = new JsonArray();
		
		for(int i = 0; i < aasVoList.size() ; i++) {
			AppApiShopVo aasVo = (AppApiShopVo)aasVoList.get(i) ;
			
			JsonObject shopObj = new JsonObject();
			shopObj.addProperty("shopSeq", aasVo.getShopSeq());
			shopObj.addProperty("shopTitle", aasVo.getShopTitle());
			shopObj.addProperty("shopImageUrl", aasVo.getShopImageUrl());
			shopObj.addProperty("shopLinkUrl", aasVo.getShopLinkUrl());
			shopObj.addProperty("shopKind", aasVo.getShopKind());
			shopObj.addProperty("shopCategory", aasVo.getShopCategory());
			shopObj.addProperty("shopMenu", aasVo.getShopMenu());
			shopObj.addProperty("shopDist", aasVo.getShopDist());
			shopObj.addProperty("bookmark", aasVo.getBookmark());
			shopObj.addProperty("reviewGrade", aasVo.getReviewGrade());
			
			shipInfoList.add(shopObj);
		}

		resultObj.add("shop_info", shipInfoList);

		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/userMainEventList.do")
	public void userMainEventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		List aasVoList = mapper.mainEventList(reqMap);

		JsonObject resultObj =  new JsonObject();
		
		resultObj.addProperty("result", "1");
		
		JsonArray shipInfoList = new JsonArray();
		
		for(int i = 0; i < aasVoList.size() ; i++) {
			AppApiEventVo aasVo = (AppApiEventVo)aasVoList.get(i) ;
			
			JsonObject shopObj = new JsonObject();
			shopObj.addProperty("eventSeq", aasVo.getEventSeq());
			shopObj.addProperty("shopTitle", aasVo.getShopTitle());
			shopObj.addProperty("eventTitle", aasVo.getEventTitle());
			shopObj.addProperty("eventImageUrl", aasVo.getEventImageUrl());
			shopObj.addProperty("eventLinkUrl", aasVo.getEventLinkUrl());
			shopObj.addProperty("shopKind", aasVo.getShopKind());
			shopObj.addProperty("shopCategory", aasVo.getShopCategory());

			shopObj.addProperty("eventDiscountWay", aasVo.getEventDiscountWay());
			shopObj.addProperty("eventDiscountTarget", aasVo.getEventDiscountTarget());
			shopObj.addProperty("eventDiscount", aasVo.getEventDiscount());

			shopObj.addProperty("shopLat", aasVo.getShopLat());
			shopObj.addProperty("shopLong", aasVo.getShopLong());
			shopObj.addProperty("shopDist", aasVo.getShopDist());
			
			shopObj.addProperty("downloadYn", aasVo.getDownloadYn());			
			shopObj.addProperty("shopMenu", aasVo.getShopMenu());
			shopObj.addProperty("bookmark", aasVo.getBookmark());
			shopObj.addProperty("useYn", aasVo.getUseYn());
			
			shopObj.addProperty("shopAddr", aasVo.getShopAddr());
			shopObj.addProperty("reviewGrade", aasVo.getReviewGrade());
			
			
			shipInfoList.add(shopObj);
		}

		resultObj.add("event_info", shipInfoList);

		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/userMainMyCouponList.do")
	public void userMainMyCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		List aasVoList = mapper.mainMyCouponList(reqMap);

		JsonObject resultObj =  new JsonObject();
		
		resultObj.addProperty("result", "1");
		
		JsonArray shipInfoList = new JsonArray();
		
		for(int i = 0; i < aasVoList.size() ; i++) {
			AppApiCouponVo aasVo = (AppApiCouponVo)aasVoList.get(i) ;
			
			JsonObject shopObj = new JsonObject();
			shopObj.addProperty("eventSeq", aasVo.getEventSeq());
			shopObj.addProperty("shopTitle", aasVo.getShopTitle());
			shopObj.addProperty("eventTitle", aasVo.getEventTitle());
			shopObj.addProperty("eventImageUrl", aasVo.getEventImageUrl());
			shopObj.addProperty("eventLinkUrl", aasVo.getEventLinkUrl());
			shopObj.addProperty("eventStartDay", aasVo.getEventStartDay());
			shopObj.addProperty("eventEndDay", aasVo.getEventEndDay());
			shopObj.addProperty("shopKind", aasVo.getShopKind());
			shopObj.addProperty("reviewGrade", aasVo.getReviewGrade());
			shopObj.addProperty("shop_addr",aasVo.getShop_addr());
			shopObj.addProperty("eventDiscountWay", aasVo.getEventDiscountWay());
			shopObj.addProperty("eventDiscountTarget", aasVo.getEventDiscountTarget());
			shopObj.addProperty("eventDiscount", aasVo.getEventDiscount());
			shopObj.addProperty("shopCategory", aasVo.getShopCategory());
			shopObj.addProperty("downloadYn", aasVo.getDownloadYn());			
			shopObj.addProperty("useYn", aasVo.getUseYn());
			shopObj.addProperty("bookmark", aasVo.getBookmark());

			shipInfoList.add(shopObj);
		}

		resultObj.add("mycoupon_info", shipInfoList);

		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/userMyCouponDelete.do")
	public void userMyCouponDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		JsonObject resultObj =  new JsonObject();

		try {
			mapper.myCouponDelete(reqMap);
			mapper.myCouponUseDelete(reqMap);
			resultObj.addProperty("result", "1");	
		} catch (Exception e) {
			resultObj.addProperty("result", "0");			
		}
				
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/userViewLogSave.do")
	public void userViewLogSave(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		JsonObject resultObj =  new JsonObject();

		try {
			mapper.viewLogInsert(reqMap);
			resultObj.addProperty("result", "1");	
		} catch (Exception e) {
			resultObj.addProperty("result", "0");			
		}
				
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/userLocation.do")
	public void userLocation(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		JsonObject resultObj =  new JsonObject();

		try {
			mapper.locationInsert(reqMap);
			resultObj.addProperty("result", "1");	
		} catch (Exception e) {
			resultObj.addProperty("result", "0");			
		}
				
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/sidoList.do")
	public void sidoList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		JsonObject resultObj =  new JsonObject();

		try {		
			List aasVoList = mapper.sidoList(reqMap);
			
			resultObj.addProperty("result", "1");
			
			JsonArray shipInfoList = new JsonArray();
			
			for(int i = 0; i < aasVoList.size() ; i++) {
				AppApiSiDoVo aasVo = (AppApiSiDoVo)aasVoList.get(i) ;
				
				JsonObject shopObj = new JsonObject();
				shopObj.addProperty("sidoId", aasVo.getSidoId());
				shopObj.addProperty("sidoName", aasVo.getSidoName());
				
				shipInfoList.add(shopObj);
			}
	
			resultObj.add("sido_info", shipInfoList);
		} catch (Exception e) {
			resultObj.addProperty("result", "0");			
		}

		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	@RequestMapping("/sigugunList.do")
	public void sigugunList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		request.setCharacterEncoding("utf-8");

		Map reqMap = getRequestMap(request);
		
		AppApiMapper mapper = sqlSession.getMapper(AppApiMapper.class);

		JsonObject resultObj =  new JsonObject();

		try {		
			List aasVoList = mapper.sigugunList(reqMap);
			
			resultObj.addProperty("result", "1");
			
			JsonArray shipInfoList = new JsonArray();
			
			for(int i = 0; i < aasVoList.size() ; i++) {
				AppApiSiGuGunVo aasVo = (AppApiSiGuGunVo)aasVoList.get(i) ;
				
				JsonObject shopObj = new JsonObject();
				shopObj.addProperty("sigugunId", aasVo.getSigugunId());
				shopObj.addProperty("sigugunName", aasVo.getSigugunName());
				
				shipInfoList.add(shopObj);
			}
	
			resultObj.add("sigugun_info", shipInfoList);
		} catch (Exception e) {
			resultObj.addProperty("result", "0");			
		}

		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(resultObj));
		printWriter.close();
		
	}

	public static Map getRequestMap(HttpServletRequest request) {
        HashMap map = new HashMap();
        try {
        	Map parameter = request.getParameterMap();
	        if (parameter == null) return null;
	        		        
	        Iterator it = parameter.keySet().iterator();
	        Object paramKey = null;
	        String[] paramValue = null;
	        
	        while (it.hasNext()) { 
	            paramKey = it.next();
	            paramValue = (String[]) parameter.get(paramKey);	
	            String strKey = paramKey.toString();
	            if (paramValue.length > 1 ) {
	                map.put(strKey,paramValue);
	                log.debug("reqMap:key=["+strKey+"],value=["+paramValue+"]");
	            } else {
	                map.put(strKey, (paramValue[0] == null) ? "" : paramValue[0].trim());
		            log.debug("reqMap:key=["+strKey+"],value=["+paramValue[0].trim()+"]");
	            }
	        }    
	        return map; 
	        
        } catch (Exception e){
            log.error("getRequestMap() >> " + e.toString());
            return null;
        }
    }


}
