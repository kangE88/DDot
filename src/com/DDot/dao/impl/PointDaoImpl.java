package com.DDot.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.PointDao;
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
	public void attendpointup(PointDto pdto) {
		sqlSession.update(namespace+"atteendpointup", pdto);		
	}

}
