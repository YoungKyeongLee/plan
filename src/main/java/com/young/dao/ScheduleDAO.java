package com.young.dao;

import java.util.List;

import com.young.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> select(String id);

}
