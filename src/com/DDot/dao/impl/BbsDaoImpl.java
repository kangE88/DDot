package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.BbsDao;
import com.DDot.model.BbsDto;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired
		SqlSession sqlSession;
	
	private String namespace = "DDotBbs.";
	
	@Override
	public List<BbsDto> getBbsList(BbsDto bbs) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();		
		list = sqlSession.selectList(namespace + "getBbsList", bbs);
		return list;
	}

	@Override
	public boolean writeBbs(BbsDto bbs) throws Exception {
		sqlSession.insert(namespace+"writeBbs", bbs);
		return true;
	}

	@Override
	public BbsDto getBbs(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getBbs", seq);
	}

	@Override
	public boolean updateBbs(BbsDto bbs) throws Exception {
		sqlSession.update(namespace+"updateBbs", bbs);
		return true;
	}

	@Override
	public List<BbsDto> getBbsList_Subcategory(BbsDto bbs) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();		
		list = sqlSession.selectList(namespace + "getBbsList_Subcategory", bbs);
		return list;
	}

	@Override
	public boolean readCount(int seq) throws Exception {
		sqlSession.update(namespace + "readCount", seq);
		return true;
	}

}
