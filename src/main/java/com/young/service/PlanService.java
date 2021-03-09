package com.young.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.young.others.Login;
import com.young.vo.MembershipVO;

@Service
public class PlanService {

	public ModelAndView home(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("home");
		MembershipVO user = (MembershipVO)req.getSession().getAttribute("user");
		if(user != null) {
			Login.getList(req, user);			
		}
		return mav;
	}

}
