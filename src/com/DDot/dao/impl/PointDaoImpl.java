package com.DDot.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.PointDao;
import com.DDot.model.AttendDto;
import com.DDot.model.PointDto;

@Repository
public class PointDaoImpl implements PointDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotPoint.";
	
	@Override
	public PointDto attendpoint(String nickname) {
		
		PointDto pdto = sqlSession.selectOne(namespace+"attend", nickname);
		return pdto;
	}

	@Override
	public void attendpointup(AttendDto adto) {
		sqlSession.update(namespace+"atteendpointup", adto);		
	}

	@Override
	public void abcup(String nickname) {
		sqlSession.update(namespace+"abcup", nickname);
	}

	@Override
	public void abcdown(String nickname) {
		sqlSession.update(namespace+"abcdown", nickname);		
	}

	@Override
	public void updownup(String nickname) {
		sqlSession.update(namespace+"updownup", nickname);
	}

	@Override
	public void updowndown(String nickname) {
		sqlSession.update(namespace+"updowndown", nickname);		
	}

	@Override
	public void attendpoints(String nickname) {
		sqlSession.update(namespace+"attendpoint", nickname);
		
	}

}
