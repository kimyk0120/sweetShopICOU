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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.web.admin.mapper.CodeMapper;
import com.sweetk.web.admin.mapper.LoginMapper;
import com.sweetk.web.admin.mapper.ShopMapper;
import com.sweetk.web.admin.vo.CodeVo;
import com.sweetk.web.admin.vo.LoginVo;
import com.sweetk.web.admin.vo.ShopVo;
import com.sweetk.web.common.constants.Constant;
import com.sweetk.web.common.domain.Paging;
import com.sweetk.web.common.utils.DateUtil;
import com.sweetk.web.common.utils.StringUtil;

@Controller
public class ShopController {
		Logger log = Logger.getLogger(ShopController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

		@RequestMapping("/owner_regis.do")
		protected ModelAndView owner_regis(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/admin/shop/owner_regis");

			CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
			CodeVo cv = new CodeVo();
			cv.setCode_type("shop_type");
			ArrayList<HashMap<String, String>> al = mapper.CodeList(cv);
			req.setAttribute("shop_code", al);
			return mav;
		}

		@RequestMapping(value = "/owner_regis_check.json", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody String owner_regis_check(@RequestParam Map<String,Object>map) {
		    String ownerId = StringUtil.get(map.get("owner_id"));

			LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);

			LoginVo lvo = new LoginVo();
			lvo.setId(ownerId);
			int a = mapper.login_id_check(lvo);

			HashMap<String, String> resultMap = new HashMap<String, String>();
			if(a>0){
				resultMap.put("result", "true");
			}else{
				resultMap.put("result", "false");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);
		}

		@RequestMapping(value = "/shop_reg_number_check.json", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody String shop_reg_number_check(@RequestParam Map<String,Object>map) {
			String shopRegNumber = StringUtil.get(map.get("shop_reg_number"));

			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);

			ShopVo Svo = new ShopVo();
			Svo.setShop_reg_number(shopRegNumber);
			int a = mapper.shop_reg_number_check(Svo);

			HashMap<String, String> resultMap = new HashMap<String, String>();
			if(a>0){
				resultMap.put("result", "true");
			}else{
				resultMap.put("result", "false");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);
		}

		@RequestMapping(value = "/shop_name_check.json", method = {RequestMethod.GET, RequestMethod.POST})
		public @ResponseBody String shop_name_check(@RequestParam Map<String,Object>map) {
			String shopRegNumber = StringUtil.get(map.get("shop_name"));

			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);

			ShopVo Svo = new ShopVo();
			Svo.setShop_reg_number(shopRegNumber);
			int a = mapper.shop_name_check(shopRegNumber);

			HashMap<String, String> resultMap = new HashMap<String, String>();
			if(a>0){
				resultMap.put("result", "true");
			}else{
				resultMap.put("result", "false");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);
		}


		@RequestMapping(value = "/shop_img_upload.do", method = RequestMethod.POST)
		public @ResponseBody String shop_img_upload(@RequestParam("shop_img_file") MultipartFile multipartFile, HttpServletRequest request ,HttpServletResponse resp) throws IOException{

	        String result;
	        String filePath = null;
	        String original_name = null;
	        String time_millis_name = null;

	        String multipartFileName = multipartFile.getOriginalFilename();

	        try {
	        	time_millis_name = System.currentTimeMillis()+multipartFileName.substring(multipartFileName.lastIndexOf("."));;
	            String uploadPath = request.getSession().getServletContext().getRealPath("/upload/shop_img/");

	            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+time_millis_name));

	            result = "success";
	            filePath = "/upload/shop_img/"+time_millis_name;
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


		@Transactional
		@RequestMapping(value = "/shop_save.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_save(@RequestParam Map<String,Object> map) {

			System.out.println(map);
			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {

				ShopMapper Smapper = sqlSession.getMapper(ShopMapper.class);

				ShopVo sv = new ShopVo();
				sv.setShop_name(StringUtil.get(map.get("shop_name")));
				sv.setShop_reg_number(StringUtil.get(map.get("shop_reg_number")));
				sv.setShop_zip(StringUtil.get(map.get("shop_zip")));
				sv.setShop_addr1(StringUtil.get(map.get("shop_addr1")));
				sv.setShop_location_lat(StringUtil.get(map.get("shop_location_lat")));
				sv.setShop_location_long(StringUtil.get(map.get("shop_location_long")));
				sv.setShop_tel(StringUtil.get(map.get("shop_tel1")));
				sv.setShop_kind(StringUtil.get(map.get("shop_kind")));
				sv.setShop_menu(StringUtil.get(map.get("shop_menu")));
				sv.setShop_owner_name(StringUtil.get(map.get("shop_owner_name")));
				sv.setShop_phone(StringUtil.get(map.get("shop_phone1")));
				sv.setShop_img_name(StringUtil.get(map.get("shop_img_name")));
				sv.setShop_img_org_name(StringUtil.get(map.get("shop_img_org_name")));
				sv.setShop_img_path(StringUtil.get(map.get("shop_img_path")));

				Smapper.shop_insert(sv);
				ShopVo sv2 = new ShopVo();
				sv2.setShop_name(sv.getShop_name());
				ArrayList<ShopVo> Shoplist = Smapper.shop_by_name(sv2);

				LoginMapper Lmapper = sqlSession.getMapper(LoginMapper.class);

				LoginVo lv = new LoginVo();
				lv.setId(StringUtil.get(map.get("id")));
				lv.setPwd(StringUtil.get(map.get("pwd")));
				lv.setUser_type("SO");
				lv.setShop_seq(Shoplist.get(0).getShop_seq());
				Lmapper.login_insert(lv);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}


		@RequestMapping("/owner_list.do")
		protected ModelAndView owner_list(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/admin/shop/owner_list");
			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);

			String shop_name = StringUtil.get(req.getParameter("shop_name"));
			String shop_reg_number = StringUtil.get(req.getParameter("shop_reg_number"));

			int page = 1;
			if(req.getParameter("page") != null){
			   page = Integer.parseInt(req.getParameter("page"));
			}

			int pageSize = Constant.PAGE_SIZE;
			int currtentPage = (page-1) * pageSize;
			int totalCount = mapper.shop_total_count(shop_name,shop_reg_number);
			ArrayList<HashMap<String, String>> al = mapper.shop_list(currtentPage, pageSize ,shop_name,shop_reg_number);
			Paging paging = new Paging(al,totalCount,page,pageSize);
			req.setAttribute("shop_list", paging);
			return mav;
		}

		@RequestMapping("/owner_detail.do")
		protected ModelAndView owner_detail(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/admin/shop/owner_detail");
			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);
			Object sv = mapper.shop(StringUtil.get(req.getParameter("shop_seq")));
			req.setAttribute("shop_detail", sv);
			CodeMapper codeMapper = sqlSession.getMapper(CodeMapper.class);
			CodeVo cv = new CodeVo();
			cv.setCode_type("shop_type");
			ArrayList<HashMap<String, String>> al = codeMapper.CodeList(cv);
			req.setAttribute("shop_code", al);
			return mav;
		}

		@RequestMapping("/owner_modify.do")
		protected ModelAndView owner_modify(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/admin/shop/owner_modify");
			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);

			String shop_seq = req.getParameter("shop_seq");
			Object sv = mapper.shop(shop_seq);
			req.setAttribute("shop_detail", sv);
			CodeMapper codeMapper = sqlSession.getMapper(CodeMapper.class);
			CodeVo cv = new CodeVo();
			cv.setCode_type("shop_type");
			ArrayList<HashMap<String, String>> al = codeMapper.CodeList(cv);
			req.setAttribute("shop_code", al);
			return mav;
		}

		@Transactional
		@RequestMapping(value = "/owner_modify.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String owner_modify(@RequestParam Map<String,Object> map) {

			System.out.println("param map :"+map);
			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {

				ShopMapper Smapper = sqlSession.getMapper(ShopMapper.class);

				ShopVo sv = new ShopVo();
				sv.setShop_seq(StringUtil.get(map.get("shop_seq")));
				sv.setShop_name(StringUtil.get(map.get("shop_name")));
				sv.setShop_reg_number(StringUtil.get(map.get("shop_reg_number")));
				sv.setShop_zip(StringUtil.get(map.get("shop_zip")));
				sv.setShop_addr1(StringUtil.get(map.get("shop_addr1")));
				sv.setShop_location_lat(StringUtil.get(map.get("shop_location_lat")));
				sv.setShop_location_long(StringUtil.get(map.get("shop_location_long")));
				sv.setShop_tel(StringUtil.get(map.get("shop_tel1")));
				sv.setShop_kind(StringUtil.get(map.get("shop_kind")));
				sv.setShop_menu(StringUtil.get(map.get("shop_menu")));
				sv.setShop_owner_name(StringUtil.get(map.get("shop_owner_name")));
				sv.setShop_phone(StringUtil.get(map.get("shop_phone1")));
				sv.setShop_img_name(StringUtil.get(map.get("shop_img_name")));
				sv.setShop_img_org_name(StringUtil.get(map.get("shop_img_org_name")));
				sv.setShop_img_path(StringUtil.get(map.get("shop_img_path")));

				Smapper.shop_update(sv);


				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@Transactional
		@RequestMapping(value = "/shop_delete.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_delete(@RequestParam Map<String,Object> map) {

			System.out.println(map);
			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {

				ShopMapper Smapper = sqlSession.getMapper(ShopMapper.class);
				String shopSeq = StringUtil.get(map.get("shop_seq"));
				Smapper.shop_delete(shopSeq);
				LoginMapper Lmapper = sqlSession.getMapper(LoginMapper.class);
				Lmapper.login_delete_by_shop_seq(shopSeq);

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}
	}
