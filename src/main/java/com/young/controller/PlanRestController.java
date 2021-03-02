package com.young.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.young.service.PlanRestService;

@RestController
public class PlanRestController {
	
	@Autowired PlanRestService svc;
	
	@RequestMapping("/rest/signUp/")
	@PostMapping(produces="application/text; charset=utf8")
	public String signUp() {
		return "";
	}
}
