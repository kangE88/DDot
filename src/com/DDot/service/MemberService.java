package com.DDot.service;

import com.DDot.model.MemberDto;

public interface MemberService {
	public boolean addmember(MemberDto mem) throws Exception;
	public MemberDto login(MemberDto mem) throws Exception;
	public int getID(MemberDto mem) throws Exception;
	public int getNickname(MemberDto mem) throws Exception;
	public boolean userInfoModify(MemberDto mem) throws Exception;
	public boolean userInfoModifyNoImage(MemberDto mem);
}
