package com.DDot.dao;

import com.DDot.model.UpDownDto;

public interface UpDownDao {

	public boolean writeUpDownBbsGood(UpDownDto updown) throws Exception;
	public boolean writeUpDownCommGood(UpDownDto updown) throws Exception;
	public boolean writeUpDownBbsBad(UpDownDto updown) throws Exception;
	public boolean writeUpDownCommBad(UpDownDto updown) throws Exception;
	
	public int getUpDownBbsGood(UpDownDto updown) throws Exception;
	public int getUpDownCommGood(UpDownDto updown) throws Exception;
	public int getUpDownBbsBad(UpDownDto updown) throws Exception;
	public int getUpDownCommBad(UpDownDto updown) throws Exception;
	
	public boolean deleteUpDownBbsGood(UpDownDto updown) throws Exception;
	public boolean deleteUpDownCommGood(UpDownDto updown) throws Exception;
	public boolean deleteUpDownBbsBad(UpDownDto updown) throws Exception;
	public boolean deleteUpDownCommBad(UpDownDto updown) throws Exception;
	
	public boolean countBbsPlusGood(int seq) throws Exception;
	public boolean countCommPlusGood(int seq) throws Exception;
	public boolean countBbsMinusGood(int seq) throws Exception;
	public boolean countCommMinusGood(int seq) throws Exception;
	public boolean countBbsPlusBad(int seq) throws Exception;
	public boolean countCommPlusBad(int seq) throws Exception;
	public boolean countBbsMinusBad(int seq) throws Exception;
	public boolean countCommMinusBad(int seq) throws Exception;
	
}
