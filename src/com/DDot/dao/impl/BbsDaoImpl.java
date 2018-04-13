package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.BbsDao;
import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired
		SqlSession sqlSession;
	
	private String namespace = "DDotBbs.";
	
	@Override
	public List<BbsDto> getBbsList(BbsDto bbs) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();		
		list = sqlSession.selectList(namespace + "getBbsList", bbs);
		return list;
	}

	@Override
	public boolean writeBbs(BbsDto bbs) throws Exception {
		int count = sqlSession.insert(namespace+"writeBbs", bbs);
		return count>0?true:false;
	}

	@Override
	public BbsDto getBbs(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getBbs", seq);
	}

	@Override
	public boolean updateBbs(BbsDto bbs) throws Exception {
		sqlSession.update(namespace+"updateBbs", bbs);
		return true;
	}

	@Override
	public List<BbsDto> getBbsList_Subcategory(BbsDto bbs) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();		
		list = sqlSession.selectList(namespace + "getBbsList_Subcategory", bbs);
		return list;
	}

	@Override
	public boolean readCount(int seq) throws Exception {
		int count = sqlSession.update(namespace + "readCount", seq);
		return count>0?true:false;
	}

	@Override
	public List<BbsDto> getBbsPagingList(BbsParam param) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();
		list = sqlSession.selectList(namespace+"getBbsPagingList", param);
		return list;
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getBbsCount", param);
		return num;
	}

	@Override
	public List<BbsDto> getBbsPagingList_Subcategory(BbsParam param) throws Exception {
		List<BbsDto> list = new ArrayList<BbsDto>();
		list = sqlSession.selectList(namespace+"getBbsPagingList_Subcategory", param);
		return list;
	}
	

	@Override
	public int getBbsCount_Subcategory(BbsParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getBbsCount_Subcategory", param);
		return num;
	}

	@Override
	public boolean deleteBbs(int seq) {
		int count = sqlSession.update(namespace+"deleteBbs", seq);
		return count>0?true:false;
	}

	@Override
	public int getusericon(int seq) {
		
		return sqlSession.selectOne(namespace+"getusericon", seq);
	}

	@Override
	public int boardsearchcount(AttendDto adto) {
		String category = adto.getTable();
		int count = 0;
		switch (category) {
		case "all":
			count = sqlSession.selectOne(namespace+"boardsearchallcount", adto);
		break;
		case "title":
			count = sqlSession.selectOne(namespace+"boardsearchtitlecount", adto);	
		break;
		case "content":			
			count = sqlSession.selectOne(namespace+"boardsearchcontentcount", adto);
		break;
		}
		return count;
	}

	@Override
	public List<BbsDto> boardlist(AttendDto adto) {
		String category = adto.getTable();
		List<BbsDto> boardlist = null;		
		switch (category) {
		case "all":
			boardlist = sqlSession.selectList(namespace+"boardsearchall", adto);
		break;
		case "title":
			boardlist = sqlSession.selectList(namespace+"boardsearchtitle", adto);	
		break;
		case "content":			
			boardlist = sqlSession.selectList(namespace+"boardsearchcontent", adto);
		break;
		}		
		return boardlist;
	}

	@Override
	public int commsearchcount(AttendDto adto) {
		String category = adto.getTable();
		int count = 0;
		switch (category) {
		case "all":
			count = sqlSession.selectOne(namespace+"commsearchallcount", adto);
		break;
		case "title":
			count = sqlSession.selectOne(namespace+"commsearchtitlecount", adto);	
		break;
		case "content":			
			count = sqlSession.selectOne(namespace+"commsearchcontentcount", adto);
		break;
		}
		return count;
	}

	@Override
	public List<CommDto> commlist(AttendDto adto) {
		String category = adto.getTable();
		List<CommDto> commlist = null;		
		switch (category) {
		case "all":
			commlist = sqlSession.selectList(namespace+"commsearchall", adto);
		break;
		case "title":
			commlist = sqlSession.selectList(namespace+"commsearchtitle", adto);	
		break;
		case "content":			
			commlist = sqlSession.selectList(namespace+"commsearchcontent", adto);
		break;
		}		
		return commlist;
	}

}
