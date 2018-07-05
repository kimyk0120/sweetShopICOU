package com.sweetk.mobile.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.mobile.user.mapper.NoticeQnAMapper;
import com.sweetk.mobile.user.vo.NoticeQnAVO;
import com.sweetk.web.common.constants.Constant;



@Controller
@RequestMapping("/user/*")
public class UserNoticeQnAController{
	Logger log = Logger.getLogger(UserNoticeQnAController.class);

	@Autowired
    private SqlSession sqlSession;
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager; 

    
    // 공지사항 , 문의하기 메인
//	@RequestMapping(value = "/noticeQnaFrame.do", method = {RequestMethod.GET})
//    protected ModelAndView noticeQnaFrame(HttpServletRequest req, HttpSession session, HttpServletResponse resp
//    		,@RequestParam(value="fromQnaReg",required=false)String fromQnaReg)  {
//
//    	ModelAndView mav = new ModelAndView("user/noticeQna/noticeQnaFrame");
//    	int seq = Integer.parseInt(req.getParameter("userSeq"));
//    	session.setAttribute("userSeq", seq);
//    	
//    	if(fromQnaReg!=null&&fromQnaReg.equals("Y")){
//    		mav.addObject("fromQnaReg",fromQnaReg);
//    	}
//    	
//    	return mav;
//	}   	

    
    //  공지사항 리스트
    @RequestMapping(value = "/notice.do", method = {RequestMethod.GET})
    protected ModelAndView noticeList(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	ModelAndView mav = new ModelAndView("user/noticeQna/notice_list");
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);

    	//int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
    	int seq = Integer.parseInt(req.getParameter("userSeq"));
    	session.setAttribute("userSeq", seq);
    	
    	int page = 0;
    	if(req.getParameter("page") != null){
 		   page = Integer.parseInt(req.getParameter("page"));
 		   page = page*10;
 		}
    	int pageSize = Constant.PAGE_SIZE;
    	
    	ArrayList<NoticeQnAVO> noticeList = mapper.selectNoticeList(page,pageSize);
    	
    	mav.addObject("noticeList",noticeList);
    	
    	return mav;
	}   	

    //공지사항 스크롤 로딩
    @RequestMapping(value = "/noticeScrollLoad.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected ModelAndView noticeScrollLoad(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/notice_list_temp");
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);

   	 	int page = Integer.parseInt(req.getParameter("page"));
   	 	page = page*10;
 	 
		int pageSize = Constant.PAGE_SIZE;
		ArrayList<NoticeQnAVO> noticeList = mapper.selectNoticeList(page,pageSize);
		mav.addObject("noticeList",noticeList);
		return mav;
    }   	

    
    // 공지사항 상세
    @RequestMapping(value = "/noticeDetail.do", method = {RequestMethod.GET})
    protected ModelAndView noticeDetail(HttpServletRequest req, HttpSession session, HttpServletResponse res)  {
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/notice_detail");
    	
    	int seq = Integer.parseInt(req.getParameter("seq"));
    	
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);
    	
    	HashMap<String, NoticeQnAVO> resultMap = mapper.selectNoticeContent(seq);
    	
    	
    	System.out.println("test");
    	System.out.println("resultMap.get : " + resultMap.get("NOTICE_COMMENT"));
    	
    	
    	
    	Gson gson = new Gson();
    	
    	mav.addObject("noticeDetail",gson.toJson(resultMap));
		return mav;
    }   	
    
    // qna 리스트
    @RequestMapping(value = "/qna.do", method = {RequestMethod.GET})
    protected ModelAndView qnaList(HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws IOException  {
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/qna_list");
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);
    	
    	int seq = Integer.parseInt(req.getParameter("userSeq"));
    	session.setAttribute("userSeq", seq);
    	
		int page = 0;
    	if(req.getParameter("page") != null){
 		   page = Integer.parseInt(req.getParameter("page"));
 		   page = page*10;
 		}
    	int pageSize = Constant.PAGE_SIZE;
		
		ArrayList<NoticeQnAVO> qnaList = mapper.selectQnAList(seq,page,pageSize);
		mav.addObject("qnaList",qnaList);
    	
    	return mav;
	}

    //qna 스크롤 로딩
    @RequestMapping(value = "/qnaScrollLoad.do", method = {RequestMethod.GET,RequestMethod.POST})
    protected ModelAndView qnaScrollLoad(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/qna_list_temp");
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);
    	
    	int seq = Integer.parseInt(session.getAttribute("userSeq").toString());
   	 	int page = Integer.parseInt(req.getParameter("page"));
   	 	page = page*10;
 	 
		int pageSize = Constant.PAGE_SIZE;
		ArrayList<NoticeQnAVO> qnaList = mapper.selectQnAList(seq,page,pageSize);
		mav.addObject("qnaList",qnaList);
		return mav;
    }   
    
    @Transactional
    @RequestMapping(value = "/qnaDetail.do", method = {RequestMethod.GET})
    protected ModelAndView qnaDetail(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	int seq = Integer.parseInt(req.getParameter("seq"));
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/qna_detail");
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);
    	
    	//상세내용
    	NoticeQnAVO qnaDetail = mapper.selectQnAContent(seq);
    	mav.addObject("qnaDetail" , qnaDetail);
    	String status = qnaDetail.getQna_status();
    	//답변완료일때 
    	if(status!=null||status=="1"){
    		int answerSeq = qnaDetail.getTop_qna_seq();
    		NoticeQnAVO qnaAnswer = mapper.selectQnAContent(answerSeq);
    		mav.addObject("qnaAnswer" , qnaAnswer);
    		return mav;
    	}
    	return mav;
    }
    
    //문의하기 등록폼
    @RequestMapping(value = "/qnaRegist.do", method = {RequestMethod.GET})
    protected ModelAndView qnaRegist_form(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
    	
    	ModelAndView mav = new ModelAndView("user/noticeQna/qna_registForm");
    	log = Logger.getLogger(UserNoticeQnAController.class);
    	
    	return mav;
    }

    //문의하기 저장
    @RequestMapping(value = "/qnaRegist.do", method = {RequestMethod.POST})
    protected void qnaRegistPost(HttpServletRequest req, HttpSession session, HttpServletResponse resp,NoticeQnAVO vo) throws Exception  {
    	
    	log = Logger.getLogger(UserNoticeQnAController.class);
    	NoticeQnAMapper mapper = sqlSession.getMapper(NoticeQnAMapper.class);
    	
    	vo.setUser_seq(Integer.parseInt(session.getAttribute("userSeq").toString()));
    	
    	int a = mapper.insertQnA(vo);
    	
    	PrintWriter printWriter = resp.getWriter();
    	if(a>0){
    		printWriter.print("1");
    	}else{
    		printWriter.print("0");
    	}
		printWriter.close();
    }
    
}
