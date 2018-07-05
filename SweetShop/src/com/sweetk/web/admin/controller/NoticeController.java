package com.sweetk.web.admin.controller;

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
import com.sweetk.web.admin.mapper.NoticeMapper;
import com.sweetk.web.common.constants.Constant;
import com.sweetk.web.common.domain.Paging;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.StringUtil;
import com.sweetk.web.shop.mapper.EventMapper;
import com.sweetk.web.shop.vo.EventImgVo;
import com.sweetk.web.shop.vo.ShopEventVo;



@Controller
public class NoticeController{
	Logger log = Logger.getLogger(NoticeController.class);

	@Autowired
    private SqlSession sqlSession;

    @Autowired
    private PlatformTransactionManager transactionManager;

    @RequestMapping("/notice_detail.do")
    protected ModelAndView detail(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/notice/notice_detail");

    	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int noticeSeq;
		if(req.getParameter("notice_seq") != null){
			noticeSeq = Integer.parseInt(StringUtil.get(req.getParameter("notice_seq")));
		}else{
			noticeSeq = 0;
		}
		HashMap<String, String> sm = mapper.notice(noticeSeq);
		req.setAttribute("notice_detail", sm);

		return mav;
	}

    @RequestMapping("/notice_list.do")
    protected ModelAndView list(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/notice/notice_list");
    	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

		int page = 1;
		if(req.getParameter("page") != null){
		   page = Integer.parseInt(req.getParameter("page"));
		}
		String noticeTarget = StringUtil.get(req.getParameter("notice_target"));
		if(noticeTarget.equals("A")){
			noticeTarget = "";
		}
		String noticeTitle = StringUtil.get(req.getParameter("notice_title"));
		int pageSize = Constant.PAGE_SIZE;
		int currtentPage = (page-1) * pageSize;
		int totalCount = mapper.notice_count(noticeTarget, noticeTitle);
		ArrayList<HashMap<String, String>> al = mapper.notice_list(currtentPage, pageSize, noticeTarget, noticeTitle);
		Paging paging = new Paging(al,totalCount,page,pageSize);
		req.setAttribute("notice_list", paging);

		return mav;
	}

    @RequestMapping("/notice_modify.do")
    protected ModelAndView modify(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/notice/notice_modify");

    	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int noticeSeq;
		if(req.getParameter("notice_seq") != null){
			noticeSeq = Integer.parseInt(StringUtil.get(req.getParameter("notice_seq")));
		}else{
			noticeSeq = 0;
		}
		HashMap<String, String> sm = mapper.notice(noticeSeq);
		req.setAttribute("notice_detail", sm);

		return mav;
	}

    @RequestMapping("/notice_write.do")
    protected ModelAndView write(HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {

    	log = Logger.getLogger(NoticeController.class);

    	ModelAndView mav = new ModelAndView("admin/notice/notice_write");

		return mav;
	}

	@RequestMapping(value = "/notice_save.json", method = {RequestMethod.GET, RequestMethod.POST})
	protected @ResponseBody String notice_save(@RequestParam Map<String,Object> map) {

		System.out.println(map);
		HashMap<String, String> resultMap = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
			mapper.notice_insert(StringUtil.get(map.get("notice_target")),
								StringUtil.get(map.get("notice_title")),
								StringUtil.get(map.get("notice_comment")),
								StringUtil.get(map.get("notice_path")),
								StringUtil.get(map.get("notice_org_name")),
								StringUtil.get(map.get("notice_file")));
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e);
			resultMap.put("result", "fail");
		}

		return gson.toJson(resultMap);

	}

	@RequestMapping(value = "/notice_update.json", method = {RequestMethod.GET, RequestMethod.POST})
	protected @ResponseBody String notice_update(@RequestParam Map<String,Object> map) {
		System.out.println(map);
		HashMap<String, String> resultMap = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
			mapper.notice_update(StringUtil.get(map.get("notice_seq")),
								StringUtil.get(map.get("notice_target")),
								StringUtil.get(map.get("notice_title")),
								StringUtil.get(map.get("notice_comment")),
								StringUtil.get(map.get("notice_path")),
								StringUtil.get(map.get("notice_org_name")),
								StringUtil.get(map.get("notice_file")));
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}

		return gson.toJson(resultMap);

	}

	@RequestMapping(value = "/notice_file_upload.do", method = RequestMethod.POST)
	public @ResponseBody String notice_file_upload(@RequestParam("notice_file") MultipartFile multipartFile, HttpServletRequest request ,HttpServletResponse resp) throws IOException{

        String result;
        String filePath = null;
        String original_name = null;
        String time_millis_name = null;

        String multipartFileName = multipartFile.getOriginalFilename();

        try {
        	time_millis_name = System.currentTimeMillis()+multipartFileName.substring(multipartFileName.lastIndexOf("."));;
            String uploadPath = request.getSession().getServletContext().getRealPath("/upload/notice_file/");

            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+time_millis_name));

            result = "success";
            filePath = "/upload/notice_file/"+time_millis_name;
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
