package com.sweetk.web.shop.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.web.admin.mapper.ShopMapper;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.StringUtil;
import com.sweetk.web.shop.mapper.AnalysisMapper;
import com.sweetk.web.shop.mapper.EventMapper;


@Controller
public class AnalysisController {
		Logger log = Logger.getLogger(AnalysisController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

		@RequestMapping("/dashboard.do")
		protected ModelAndView dashboard(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/analysis/dashboard");
			AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
			ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
			Gson gson = new Gson();
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}

			String startDate = StringUtil.get(req.getParameter("start_date"));
			String endDate = StringUtil.get(req.getParameter("end_date"));
			if(startDate.equals("")){
				startDate = DateUtil.getDate(7);
				endDate = DateUtil.getDate();
			}
			Object sv = shopMapper.shop(shopSeq+"");
			req.setAttribute("shop_detail", sv);
			req.setAttribute("shop_around_count", mapper.shop_around_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_interest_count", mapper.shop_interest_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_buy_count", mapper.shop_buy_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_review_count", mapper.shop_review_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_review_avg", gson.toJson(mapper.shop_review_avg(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_avg_date", gson.toJson(mapper.shop_review_avg_date(shopSeq, startDate, endDate)));
			req.setAttribute("shop_time_avg", gson.toJson(mapper.shop_time_avg(shopSeq, startDate, endDate)));
			req.setAttribute("event_status", gson.toJson(mapper.event_status(shopSeq, startDate, endDate)));
			req.setAttribute("event_count", gson.toJson(mapper.event_count(shopSeq, startDate, endDate)));
			req.setAttribute("promotion_count", gson.toJson(mapper.promotion_count(shopSeq, startDate, endDate)));

			return mav;
		}

		@RequestMapping("/analy_visiter.do")
		protected ModelAndView analy_visiter(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/analysis/analy_visiter");

			return mav;
		}

		@RequestMapping("/analy_review.do")
		protected ModelAndView analy_review(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/analysis/analy_review");
			AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
			Gson gson = new Gson();
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			String startDate = StringUtil.get(req.getParameter("start_date"));
			String endDate = StringUtil.get(req.getParameter("end_date"));
			if(startDate.equals("")){
				startDate = DateUtil.getDate(7);
				endDate = DateUtil.getDate();
			}
			req.setAttribute("shop_review_count", mapper.shop_review_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_review_avg", mapper.shop_review_avg(shopSeq, startDate, endDate));
			req.setAttribute("shop_review_avg_date", gson.toJson(mapper.shop_review_avg_date(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_gender", gson.toJson(mapper.shop_review_gender(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_age", gson.toJson(mapper.shop_review_age(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_visit", gson.toJson(mapper.shop_review_visit(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_visit_date", gson.toJson(mapper.shop_review_visit_date(shopSeq, startDate, endDate)));
			req.setAttribute("shop_review_visit_detail", gson.toJson(mapper.shop_review_visit_detail(shopSeq, startDate, endDate)));

			return mav;
		}

		@RequestMapping("/analy_customer.do")
		protected ModelAndView analy_customer(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/analysis/analy_customer");
			AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
			Gson gson = new Gson();
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}

			String startDate = StringUtil.get(req.getParameter("start_date"));
			String endDate = StringUtil.get(req.getParameter("end_date"));
			if(startDate.equals("")){
				startDate = DateUtil.getDate(7);
				endDate = DateUtil.getDate();
			}
			req.setAttribute("shop_around_count", mapper.shop_around_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_interest_count", mapper.shop_interest_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_buy_count", mapper.shop_buy_count(shopSeq, startDate, endDate));
			req.setAttribute("shop_around_gender_chart", gson.toJson(mapper.shop_around_gender_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_interest_gender_chart", gson.toJson(mapper.shop_interest_gender_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_buy_gender_chart", gson.toJson(mapper.shop_buy_gender_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_around_age_chart", gson.toJson(mapper.shop_around_age_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_interest_age_chart", gson.toJson(mapper.shop_interest_age_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_buy_age_chart", gson.toJson(mapper.shop_buy_age_chart(shopSeq, startDate, endDate)));
			req.setAttribute("shop_time_avg", gson.toJson(mapper.shop_time_avg(shopSeq, startDate, endDate)));
			req.setAttribute("shop_date_avg", gson.toJson(mapper.shop_date_avg(shopSeq, startDate, endDate)));
			return mav;
		}

	}
