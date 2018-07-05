package com.sweetk.interceptor;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sweetk.web.admin.controller.QAController;

@Controller("HttpInterceptor")
public class HttpInterceptor extends HandlerInterceptorAdapter{

	Logger log = Logger.getLogger(HttpInterceptor.class);

	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	long start;
	long end;
	boolean flag = false;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		flag = false;
		String requestURI = request.getRequestURI();
		
		System.out.println("requestURI : "+requestURI);
        if(request.getParameter("id")!=null){
     	   return true;
        }
        if (requestURI.indexOf("/login_check.do") > -1) { //세션체크 예외페이지
            return true;
        } else if (requestURI.indexOf("/login.do") > -1) {
            return true;
        } else if (requestURI.indexOf("/src/") > -1) {
        	return true;
        } else if (requestURI.indexOf("/user/") > -1) {
        	return true;
        } else if (requestURI.indexOf("/upload/") > -1) {
        	
        	return true;
        } else {//위의 예외페이지 외에는 세션값을 체크해서 있으면 그냥 페이지표시

            HttpSession session = request.getSession();
            String loginID = (String)session.getAttribute("Id");
            if (loginID != null && !loginID.isEmpty()) {
            	start = System.currentTimeMillis() ;
            	log.info(dayTime.format(start)+" ["+request.getRequestURI()+"] page response start!");
            	flag = true;
                return true;
            } else {
                request.getRequestDispatcher(request.getContextPath() + "/login.do").forward(request, response);
                return false;
            }
        }

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		if(flag){
			end = System.currentTimeMillis();
			log.info(dayTime.format(end)+"["+request.getRequestURI()+"] page response complete for " +(end-start)+" Millis" );
		}
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	//System.out.println("TestInterceptor{postHandle}............................................ end");
	}


}
