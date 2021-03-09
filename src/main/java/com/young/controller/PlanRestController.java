package com.young.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.young.service.PlanRestService;
import com.young.vo.BunchVO;
import com.young.vo.GoalVO;
import com.young.vo.MembershipVO;
import com.young.vo.ScheduleVO;

@RestController
@RequestMapping("/rest")
public class PlanRestController {
	
	@Autowired PlanRestService svc;
	
	@RequestMapping("/signUp/idCheck/{userid}/")
	@GetMapping(produces="application/text; charset=utf8")
	public String idCheck(@PathVariable("userid")String userid) {
		return svc.idCheck(userid);
	}
	
	@RequestMapping("/signUp/")
	@PostMapping(produces="application/text; charset=utf8")
	public String signUp(@RequestBody MembershipVO vo) {
		return svc.signUp(vo);
	}
	
	@RequestMapping(value="/signIn/", method=RequestMethod.POST, produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String signIn(HttpServletRequest req, @RequestBody MembershipVO vo) {
		return svc.signIn(req, vo);
	}
	
	@RequestMapping("/addSchedule/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addSchedule(@RequestBody ScheduleVO vo) {
		return svc.addSchedule(vo);
	}
	
	@RequestMapping("/addGoal/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addGoal(@RequestBody GoalVO vo) {
		return svc.addGoal(vo);
	}
	
	@RequestMapping("/addBunch/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addBunch(@RequestBody BunchVO vo) {
		return svc.addBunch(vo);
	}
}
