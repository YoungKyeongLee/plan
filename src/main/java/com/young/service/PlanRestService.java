package com.young.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.dao.MembershipDAO;
import com.young.vo.MembershipVO;

@Service
public class PlanRestService {

	@Autowired MembershipDAO membershipDAO;
	
	public String idCheck(String userid) {
		int result = membershipDAO.idCheck(userid);
		return result == 0 ? "true" : "false";
	}
	
	public String signUp(MembershipVO vo) {
		return null;
	}

}
