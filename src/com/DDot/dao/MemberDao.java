package com.DDot.dao;

import com.DDot.model.MemberDto;



public interface MemberDao {

	boolean addmember(MemberDto mem)throws Exception;
	
	MemberDto login(MemberDto mem) throws Exception;
	
	int getID(MemberDto mem) throws Exception;

	int getNickname(MemberDto mem) throws Exception;

	boolean userInfoModify(MemberDto mem) throws Exception;

	boolean userInfoModifyNoImage(MemberDto mem);
	
	MemberDto getMember(String nickname) throws Exception;
	
}
