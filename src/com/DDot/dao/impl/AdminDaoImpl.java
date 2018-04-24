package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.AdminDao;
import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotAdmin.";
	
	@Override
	public List<MemberDto> userlist(MemberParam param, String sort) {
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		switch(sort) {
		case "all":
			list = sqlSession.selectList(namespace+"userpaginglist", param);			
			break;			
		case "Good":
			list = sqlSession.selectList(namespace+"userpaginglist", param);
			break;			
		case "Bad":
			list = sqlSession.selectList(namespace+"userpaginglist", param);
			break;		
		}		
		return list;
	}

	@Override
	public int userwritecount(String nickname) {
		
		int count = sqlSession.selectOne(namespace+"userwritecount", nickname);
		return count;
	}

	@Override
	public List<BbsDto> userbbslist(BbsParam param,  String sort) {
		
		List<BbsDto> userbbslist = null;
		
		switch(sort) {
		case "all":
			userbbslist = sqlSession.selectList(namespace+"userbbslist", param);			
			break;			
		case "Good":
			userbbslist = sqlSession.selectList(namespace+"userbbsgoodlist", param);
			break;			
		case "Bad":
			userbbslist = sqlSession.selectList(namespace+"userbbsbadlist", param);
			break;		
		}			
		return userbbslist;
	}

	@Override
	public int userbbscount(String nickname) {
		int count = 0;
		count = sqlSession.selectOne(namespace+"userbbscount", nickname);
		return count;
	}

	@Override
	public void modifypoint(AttendDto adto) {
		sqlSession.update(namespace+"modifypoint", adto);
	}

	@Override
	public void deleteuserbbs(int seq) {
		sqlSession.update(namespace+"deleteuserbbs", seq);
	}

	@Override
	public int usercommcount(String nickname) {
		
		return sqlSession.selectOne(namespace+"usercommcount", nickname);
	}

	@Override
	public List<CommDto> usercommlist(BbsParam param, String sort) {
		
		List<CommDto> list = null;
		switch(sort) {
		case "all":
			list = sqlSession.selectList(namespace+"usercommlist", param);			
			break;			
		case "Good":
			list = sqlSession.selectList(namespace+"usercommgoodlist", param);
			break;			
		case "Bad":
			list = sqlSession.selectList(namespace+"usercommbadlist", param);
			break;		
		}			
		return list;
	}

	@Override
	public int getusercount(MemberParam param) {
		int count = 0;
		count = sqlSession.selectOne(namespace+"getusercount", param);
		return count;
	}

}
