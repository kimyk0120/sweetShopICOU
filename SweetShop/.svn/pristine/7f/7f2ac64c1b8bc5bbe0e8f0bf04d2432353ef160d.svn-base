package com.sweetk.web.admin.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.web.admin.mapper.CodeMapper;
import com.sweetk.web.admin.mapper.QnaMapper;
import com.sweetk.web.admin.vo.CodeVo;
import com.sweetk.web.common.constants.Constant;
import com.sweetk.web.common.domain.Paging;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.EmailSend;
import com.sweetk.web.common.utils.StringUtil;



@Controller
public class QAController{
	Logger log = Logger.getLogger(QAController.class);

	@Autowired
    private SqlSession sqlSession;

    @Autowired
    private PlatformTransactionManager transactionManager;

    @RequestMapping("/qa_detail.do")
    protected ModelAndView detail(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/qa/qa_detail");


    	QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);

		HashMap<String, String> sqv = mapper.qna(StringUtil.get(req.getParameter("qna_seq")));
		HashMap<String, String> qnapre = mapper.qna_prv(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))));
		HashMap<String, String> qnanext = mapper.qna_next(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))));
		HashMap<String, String> qaa = mapper.qna_answer(StringUtil.get(req.getParameter("qna_seq")));
		req.setAttribute("qna_detail", sqv);
		req.setAttribute("qna_answer", qaa);
		req.setAttribute("qna_pre", qnapre);
		req.setAttribute("qna_next", qnanext);

		return mav;
	}

    @RequestMapping("/qa_list.do")
    protected ModelAndView list(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/qa/qa_list");

    	QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int page = 1;
		if(req.getParameter("page") != null){
		   page = Integer.parseInt(req.getParameter("page"));
		}

		String startDate = StringUtil.get(req.getParameter("start_date"));
		String endDate = StringUtil.get(req.getParameter("end_date"));

		if(startDate.equals("")){
			startDate = DateUtil.getDate(1);
			endDate = DateUtil.getDate();
		}
		startDate = startDate + Constant.DATE_START_TIME_STR;
		endDate = endDate + Constant.DATE_END_TIME_STR;

		String qna_title = StringUtil.get(req.getParameter("qna_title"));
		String qna_writer = StringUtil.get(req.getParameter("qna_writer"));
		String qna_target = StringUtil.get(req.getParameter("qna_target"));
		String qna_status = StringUtil.get(req.getParameter("qna_status"));
		String qna_type = StringUtil.get(req.getParameter("qna_type"));
		int pageSize = Constant.PAGE_SIZE;
		int currtentPage = (page-1) * pageSize;
		int totalCount = mapper.qna_count(qna_title, qna_writer, qna_target, qna_status,qna_type, startDate, endDate);
		ArrayList<HashMap<String, String>> al = mapper.qna_list(currtentPage, pageSize, qna_title,qna_writer,qna_target,qna_status,qna_type,startDate,endDate);
		Paging paging = new Paging(al,totalCount,page,pageSize);
		req.setAttribute("qna_list", paging);

		CodeMapper codeMapper = sqlSession.getMapper(CodeMapper.class);
		CodeVo cv = new CodeVo();
		cv.setCode_type("qna_type");
		ArrayList<HashMap<String, String>> al2 = codeMapper.CodeList(cv);
		req.setAttribute("qna_code", al2);

		return mav;
	}

	@RequestMapping(value = "/qna_answer_save.json", method = {RequestMethod.GET, RequestMethod.POST})
	protected @ResponseBody String qna_save(@RequestParam Map<String,Object> map,HttpServletRequest req) {

		HashMap<String, String> resultMap = new HashMap<String, String>();
		try {
			QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
			mapper.qna_status_update(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))),"1");
			mapper.qna_insert(StringUtil.get(map.get("qna_seq")),
								StringUtil.get(map.get("qna_title")),
								StringUtil.get(map.get("qna_comment")));

			EmailSend emailSend = new EmailSend();
			emailSend.mailSend(StringUtil.get(map.get("qna_writer")), "sweetk", StringUtil.get(map.get("qna_title")), StringUtil.get(map.get("qna_comment")));

			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}

		Gson gson = new Gson();

		return gson.toJson(resultMap);

	}

	@RequestMapping(value = "/qna_answer_update.json", method = {RequestMethod.GET, RequestMethod.POST})
	protected @ResponseBody String qna_answer_update(@RequestParam Map<String,Object> map,HttpServletRequest req) {

		HashMap<String, String> resultMap = new HashMap<String, String>();
		try {
			QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
			mapper.qna_update(Integer.parseInt(StringUtil.get(req.getParameter("qna_seq"))),StringUtil.get(map.get("qna_comment")));

			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}

		Gson gson = new Gson();

		return gson.toJson(resultMap);

	}

}
