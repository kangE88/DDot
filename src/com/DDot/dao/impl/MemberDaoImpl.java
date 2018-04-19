package com.DDot.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.MemberDao;
import com.DDot.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired		// 자동생성  == DI(Dependency Injection)
	SqlSession sqlSession;	// IOC(Inversion of Control)
	
	private String namespace = "DDotMember."; 
	
	@Override
	public boolean addmember(MemberDto mem) throws Exception {		
		int n = sqlSession.insert(namespace + "addmember", mem);		
		return n>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto mem) throws Exception {
		return sqlSession.selectOne(namespace + "login", mem);
	}

	@Override
	public int getID(MemberDto mem) {
		return sqlSession.selectOne(namespace + "getID", mem);
	}

	@Override
	public int getNickname(MemberDto mem) throws Exception {
		return sqlSession.selectOne(namespace + "getNickname", mem);
	}

	@Override
	public String findID(String email) throws Exception {
		return sqlSession.selectOne(namespace + "findID", email);
	}
	

	@Override
	public String findPWD(MemberDto mem) throws Exception {
		return sqlSession.selectOne(namespace + "findPWD", mem);
	}

	@Override
	public boolean userInfoModify(MemberDto mem) throws Exception {
		int n = sqlSession.update(namespace + "userInfoModify", mem);		
		return n>0?true:false;
	}

	@Override
	public boolean userInfoModifyNoImage(MemberDto mem) {
		int n = sqlSession.update(namespace + "userInfoModifyNoImage", mem);		
		return n>0?true:false;
	}

	@Override
	public MemberDto getMember(String nickname) throws Exception {
		return sqlSession.selectOne(namespace + "getMember", nickname);
	}

	@Override
	public int getMemberPoint(String nickname) throws Exception {
		return sqlSession.selectOne(namespace+"getMemberPoint", nickname);
	}	
	
	@Override
	public boolean addAttend(String nickname) throws Exception {
		int n = sqlSession.update(namespace + "addAttend", nickname);
		return n>0?true:false;
	}

	
}




