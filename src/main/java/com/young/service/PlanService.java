package com.young.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class PlanService {

	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}

}
