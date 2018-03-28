package com.DDot.dao;

import com.DDot.model.MemberDto;

public interface MemberDao {

	boolean addmember(MemberDto mem)throws Exception;
	
	MemberDto login(MemberDto mem)throws Exception;
	
	int getID(MemberDto mem);
}
