package com.young.controller;

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
import com.young.vo.BucketVO;
import com.young.vo.BunchVO;
import com.young.vo.GoalVO;
import com.young.vo.MembershipVO;
import com.young.vo.ScheduleVO;

@RestController
@RequestMapping(value="/rest", produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	
	@RequestMapping(value="/signIn/", method=RequestMethod.POST)
	public String signIn(HttpServletRequest req, @RequestBody MembershipVO vo) {
		return svc.signIn(req, vo);
	}
	
	@RequestMapping(value="/logout/", method=RequestMethod.GET)
	public void logout(HttpServletRequest req) {
		svc.logout(req);
	}
	
	@RequestMapping("/addSchedule/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addSchedule(HttpServletRequest req, @RequestBody ScheduleVO vo) {
		return svc.addSchedule(req, vo);
	}
	
	@RequestMapping("/addGoal/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addGoal(HttpServletRequest req, @RequestBody GoalVO vo) {
		return svc.addGoal(req, vo);
	}
	
	@RequestMapping("/addBunch/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addBunch(HttpServletRequest req, @RequestBody BunchVO vo) {
		return svc.addBunch(req, vo);
	}
	
	@RequestMapping("/addBucket/")
	@PostMapping(produces="application/text; charset=utf8")
	public String addBucket(HttpServletRequest req, @RequestBody BucketVO vo) {
		return svc.addBucket(req, vo);
	}
	
	@RequestMapping("/updateBucket/")
	@PostMapping(produces="application/text; charset=utf8")
	public String updateBucket(HttpServletRequest req, @RequestBody BucketVO vo) {
		return svc.updateBucket(req, vo);
	}
	
	@RequestMapping("/removeBucket/")
	@PostMapping(produces="application/text; charset=utf8")
	public String removeBucket(HttpServletRequest req, @RequestBody BucketVO vo) {
		return svc.removeBucket(req, vo);
	}
}
