package com.DDot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.MemberDao;
import com.DDot.model.MemberDto;
import com.DDot.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao MemberDao;

	@Override
	public boolean addmember(MemberDto mem) throws Exception {		
		return MemberDao.addmember(mem);		
	}

	@Override
	public MemberDto login(MemberDto mem) throws Exception {		
		return MemberDao.login(mem);		
	}

	@Override
	public int getID(MemberDto mem) throws Exception {
		return  MemberDao.getID(mem);		
	}

	@Override
	public int getNickname(MemberDto mem) throws Exception {
		return  MemberDao.getNickname(mem);		
	}

	@Override
	public boolean userInfoModify(MemberDto mem) throws Exception {
		return MemberDao.userInfoModify(mem);	
	}

	@Override
	public boolean userInfoModifyNoImage(MemberDto mem) {
		return MemberDao.userInfoModifyNoImage(mem);
	}

	@Override
	public MemberDto getMember(String nickname) throws Exception {
		return MemberDao.getMember(nickname);
	}
	
	
	
}







