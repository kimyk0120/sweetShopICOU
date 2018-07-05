package com.sweetk.web.admin.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

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

import com.sweetk.web.admin.mapper.LoginMapper;
import com.sweetk.web.admin.mapper.ShopMapper;
import com.sweetk.web.admin.vo.LoginVo;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(LoginController.class);

		@Autowired
	    private SqlSession sqlSession;

	    @Autowired
	    private PlatformTransactionManager transactionManager;

	    @RequestMapping("/")
		protected ModelAndView login() {
			ModelAndView mav = new ModelAndView("login");
			return mav;
		}

		@RequestMapping("/login.do")
		protected ModelAndView login_do() {
			ModelAndView mav = new ModelAndView("login");

			return mav;
		}

		@RequestMapping("/logout.do")
		protected ModelAndView logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

			ModelAndView mav = new ModelAndView("login");

			try{
				/*
				 *
				session.setAttribute("Id", null);
				session.setAttribute("Pwd", null);
				 */
				session.invalidate();
			}catch(Exception e){
				e.printStackTrace();
			}

			return mav;
		}

		@RequestMapping("/login_check.do")
		protected ModelAndView login_process(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			ModelAndView mav = new ModelAndView("login");

			LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);

			ArrayList<LoginVo> l_list = null;
			LoginVo lvo = new LoginVo();

			try{
				String id = req.getParameter("ID");
				String pwd = req.getParameter("PWD");

				lvo.setId(id);
				lvo.setPwd(pwd);

				int a = mapper.login_check(lvo);


				if ( a > 0 ){

					mapper.groupConcatMaxLenSet(0);

					l_list = mapper.loginInfo(lvo);

					if(l_list.size() > 0) {

						session.setAttribute("Id", l_list.get(0).getId());
						session.setAttribute("Pwd", l_list.get(0).getPwd());
						session.setAttribute("shop_seq", l_list.get(0).getShop_seq());
						if(l_list.get(0).getUser_type()==null){
							resp.sendRedirect("/owner_list.do");
							session.setAttribute("name", "admin");
						}else{
							ShopMapper shopmapper = sqlSession.getMapper(ShopMapper.class);
							HashMap<String, String> shop = shopmapper.shop(l_list.get(0).getShop_seq()+"");
							session.setAttribute("name", shop.get("shop_owner_name"));

							resp.sendRedirect("/dashboard.do");
						}
					}


				}
				else {
					mav.addObject("msg", "아이디 또는 비밀번호가 틀렸습니다.");
				}


				Enumeration<?> se = session.getAttributeNames();

				  while(se.hasMoreElements()){
				   String getse = se.nextElement()+"";
				   System.out.println("@@@@@@@ session : "+getse+" : "+session.getAttribute(getse));
				  }

			}
			catch(Exception e){
				e.printStackTrace();
			}

			return mav;
		}

	}
