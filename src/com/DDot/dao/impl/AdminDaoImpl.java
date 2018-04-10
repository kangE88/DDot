package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.AdminDao;
import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotAdmin.";
	
	@Override
	public List<MemberDto> userlist() {
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		list = sqlSession.selectList(namespace+"userlist");
		
		return list;
	}

	@Override
	public int userwritecount(String nickname) {
		
		int count = sqlSession.selectOne(namespace+"userwritecount", nickname);
		return count;
	}

	@Override
	public List<BbsDto> userbbslist(String nickname) {
		
		List<BbsDto> userbbslist = sqlSession.selectList(namespace+"userbbslist", nickname);
		return userbbslist;
	}

	@Override
	public void modifypoint(AttendDto adto) {
		sqlSession.update(namespace+"modifypoint", adto);
	}

	@Override
	public void deleteuserbbs(int seq) {
		sqlSession.update(namespace+"deleteuserbbs", seq);
	}

}
