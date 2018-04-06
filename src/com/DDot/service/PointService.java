package com.DDot.service;

import com.DDot.model.PointDto;

public interface PointService {
	
	public PointDto attendpoint(String nickname);
	public void attendpointup(String a);
}
