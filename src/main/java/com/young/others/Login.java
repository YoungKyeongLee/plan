package com.young.others;

import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.young.dao.BucketDAO;
import com.young.dao.BunchDAO;
import com.young.dao.GoalDAO;
import com.young.dao.MembershipDAO;
import com.young.dao.ScheduleDAO;
import com.young.vo.MembershipVO;

@Component
public class Login {
	static MembershipDAO membershipDAO;
	static BunchDAO bunchDAO;
	static ScheduleDAO scheduleDAO;
	static GoalDAO goalDAO;
	static BucketDAO bucketDAO;
	static Gson gson;
	
	@Autowired MembershipDAO beanMembershipDAO;
	@Autowired BunchDAO beanBunchDAO;
	@Autowired ScheduleDAO beanScheduleDAO;
	@Autowired GoalDAO beanGoalDAO;
	@Autowired BucketDAO beanBucketDAO;
	
	@PostConstruct
	public void init() {
		membershipDAO = beanMembershipDAO;
		bunchDAO = beanBunchDAO;
		scheduleDAO = beanScheduleDAO;
		goalDAO = beanGoalDAO;
		bucketDAO = beanBucketDAO;
		gson = new Gson();
	}
	
	public static String getList(HttpServletRequest req, MembershipVO user) {
		HttpSession Session = req.getSession();
		boolean loginCheck = user != null;
		HashMap<String, Object> resultList = new HashMap<String, Object>();
		resultList.put("result", loginCheck);
		if(loginCheck) {
			String id = user.getId();
			// 관련된 리스트들 보내주어야 한다!
			resultList.put("id", id);
			resultList.put("name", user.getName());
			resultList.put("bunchList", bunchDAO.select(id));
			resultList.put("scheduleList", scheduleDAO.select(id));
			resultList.put("goalList", goalDAO.select(id));
			resultList.put("bucketList", bucketDAO.select(id));
			
			Session.setAttribute("user", user);
			Session.setAttribute("resultList", gson.toJson(resultList));
			Session.setMaxInactiveInterval(60 * 60 * 3);
		}
		return  gson.toJson(resultList);
	}
}
