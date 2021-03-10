package com.young.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.young.dao.BucketDAO;
import com.young.dao.BunchDAO;
import com.young.dao.GoalDAO;
import com.young.dao.MembershipDAO;
import com.young.dao.ScheduleDAO;
import com.young.others.Encrypt;
import com.young.others.Login;
import com.young.vo.BucketVO;
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

	public void logout(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		Session.removeAttribute("user");
		Session.removeAttribute("resultList");
	}
	public String addSchedule(HttpServletRequest req, ScheduleVO vo) {
		int result = scheduleDAO.insert(vo);
		return result == 1 ? Login.getList(req, getUser(req)) : "false";
	}

	public String addGoal(HttpServletRequest req, GoalVO vo) {
		int result = goalDAO.insert(vo);
		return result == 1 ? Login.getList(req, getUser(req)) : "false";
	}

	public String addBunch(HttpServletRequest req, BunchVO vo) {
		if(bunchDAO.checkEquals(vo) == 1) return "conflict";
		int result = bunchDAO.insert(vo);
		return result == 1 ? Login.getList(req, getUser(req)) : "false";
	}
	
	public String addBucket(HttpServletRequest req, BucketVO vo) {
		if(bucketDAO.checkEquals(vo) == 1) return "conflict";
		int result = bucketDAO.insert(vo);
		return result == 1 ? Login.getList(req, getUser(req)) : "false";
	}
	
	public String updateBucket(HttpServletRequest req, BucketVO vo) {
		int result = bucketDAO.update(vo);
		return result == 1 ? Login.getList(req, getUser(req)) : "false";
	}
	
	private MembershipVO getUser(HttpServletRequest req) {
		return (MembershipVO)req.getSession().getAttribute("user");
	}

}
