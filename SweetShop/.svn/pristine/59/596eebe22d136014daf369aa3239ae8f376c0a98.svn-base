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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sweetk.web.admin.mapper.CodeMapper;
import com.sweetk.web.admin.mapper.LoginMapper;
import com.sweetk.web.admin.mapper.ShopMapper;
import com.sweetk.web.admin.vo.CodeVo;
import com.sweetk.web.admin.vo.LoginVo;
import com.sweetk.web.admin.vo.ShopVo;
import com.sweetk.web.common.utils.StringUtil;


@Controller
public class CommonController {
		Logger log = Logger.getLogger(CommonController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

		@RequestMapping("/mypage_modify.do")
		protected ModelAndView mypage_modify(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/common/mypage_modify");

			ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);
			LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
			int shopSeq = 0;
			if(req.getSession().getAttribute("shop_seq")!= null){
				shopSeq = Integer.parseInt((String) req.getSession().getAttribute("shop_seq"));
			}
			HashMap<String, String> sv = mapper.shop(shopSeq+"");
			req.setAttribute("shop_detail", sv);
			CodeMapper codeMapper = sqlSession.getMapper(CodeMapper.class);
			CodeVo cv = new CodeVo();
			cv.setCode_type("shop_type");
			ArrayList<HashMap<String, String>> al = codeMapper.CodeList(cv);
			ArrayList<HashMap<String, String>> login = loginMapper.login_user_info(shopSeq);
			req.setAttribute("shop_code", al);
			req.setAttribute("user_info", login);

			return mav;
		}

		@RequestMapping(value = "/mypage_update.json", method = {RequestMethod.GET, RequestMethod.POST})
		protected @ResponseBody String shop_save(@RequestParam Map<String,Object> map,HttpSession session) {

			System.out.println(map);
			HashMap<String, String> resultMap = new HashMap<String, String>();
			try {

				ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);

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

				mapper.shop_update(sv);

				LoginMapper Lmapper = sqlSession.getMapper(LoginMapper.class);

				LoginVo lv = new LoginVo();
				lv.setPwd(StringUtil.get(map.get("pwd")));
				lv.setShop_seq(StringUtil.get(map.get("shop_seq")));
				Lmapper.login_update_by_shop_seq(lv);

				session.setAttribute("name", StringUtil.get(map.get("shop_owner_name")));

				resultMap.put("result", "success");
			} catch (Exception e) {
				resultMap.put("result", "fail");
			}

			Gson gson = new Gson();

			return gson.toJson(resultMap);

		}

		@RequestMapping("/password_modify.do")
		protected ModelAndView password_modify(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("/owner/common/password_modify");

			return mav;
		}

	}
