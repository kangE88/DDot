package com.DDot.dao;

import com.DDot.model.PointDto;

public interface PointDao {

	public PointDto attendpoint(String nickname);
	
	public void attendpointup(PointDto pdto);
}
