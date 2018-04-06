package com.DDot.dao;

import com.DDot.model.AttendDto;
import com.DDot.model.PointDto;

public interface PointDao {

	public PointDto attendpoint(String nickname);
	
	public void attendpointup(AttendDto adto);
	
	public void abcup(String nickname);
	
	public void abcdown(String nickname);
	
	public void updownup(String nickname);
	
	public void updowndown(String nickname);
	
}
