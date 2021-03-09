package com.young.dao;

import java.util.List;

import com.young.vo.BucketVO;

public interface BucketDAO {

	List<BucketVO> select(String id);

	int insert(BucketVO vo);

	int checkEquals(BucketVO vo);

	int update(BucketVO vo);

}
