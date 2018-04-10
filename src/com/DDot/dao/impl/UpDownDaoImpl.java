package com.DDot.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.UpDownDao;
import com.DDot.model.UpDownDto;

@Repository
public class UpDownDaoImpl implements UpDownDao {
	
	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotUpDown.";

	@Override
	public boolean writeUpDownBbsGood(UpDownDto updown) throws Exception {
		int count = sqlSession.insert(namespace+"writeUpDownBbsGood", updown);
		return count>0?true:false;
	}

	@Override
	public boolean writeUpDownCommGood(UpDownDto updown) throws Exception {
		int count = sqlSession.insert(namespace+"writeUpDownCommGood", updown);
		return count>0?true:false;
	}

	@Override
	public boolean writeUpDownBbsBad(UpDownDto updown) throws Exception {
		int count = sqlSession.insert(namespace+"writeUpDownBbsBad", updown);
		return count>0?true:false;
	}

	@Override
	public boolean writeUpDownCommBad(UpDownDto updown) throws Exception {
		int count = sqlSession.insert(namespace+"writeUpDownCommBad", updown);
		return count>0?true:false;
	}

	@Override
	public int getUpDownBbsGood(UpDownDto updown) throws Exception {
		return sqlSession.selectOne(namespace+"getUpDownBbsGood", updown);
	}

	@Override
	public int getUpDownCommGood(UpDownDto updown) throws Exception {
		return sqlSession.selectOne(namespace+"getUpDownCommGood", updown);
	}

	@Override
	public int getUpDownBbsBad(UpDownDto updown) throws Exception {
		return sqlSession.selectOne(namespace+"getUpDownBbsBad", updown);
	}

	@Override
	public int getUpDownCommBad(UpDownDto updown) throws Exception {
		return sqlSession.selectOne(namespace+"getUpDownCommBad", updown);
	}

	@Override
	public boolean deleteUpDownBbsGood(UpDownDto updown) throws Exception {
		int count = sqlSession.delete(namespace+"deleteUpDownBbsGood", updown);
		return count>0?true:false;
	}

	@Override
	public boolean deleteUpDownCommGood(UpDownDto updown) throws Exception {
		int count = sqlSession.delete(namespace+"deleteUpDownCommGood", updown);
		return count>0?true:false;
	}

	@Override
	public boolean deleteUpDownBbsBad(UpDownDto updown) throws Exception {
		int count = sqlSession.delete(namespace+"deleteUpDownBbsBad", updown);
		return count>0?true:false;
	}

	@Override
	public boolean deleteUpDownCommBad(UpDownDto updown) throws Exception {
		int count = sqlSession.delete(namespace+"deleteUpDownCommBad", updown);
		return count>0?true:false;
	}

	@Override
	public boolean countBbsPlusGood(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countBbsPlusGood", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countCommPlusGood(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countCommPlusGood", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countBbsMinusGood(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countBbsMinusGood", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countCommMinusGood(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countCommMinusGood", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countBbsPlusBad(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countBbsPlusBad", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countCommPlusBad(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countCommPlusBad", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countBbsMinusBad(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countBbsMinusBad", seq);
		return count>0?true:false;
	}

	@Override
	public boolean countCommMinusBad(int seq) throws Exception {
		int count = sqlSession.delete(namespace+"countCommMinusBad", seq);
		return count>0?true:false;
	}



}
