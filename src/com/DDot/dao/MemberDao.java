package com.DDot.dao;

import com.DDot.model.MemberDto;



public interface MemberDao {

	boolean addmember(MemberDto mem)throws Exception;
	
	MemberDto login(MemberDto mem) throws Exception;
	
	int getID(MemberDto mem) throws Exception;

	int getNickname(MemberDto mem) throws Exception;
	
	String findID(String email) throws Exception;
	
	String findPWD(MemberDto mem) throws Exception;

	boolean userInfoModify(MemberDto mem) throws Exception;

	boolean userInfoModifyNoImage(MemberDto mem) throws Exception;

	boolean addAttend(String nickname) throws Exception;
	
	MemberDto getMember(String nickname) throws Exception;
	
	int getMemberPoint(String nickname) throws Exception;

	int getEmail(MemberDto mem) throws Exception;
	
}
