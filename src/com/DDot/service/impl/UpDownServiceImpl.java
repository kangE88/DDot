package com.DDot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.UpDownDao;
import com.DDot.model.UpDownDto;
import com.DDot.service.UpDownService;

@Service
public class UpDownServiceImpl implements UpDownService {
	
	@Autowired
	UpDownDao updownDao;

	@Override
	public boolean writeUpDownBbsGood(UpDownDto updown) throws Exception {
		return updownDao.writeUpDownBbsGood(updown);
	}

	@Override
	public boolean writeUpDownCommGood(UpDownDto updown) throws Exception {
		return updownDao.writeUpDownCommGood(updown);
	}

	@Override
	public boolean writeUpDownBbsBad(UpDownDto updown) throws Exception {
		return updownDao.writeUpDownBbsBad(updown);
	}

	@Override
	public boolean writeUpDownCommBad(UpDownDto updown) throws Exception {
		return updownDao.writeUpDownCommBad(updown);
	}

	@Override
	public int getUpDownBbsGood(UpDownDto updown) throws Exception {
		return updownDao.getUpDownBbsGood(updown);
	}

	@Override
	public int getUpDownCommGood(UpDownDto updown) throws Exception {
		return updownDao.getUpDownCommGood(updown);
	}

	@Override
	public int getUpDownBbsBad(UpDownDto updown) throws Exception {
		return updownDao.getUpDownBbsBad(updown);
	}

	@Override
	public int getUpDownCommBad(UpDownDto updown) throws Exception {
		return updownDao.getUpDownCommBad(updown);
	}

	@Override
	public boolean deleteUpDownBbsGood(UpDownDto updown) throws Exception {
		return updownDao.deleteUpDownBbsGood(updown);
	}

	@Override
	public boolean deleteUpDownCommGood(UpDownDto updown) throws Exception {
		return updownDao.deleteUpDownCommGood(updown);
	}

	@Override
	public boolean deleteUpDownBbsBad(UpDownDto updown) throws Exception {
		return updownDao.deleteUpDownBbsBad(updown);
	}

	@Override
	public boolean deleteUpDownCommBad(UpDownDto updown) throws Exception {
		return updownDao.deleteUpDownCommBad(updown);
	}

	@Override
	public boolean countBbsPlusGood(int seq) throws Exception {
		return updownDao.countBbsPlusGood(seq);
	}

	@Override
	public boolean countCommPlusGood(int seq) throws Exception {
		return updownDao.countCommPlusGood(seq);
	}

	@Override
	public boolean countBbsMinusGood(int seq) throws Exception {
		return updownDao.countBbsMinusGood(seq);
	}

	@Override
	public boolean countCommMinusGood(int seq) throws Exception {
		return updownDao.countCommMinusGood(seq);
	}

	@Override
	public boolean countBbsPlusBad(int seq) throws Exception {
		return updownDao.countBbsPlusBad(seq);
	}

	@Override
	public boolean countCommPlusBad(int seq) throws Exception {
		return updownDao.countCommPlusBad(seq);
	}

	@Override
	public boolean countBbsMinusBad(int seq) throws Exception {
		return updownDao.countBbsMinusBad(seq);
	}

	@Override
	public boolean countCommMinusBad(int seq) throws Exception {
		return updownDao.countCommMinusBad(seq);
	}

	

}
