package com.young.dao;

import java.util.List;

import com.young.vo.GoalVO;

public interface GoalDAO {

	List<GoalVO> select(String id);

}
