package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.CommDao;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;

@Repository
public class CommDaoImpl implements CommDao {
	
	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotComm.";

	@Override
	public List<CommDto> getCommList(CommDto comm) throws Exception {
		List<CommDto> list = new ArrayList<CommDto>();		
		list = sqlSession.selectList(namespace + "getCommList", comm);
		return list;
	}

	@Override
	public boolean writeComm(CommDto comm) throws Exception {
		sqlSession.update(namespace+"writeCommPoint", comm);
		int count = sqlSession.insert(namespace+"writeComm", comm);
		return count>0?true:false;
	}

	@Override
	public CommDto getComm(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getComm", seq);
	}

	@Override
	public boolean readCount(int seq) throws Exception {
		int count = sqlSession.update(namespace + "readCount", seq);
		return count>0?true:false;
	}

	@Override
	public List<CommDto> getCommPagingList(BbsParam param) throws Exception {
		List<CommDto> list = new ArrayList<CommDto>();
		list = sqlSession.selectList(namespace+"getCommPagingList", param);
		return list;
	}

	@Override
	public int getCommCount(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getCommCount", param);
		return num;
	}

	@Override
	public boolean updateComm(CommDto comm) throws Exception {
		int count = sqlSession.update(namespace+"updateComm", comm);
		return count>0?true:false;
	}

	@Override
	public boolean deleteComm(int seq) {
		int count = sqlSession.update(namespace+"deleteComm", seq);
		return count>0?true:false;
		
	}

}
