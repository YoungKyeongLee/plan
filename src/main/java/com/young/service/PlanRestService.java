package com.young.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.dao.BucketDAO;
import com.young.dao.BunchDAO;
import com.young.dao.GoalDAO;
import com.young.dao.MembershipDAO;
import com.young.dao.ScheduleDAO;
import com.young.others.Encrypt;
import com.young.others.Login;
import com.young.vo.BunchVO;
import com.young.vo.GoalVO;
import com.young.vo.MembershipVO;
import com.young.vo.ScheduleVO;

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
		if(result == 1)
			result = bunchDAO.insertDefaultList(vo.getId());
		return result == 3 ? "true" : "false";
	}

	public String signIn(HttpServletRequest req, MembershipVO vo) {
		vo.setPw(Encrypt.SecurePassword(vo.getId(), vo.getPw()));
		MembershipVO user = membershipDAO.select(vo);
		return Login.getList(req, user);
	}

	public String addSchedule(ScheduleVO vo) {
		int result = scheduleDAO.insert(vo);
		return result == 1 ? "true" : "false";
	}

	public String addGoal(GoalVO vo) {
		int result = goalDAO.insert(vo);
		return result == 1 ? "true" : "false";
	}

	public String addBunch(BunchVO vo) {
		int result = bunchDAO.insert(vo);
		return result == 1 ? "true" : "false";
	}

}
