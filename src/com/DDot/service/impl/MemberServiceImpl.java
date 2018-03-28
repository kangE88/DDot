package com.DDot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.MemberDao;
import com.DDot.model.MemberDto;
import com.DDot.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao khMemberDao;

	@Override
	public boolean addmember(MemberDto mem) throws Exception {		
		return khMemberDao.addmember(mem);		
	}

	@Override
	public MemberDto login(MemberDto mem) throws Exception {		
		return khMemberDao.login(mem);		
	}

	@Override
	public int getID(MemberDto mem) throws Exception {
		return  khMemberDao.getID(mem);		
	}
	
	
}







