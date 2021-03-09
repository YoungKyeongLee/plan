package com.young.dao;

import java.util.List;

import com.young.vo.BunchVO;

public interface BunchDAO {

	List<String> select(String id);

	int insertDefaultList(String id);

	int insert(BunchVO vo);

	int checkEquals(BunchVO vo);

}
