package com.DDot.service;

import com.DDot.model.MemberDto;

public interface MemberService {
	public boolean addmember(MemberDto mem) throws Exception;
	public MemberDto login(MemberDto mem) throws Exception;
	public int getID(MemberDto mem) throws Exception;
	public int getNickname(MemberDto mem) throws Exception;
	public String findID(String email) throws Exception;
	public boolean userInfoModify(MemberDto mem) throws Exception;
	public boolean userInfoModifyNoImage(MemberDto mem) throws Exception;
	public boolean addAttend(String nickname) throws Exception;
	public MemberDto getMember(String nickname) throws Exception;
	int getMemberPoint(String nickname) throws Exception;
	public String findPWD(MemberDto mem) throws Exception;
}
