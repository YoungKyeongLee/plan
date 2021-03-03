package com.young.dao;

import com.young.vo.MembershipVO;

public interface MembershipDAO {

	int idCheck(String userid);

	int insert(MembershipVO vo);

}
