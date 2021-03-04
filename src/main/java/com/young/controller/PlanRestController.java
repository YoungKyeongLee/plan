package com.young.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.young.service.PlanRestService;
import com.young.vo.MembershipVO;

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
	
	@RequestMapping("/signIn/")
	@PostMapping(produces="application/text; charset=utf8")
	public HashMap<String, Object> signIn(@RequestBody MembershipVO vo) {
		return svc.signIn(vo);
	}
}
