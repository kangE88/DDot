package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.BbsDao;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;

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
		int count = sqlSession.insert(namespace+"writeBbs", bbs);
		return count>0?true:false;
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
		int count = sqlSession.update(namespace + "readCount", seq);
		return count>0?true:false;
	}

	@Override
	public List<BbsDto> getBbsPagingList(BbsParam param) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();
		list = sqlSession.selectList(namespace+"getBbsPagingList", param);
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getBbsCount", param);
		return num;
	}

	@Override
	public List<BbsDto> getBbsPagingList_Subcategory(BbsParam param) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();
		list = sqlSession.selectList(namespace+"getBbsPagingList_Subcategory", param);
		return list;
	}
	

	@Override
	public int getBbsCount_Subcategory(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getBbsCount_Subcategory", param);
		return num;
	}

	@Override
	public boolean deleteBbs(int seq) {
		int count = sqlSession.update(namespace+"deleteBbs", seq);
		return count>0?true:false;
	}

}
