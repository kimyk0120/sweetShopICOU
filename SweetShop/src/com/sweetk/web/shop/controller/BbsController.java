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
import com.sweetk.web.admin.mapper.CodeMapper;
import com.sweetk.web.admin.vo.CodeVo;
import com.sweetk.web.common.constants.Constant;
import com.sweetk.web.common.domain.Paging;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.StringUtil;
import com.sweetk.web.shop.mapper.BbsMapper;
import com.sweetk.web.shop.mapper.EventMapper;
import com.sweetk.web.shop.mapper.PromotionMapper;
import com.sweetk.web.shop.vo.NoticeVo;
import com.sweetk.web.shop.vo.ShopEventVo;
import com.sweetk.web.shop.vo.QnaVo;


@Controller
public class BbsController {
		Logger log = Logger.getLogger(BbsController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

		@RequestMapping("/bbs_notice_list.do")
		protected ModelAndView dashboard(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/bbs/bbs_notice_list");

			BbsMapper mapper = sqlSession.getMapper(BbsMapper.class);

			int page = 1;
			if(req.getParameter("page") != null){
			   page = Integer.parseInt(req.getParameter("page"));
			}
			String notice_title = StringUtil.get(req.getParameter("notice_title"));

			int pageSize = Constant.PAGE_SIZE;
			int currtentPage = (page-1) * pageSize;
			int totalCount = mapper.notice_count(notice_title);
			ArrayList<HashMap<String, String>> al = mapper.notice_list(currtentPage, pageSize, notice_title);
			Paging paging = new Paging(al,totalCount,page,pageSize);
			req.setAttribute("notice_list", paging);

			return mav;
		}

		@RequestMapping("/bbs_notice_view.do")
		protected ModelAndView bbs_notice_view(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/bbs/bbs_notice_view");
			BbsMapper mapper = sqlSession.getMapper(BbsMapper.class);
			NoticeVo nv = mapper.notice(StringUtil.get(req.getParameter("notice_seq")));
			HashMap<String, String> noticePre = mapper.notice_prv(StringUtil.get(req.getParameter("notice_seq")));
			HashMap<String, String> noticeNext = mapper.notice_next(StringUtil.get(req.getParameter("notice_seq")));
			mapper.notice_view_update(StringUtil.get(req.getParameter("notice_seq")));
			req.setAttribute("notice_detail", nv);
			req.setAttribute("notice_pre", noticePre);
			req.setAttribute("notice_next", noticeNext);

			return mav;
		}

		@RequestMapping("/bbs_qa_list.do")
		protected ModelAndView bbs_qa_list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/bbs/bbs_qa_list");

			BbsMapper mapper = sqlSession.getMapper(BbsMapper.class);
			int page = 1;
			if(req.getParameter("page") != null){
			   page = Integer.parseInt(req.getParameter("page"));
			}
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			String qna_comment = StringUtil.get(req.getParameter("qna_comment"));

			int pageSize = Constant.PAGE_SIZE;
			int currtentPage = (page-1) * pageSize;
			int totalCount = mapper.qna_count(qna_comment,shopSeq);
			ArrayList<HashMap<String, String>> al = mapper.qna_list(currtentPage, pageSize ,qna_comment,shopSeq);
			Paging paging = new Paging(al,totalCount,page,pageSize);
			req.setAttribute("bbs_qa_list", paging);

			return mav;
		}

		@RequestMapping("/bbs_qa_regis.do")
		protected ModelAndView bbs_qa_regis(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/bbs/bbs_qa_regis");
			CodeMapper codeMapper = sqlSession.getMapper(CodeMapper.class);
			EventMapper mapper = sqlSession.getMapper(EventMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sm = mapper.shop(shopSeq);
			req.setAttribute("shop_detail", sm);
			CodeVo cv = new CodeVo();
			cv.setCode_type("qna_type");
			ArrayList<HashMap<String, String>> al = codeMapper.CodeList(cv);
			req.setAttribute("qna_code", al);
			return mav;
		}

		@RequestMapping("/bbs_qa_view.do")
		protected ModelAndView bbs_qa_view(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/bbs/bbs_qa_view");
			BbsMapper mapper = sqlSession.getMapper(BbsMapper.class);

			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sqv = mapper.qna(StringUtil.get(req.getParameter("qna_seq")));
			HashMap<String, String> qnapre = mapper.qna_prv(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))),shopSeq);
			HashMap<String, String> qnanext = mapper.qna_next(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))),shopSeq);
			HashMap<String, String> qaa = mapper.qna_answer(StringUtil.get(req.getParameter("qna_seq")));
			req.setAttribute("qna_detail", sqv);
			req.setAttribute("qna_answer", qaa);
			req.setAttribute("qna_pre", qnapre);
			req.setAttribute("qna_next", qnanext);

			return mav;
		}

		@RequestMapping(value = "/qna_save.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String qna_save(@RequestParam Map<String,Object> map,HttpServletRequest req) {

			HashMap<String, String> resultMap = new HashMap<String, String>();
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			try {
				BbsMapper mapper = sqlSession.getMapper(BbsMapper.class);

				QnaVo qv = new QnaVo();
				qv.setQna_target(StringUtil.get(map.get("qna_target")));
				qv.setQna_type(StringUtil.get(map.get("qna_type")));
				qv.setQna_title(StringUtil.get(map.get("qna_title")));
				qv.setQna_comment(StringUtil.get(map.get("qna_comment")));
				qv.setQna_status("0");
				qv.setQna_shop_name(StringUtil.get(map.get("qna_shop_name")));
				qv.setQna_writer(StringUtil.get(map.get("shop_owner_name")));
				qv.setQna_writer_seq(StringUtil.get(map.get("shop_seq")));

				mapper.qna_insert(qv);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}


	}
