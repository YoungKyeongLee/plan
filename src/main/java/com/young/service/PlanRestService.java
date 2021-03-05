package com.young.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.dao.BucketDAO;
import com.young.dao.BunchDAO;
import com.young.dao.GoalDAO;
import com.young.dao.MembershipDAO;
import com.young.dao.ScheduleDAO;
import com.young.others.Encrypt;
import com.young.vo.MembershipVO;

@Service
public class PlanRestService {

	@Autowired MembershipDAO membershipDAO;
	@Autowired BunchDAO bunchDAO;
	@Autowired ScheduleDAO scheduleDAO;
	@Autowired GoalDAO goalDAO;
	@Autowired BucketDAO bucketDAO;
	
	public String idCheck(String userid) {
		int result = membershipDAO.idCheck(userid);
		return result == 0 ? "true" : "false";
	}
	
	public String signUp(MembershipVO vo) {
		vo.setPw(Encrypt.SecurePassword(vo.getId(), vo.getPw()));
		int result = membershipDAO.insert(vo);
		return result == 1 ? "true" : "false";
	}

	public HashMap<String, Object> signIn(MembershipVO vo) {
		HashMap<String, Object> resultList = new HashMap<String, Object>();
		vo.setPw(Encrypt.SecurePassword(vo.getId(), vo.getPw()));
		MembershipVO user = membershipDAO.select(vo);
		String id = user.getId();
		boolean loginCheck = user != null;
		resultList.put("result", loginCheck);
		if(loginCheck) {
			// 관련된 리스트들 보내주어야 한다!
			resultList.put("id", id);
			resultList.put("name", user.getName());
			resultList.put("bunchList", bunchDAO.select(id));
			resultList.put("scheduleList", scheduleDAO.select(id));
			resultList.put("goalList", goalDAO.select(id));
			resultList.put("bucketList", bucketDAO.select(id));
		}
		return resultList;
	}

}
