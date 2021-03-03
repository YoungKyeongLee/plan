package com.young.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.dao.MembershipDAO;
import com.young.others.Encrypt;
import com.young.vo.MembershipVO;

@Service
public class PlanRestService {

	@Autowired MembershipDAO membershipDAO;
	
	public String idCheck(String userid) {
		int result = membershipDAO.idCheck(userid);
		return result == 0 ? "true" : "false";
	}
	
	public String signUp(MembershipVO vo) {
		vo.setPw(Encrypt.SecurePassword(vo.getId(), vo.getPw()));
		int result = membershipDAO.insert(vo);
		return result == 1 ? "true" : "false";
	}

}
