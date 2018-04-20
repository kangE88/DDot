package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.ReplyDao;
import com.DDot.model.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace = "DDotReply.";
	

	@Override
	public boolean writeReplyBbs(ReplyDto reply) throws Exception {
		sqlSession.update(namespace+"writeReplyBbsPoint", reply);
		int count = sqlSession.insert(namespace+"writeReplyBbs", reply);
		return count>0?true:false;
	}

	@Override
	public boolean writeReplyComm(ReplyDto reply) throws Exception {
		sqlSession.update(namespace+"writeReplyCommPoint", reply);
		int count = sqlSession.insert(namespace+"writeReplyComm", reply);
		return count>0?true:false;
	}

	@Override
	public List<ReplyDto> getReplyBbsList(int seq) throws Exception {
		List<ReplyDto> list = new ArrayList<ReplyDto>();		
		list = sqlSession.selectList(namespace + "getReplyBbsList", seq);
		return list;
	}

	@Override
	public List<ReplyDto> getReplyCommList(int seq) throws Exception {
		List<ReplyDto> list = new ArrayList<ReplyDto>();		
		list = sqlSession.selectList(namespace + "getReplyCommList", seq);
		return list;
	}

	@Override
	public boolean updateReply(ReplyDto reply) throws Exception {
		int count = sqlSession.update(namespace+"updateReply", reply);
		return count>0?true:false;
	}

	@Override
	public boolean deleteReply(int seq) {
		int count = sqlSession.delete(namespace+"deleteReply", seq);
		return count>0?true:false;
	}

	@Override
	public int getReplyBbsCount(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getReplyBbsCount", seq);
	}

	@Override
	public int getReplyCommCount(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getReplyCommCount", seq);
	}

}
