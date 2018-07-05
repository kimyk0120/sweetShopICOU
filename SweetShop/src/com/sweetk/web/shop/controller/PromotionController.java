package com.sweetk.web.shop.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.push.PushService;
import com.sweetk.push.PushServiceAndroid;
import com.sweetk.web.admin.mapper.CodeMapper;
import com.sweetk.web.admin.vo.CodeVo;
import com.sweetk.web.admin.vo.ShopVo;
import com.sweetk.web.common.constants.Constant;
import com.sweetk.web.common.domain.Paging;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.StringUtil;
import com.sweetk.web.shop.mapper.EventMapper;
import com.sweetk.web.shop.mapper.PromotionMapper;
import com.sweetk.web.shop.vo.EventImgVo;
import com.sweetk.web.shop.vo.ShopCardVo;
import com.sweetk.web.shop.vo.ShopEventVo;
import com.sweetk.web.shop.vo.ShopPromotionVo;


@Controller
public class PromotionController {
		Logger log = Logger.getLogger(PromotionController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

		@RequestMapping("/pr_event_index.do")
		protected ModelAndView pr_event_index(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_index");
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			Gson gson = new Gson();
			int eventSeq;
			if(req.getParameter("event_seq") != null){
				eventSeq = Integer.parseInt(StringUtil.get(req.getParameter("event_seq")));
			}else{
				eventSeq = 0;
			}
			HashMap<String, String> sev = mapper.event(eventSeq);
			req.setAttribute("event_detail",sev);
			req.setAttribute("event_view_count", mapper.event_view_count(eventSeq));
			req.setAttribute("event_down_count", mapper.event_down_count(eventSeq));
			req.setAttribute("event_use_count", mapper.event_use_count(eventSeq));
			req.setAttribute("event_date_chart", gson.toJson(mapper.event_date_chart(eventSeq)));
			req.setAttribute("event_time_chart", gson.toJson(mapper.event_time_chart(eventSeq)));
			req.setAttribute("event_view_gender_chart", gson.toJson(mapper.event_view_gender_chart(eventSeq)));
			req.setAttribute("event_down_gender_chart", gson.toJson(mapper.event_down_gender_chart(eventSeq)));
			req.setAttribute("event_use_gender_chart", gson.toJson(mapper.event_use_gender_chart(eventSeq)));
			req.setAttribute("event_view_age_chart", gson.toJson(mapper.event_view_age_chart(eventSeq)));
			req.setAttribute("event_down_age_chart", gson.toJson(mapper.event_down_age_chart(eventSeq)));
			req.setAttribute("event_use_age_chart", gson.toJson(mapper.event_use_age_chart(eventSeq)));

			return mav;
		}

		@RequestMapping("/pr_event_list.do")
		protected ModelAndView pr_event_list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_list");

			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int page = 1;
			if(req.getParameter("page") != null){
			   page = Integer.parseInt(req.getParameter("page"));
			}
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			String startDate = StringUtil.get(req.getParameter("start_date"));
			String endDate = StringUtil.get(req.getParameter("end_date"));

			if(startDate.equals("")){
				startDate = DateUtil.getDate(1);
				endDate = DateUtil.getDate();
			}
			startDate = startDate + Constant.DATE_START_TIME_STR;
			endDate = endDate + Constant.DATE_END_TIME_STR;

			String event_name = StringUtil.get(req.getParameter("event_name"));
			int pageSize = Constant.PAGE_SIZE;
			int currtentPage = (page-1) * pageSize;
			int totalCount = mapper.event_count(shopSeq,startDate,endDate,event_name);
			ArrayList<HashMap<String, String>> al = mapper.event_list(currtentPage, pageSize, shopSeq, startDate, endDate, event_name);
			Paging paging = new Paging(al,totalCount,page,pageSize);
			req.setAttribute("event_list", paging);

			return mav;
		}

		@RequestMapping("/pr_event_modify.do")
		protected ModelAndView pr_event_modify_dc(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_modify");
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int eventSeq;
			if(req.getParameter("event_seq") != null){
				eventSeq = Integer.parseInt(StringUtil.get(req.getParameter("event_seq")));
			}else{
				eventSeq = 0;
			}
			HashMap<String, String> sev = mapper.event(eventSeq);
			ArrayList<HashMap<String, String>> al = mapper.event_img_list(eventSeq);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sm = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sm);
			req.setAttribute("event_detail",sev);
			req.setAttribute("event_img_list",al);
			PromotionMapper proMapper = sqlSession.getMapper(PromotionMapper.class);
			HashMap<String, String> scv = proMapper.shop_card(shopSeq);
			req.setAttribute("shop_card_detail", scv);

			return mav;
		}


		@RequestMapping("/pr_event_regis_dc.do")
		protected ModelAndView pr_event_regis_dc(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_regis_dc");
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sm = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sm);

			return mav;
		}

		@RequestMapping("/pr_event_regis_service.do")
		protected ModelAndView pr_event_regis_service(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_regis_service");
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sm = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sm);

			return mav;
		}

		@RequestMapping("/pr_event_write.do")
		protected ModelAndView pr_event_write(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_event_write");
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sm = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sm);
			PromotionMapper proMapper = sqlSession.getMapper(PromotionMapper.class);
			HashMap<String, String> scv = proMapper.shop_card(shopSeq);
			req.setAttribute("shop_card_detail", scv);

			return mav;
		}

		@RequestMapping(value = "/shop_event_save.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_event_save(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			Gson gson = new Gson();
			try {
				EventMapper mapper = sqlSession.getMapper(EventMapper.class);

				ShopEventVo sev = new ShopEventVo();
				sev.setShop_seq(StringUtil.get(map.get("shop_seq")));
				sev.setEvent_title(StringUtil.get(map.get("event_title")));
				sev.setEvent_status(StringUtil.get(map.get("event_status")));
				sev.setEvent_kind(StringUtil.get(map.get("event_kind")));
				sev.setEvent_discount_way(StringUtil.get(map.get("event_discount_way")));
				sev.setEvent_discount_target(StringUtil.get(map.get("event_discount_target")));
				sev.setEvent_discount(StringUtil.get(map.get("event_discount")));
				sev.setEvent_detail_desc(StringUtil.get(map.get("event_detail_desc")));
				sev.setEvent_start_day(StringUtil.get(map.get("event_start_day")));
				sev.setEvent_end_day(StringUtil.get(map.get("event_end_day")));

				mapper.event_insert(sev);
				String imgList = StringUtil.get(map.get("event_img_list"));
				if(!imgList.equals("")){
					EventImgVo[] imgVoArr = gson.fromJson(imgList, EventImgVo[].class);
					for (int i = 0; i < imgVoArr.length; i++) {
						EventImgVo eiv = imgVoArr[i];
						eiv.setEvent_seq(sev.getEvent_seq());
						mapper.event_img_insert(eiv);
					}
				}

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}


			return gson.toJson(resultMap);

		}

		@RequestMapping(value = "/shop_event_update.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_event_update(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			Gson gson = new Gson();
			try {
				EventMapper mapper = sqlSession.getMapper(EventMapper.class);

				ShopEventVo sev = new ShopEventVo();
				sev.setEvent_seq(Integer.parseInt(StringUtil.get(map.get("event_seq"))));
				sev.setEvent_title(StringUtil.get(map.get("event_title")));
				sev.setEvent_status(StringUtil.get(map.get("event_status")));
				sev.setEvent_kind(StringUtil.get(map.get("event_kind")));
				sev.setEvent_discount_way(StringUtil.get(map.get("event_discount_way")));
				sev.setEvent_discount_target(StringUtil.get(map.get("event_discount_target")));
				sev.setEvent_discount(StringUtil.get(map.get("event_discount")));
				sev.setEvent_detail_desc(StringUtil.get(map.get("event_detail_desc")));
				sev.setEvent_start_day(StringUtil.get(map.get("event_start_day")));
				sev.setEvent_end_day(StringUtil.get(map.get("event_end_day")));

				mapper.event_update(sev);

				String imgList = StringUtil.get(map.get("event_img_list"));
				mapper.event_img_delete(sev.getEvent_seq());
				if(!imgList.equals("")){
					EventImgVo[] imgVoArr = gson.fromJson(imgList, EventImgVo[].class);
					for (int i = 0; i < imgVoArr.length; i++) {
						EventImgVo eiv = imgVoArr[i];
						eiv.setEvent_seq(sev.getEvent_seq());
						mapper.event_img_insert(eiv);
					}
				}
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}
			return gson.toJson(resultMap);
		}
		
		// 이벤트 삭제
		@RequestMapping(value = "/shop_event_delete.do", method = {RequestMethod.GET})
		protected @ResponseBody String shop_event_delete(@RequestParam Map<String,Object> map) {
			
			HashMap<String, String> resultMap = new HashMap<String, String>();
			Gson gson = new Gson();
			try {
				EventMapper mapper = sqlSession.getMapper(EventMapper.class);
				
				int seq = Integer.parseInt(StringUtil.get(map.get("event_seq")));
				//System.out.println("seq : " +  seq);
				mapper.event_delete(seq);
				resultMap.put("result", "success");
				
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}
			return gson.toJson(resultMap);
		}

		@RequestMapping("/pr_handbill_index.do")
		protected ModelAndView pr_handbill_index(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_handbill_index");

			PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);
			Gson gson = new Gson();
			int promotionSeq;
			if(req.getParameter("promotion_seq") != null){
				promotionSeq = Integer.parseInt(StringUtil.get(req.getParameter("promotion_seq")));
			}else{
				promotionSeq = 0;
			}
			HashMap<String, String> sev = mapper.promotion(promotionSeq);
			req.setAttribute("promotion_detail",sev);
			req.setAttribute("promotion_view_count", mapper.promotion_view_count(promotionSeq));
			req.setAttribute("promotion_down_count", mapper.promotion_down_count(promotionSeq));
			req.setAttribute("promotion_date_chart", gson.toJson(mapper.promotion_date_chart(promotionSeq)));
			req.setAttribute("promotion_time_chart", gson.toJson(mapper.promotion_time_chart(promotionSeq)));
			req.setAttribute("promotion_view_gender_chart", gson.toJson(mapper.promotion_view_gender_chart(promotionSeq)));
			req.setAttribute("promotion_down_gender_chart", gson.toJson(mapper.promotion_down_gender_chart(promotionSeq)));
			req.setAttribute("promotion_view_age_chart", gson.toJson(mapper.promotion_view_age_chart(promotionSeq)));
			req.setAttribute("promotion_down_age_chart", gson.toJson(mapper.promotion_down_age_chart(promotionSeq)));

			return mav;
		}

		@RequestMapping("/pr_handbill_list.do")
		protected ModelAndView pr_handbill_list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_handbill_list");

			PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);
			int page = 1;
			if(req.getParameter("page") != null){
			   page = Integer.parseInt(req.getParameter("page"));
			}
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			String startDate = StringUtil.get(req.getParameter("start_date"));
			String endDate = StringUtil.get(req.getParameter("end_date"));

			if(startDate.equals("")){
				startDate = DateUtil.getDate(1);
				endDate = DateUtil.getDate();
			}
			startDate = startDate + Constant.DATE_START_TIME_STR;
			endDate = endDate + Constant.DATE_END_TIME_STR;

			String promotion_name = StringUtil.get(req.getParameter("promotion_name"));
			int pageSize = Constant.PAGE_SIZE;
			int currtentPage = (page-1) * pageSize;
			int totalCount = mapper.promotion_count(shopSeq,startDate,endDate,promotion_name);
			ArrayList<HashMap<String, String>> al = mapper.promotion_list(currtentPage, pageSize, shopSeq, startDate, endDate, promotion_name);
			Paging paging = new Paging(al,totalCount,page,pageSize);
			req.setAttribute("pr_list", paging);

			return mav;
		}

		@RequestMapping("/pr_handbill_modify.do")
		protected ModelAndView pr_handbill_modify(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_handbill_modify");
			PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sv = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sv);
			int promotionSeq;
			if(req.getParameter("promotion_seq") != null){
				promotionSeq = Integer.parseInt(StringUtil.get(req.getParameter("promotion_seq")));
			}else{
				promotionSeq = 0;
			}
			HashMap<String, String> scv = mapper.shop_card(shopSeq);
			req.setAttribute("shop_card_detail", scv);
			HashMap<String, String> promotion = mapper.promotion(promotionSeq);
			req.setAttribute("promotion_detail", promotion);

			return mav;
		}

		@RequestMapping("/pr_handbill_regis.do")
		protected ModelAndView pr_handbill_regis(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_handbill_regis");
			PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> scv = mapper.shop_card(shopSeq);
			req.setAttribute("shop_card_detail", scv);
			HashMap<String, String> sv = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sv);


			return mav;
		}

		@RequestMapping(value = "/shop_promotion_save.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_promotion_save(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {
				PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);

				ShopPromotionVo spv = new ShopPromotionVo();
				spv.setShop_seq(StringUtil.get(map.get("shop_seq")));
				spv.setPromotion_detail_desc(StringUtil.get(map.get("promotion_detail_desc")));
				spv.setPromotion_start_day(StringUtil.get(map.get("promotion_start_day")));
				spv.setPromotion_end_day(StringUtil.get(map.get("promotion_end_day")));
				spv.setPromotion_status(StringUtil.get(map.get("promotion_status")));
				spv.setImg_path(StringUtil.get(map.get("img_path")));
				spv.setImg_file_name(StringUtil.get(map.get("img_file_name")));
				spv.setImg_org_name(StringUtil.get(map.get("img_org_name")));

				mapper.promotion_insert(spv);

				String promotion_seq = mapper.getPromotionSeq(spv);
				
				ArrayList<HashMap<String, String>> pushUserList = mapper.getPushPromotionUserList();
				
				for(int i = 0; i < pushUserList.size() ; i++){
					
					HashMap<String, String> userInfo = pushUserList.get(i);

					if(userInfo.get("user_device").equals("ADR")) {
						// android
						
						PushServiceAndroid psa = new PushServiceAndroid();
						psa.sendMessage(userInfo.get("user_push_key"), "i.cou", "[광고] 새로운 홍보 전단이 등록 되었습니다.", "", 0);
						
					} else {
						// ios
						
						PushService ps = new PushService(userInfo.get("user_push_key"),"i.cou","[광고] 새로운 홍보 전단이 등록 되었습니다.", 0);

						try {
							ps.start();
						} catch (Exception ee){
								System.out.println("pushPhone Error" + ee);		
						}
						
					}
					
				}
				
				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping(value = "/shop_promotion_update.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_promotion_update(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {
				PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);

				ShopPromotionVo spv = new ShopPromotionVo();
				spv.setPromotion_seq(StringUtil.get(map.get("promotion_seq")));
				spv.setPromotion_detail_desc(StringUtil.get(map.get("promotion_detail_desc")));
				spv.setPromotion_start_day(StringUtil.get(map.get("promotion_start_day")));
				spv.setPromotion_end_day(StringUtil.get(map.get("promotion_end_day")));
				spv.setPromotion_status(StringUtil.get(map.get("promotion_status")));
				spv.setImg_path(StringUtil.get(map.get("img_path")));
				spv.setImg_file_name(StringUtil.get(map.get("img_file_name")));
				spv.setImg_org_name(StringUtil.get(map.get("img_org_name")));

				mapper.promotion_update(spv);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping("/pr_shopcard.do")
		protected ModelAndView pr_shopcard_modify(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/promotion/pr_shopcard_modify");
			PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			Object sv = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sv);
			HashMap<String, String> scv = mapper.shop_card(shopSeq);
			req.setAttribute("shop_card_detail", scv);


			return mav;
		}

		@RequestMapping(value = "/shop_card_save.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_card_save(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {
				PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);

				ShopCardVo scv = new ShopCardVo();
				scv.setShop_seq(StringUtil.get(map.get("shop_seq")));
				scv.setShop_intro(StringUtil.get(map.get("shop_intro")));
				scv.setEtc_text(StringUtil.get(map.get("etc_text")));
				scv.setImg_path(StringUtil.get(map.get("img_path")));
				scv.setImg_file_name(StringUtil.get(map.get("img_file_name")));
				scv.setImg_org_name(StringUtil.get(map.get("img_org_name")));

				mapper.shop_card_insert(scv);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping(value = "/shop_card_update.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_card_update(@RequestParam Map<String,Object> map) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {
				PromotionMapper mapper = sqlSession.getMapper(PromotionMapper.class);

				ShopCardVo scv = new ShopCardVo();
				scv.setShop_seq(StringUtil.get(map.get("shop_seq")));
				scv.setShop_intro(StringUtil.get(map.get("shop_intro")));
				scv.setEtc_text(StringUtil.get(map.get("etc_text")));
				scv.setImg_path(StringUtil.get(map.get("img_path")));
				scv.setImg_file_name(StringUtil.get(map.get("img_file_name")));
				scv.setImg_org_name(StringUtil.get(map.get("img_org_name")));

				mapper.shop_card_update(scv);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping(value = "/event_img_upload.do", method = RequestMethod.POST)
		public @ResponseBody String event_img_upload(@RequestParam("event_img_file") MultipartFile multipartFile, HttpServletRequest request ,HttpServletResponse resp) throws IOException{

	        String result;
	        String filePath = null;
	        String original_name = null;
	        String time_millis_name = null;

	        String multipartFileName = multipartFile.getOriginalFilename();

	        try {
	        	time_millis_name = System.currentTimeMillis()+multipartFileName.substring(multipartFileName.lastIndexOf("."));;
	            String uploadPath = request.getSession().getServletContext().getRealPath("/upload/event_img/");

	            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+time_millis_name));

	            result = "success";
	            filePath = "/upload/event_img/"+time_millis_name;
	            original_name = multipartFileName;

	        } catch (Exception e) {
	            result = "fail";
	        }

	        Map<String,Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("result", result);
	        resultMap.put("url", filePath);
	        resultMap.put("file_name", time_millis_name);
	        resultMap.put("original_name", original_name);


			Gson gson = new Gson();

			return gson.toJson(resultMap);

	    }

		@RequestMapping(value = "/shop_pr_img_upload.do", method = RequestMethod.POST)
		public @ResponseBody String shop_pr_img_upload(@RequestParam("event_img_file") MultipartFile multipartFile, HttpServletRequest request ,HttpServletResponse resp) throws IOException{

			String result;
			String filePath = null;
			String original_name = null;
			String time_millis_name = null;

			String multipartFileName = multipartFile.getOriginalFilename();

			try {
				time_millis_name = System.currentTimeMillis()+multipartFileName.substring(multipartFileName.lastIndexOf("."));;
				String uploadPath = request.getSession().getServletContext().getRealPath("/upload/shop_pr_img/");

				FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+time_millis_name));

				result = "success";
				filePath = "/upload/shop_pr_img/"+time_millis_name;
				original_name = multipartFileName;

			} catch (Exception e) {
				result = "fail";
			}

			Map<String,Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("url", filePath);
			resultMap.put("file_name", time_millis_name);
			resultMap.put("original_name", original_name);


			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping(value = "/shop_card_img_upload.do", method = RequestMethod.POST)
		public @ResponseBody String shop_card_img_upload(@RequestParam("shop_card_img_file") MultipartFile multipartFile, HttpServletRequest request ,HttpServletResponse resp) throws IOException{

	        String result;
	        String filePath = null;
	        String original_name = null;
	        String time_millis_name = null;

	        String multipartFileName = multipartFile.getOriginalFilename();

	        try {
	        	time_millis_name = System.currentTimeMillis()+multipartFileName.substring(multipartFileName.lastIndexOf("."));;
	            String uploadPath = request.getSession().getServletContext().getRealPath("/upload/shop_card_img/");

	            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+time_millis_name));

	            result = "success";
	            filePath = "/upload/shop_card_img/"+time_millis_name;
	            original_name = multipartFileName;

	        } catch (Exception e) {
	            result = "fail";
	        }

	        Map<String,Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("result", result);
	        resultMap.put("url", filePath);
	        resultMap.put("file_name", time_millis_name);
	        resultMap.put("original_name", original_name);


			Gson gson = new Gson();

			return gson.toJson(resultMap);

	    }

	}
