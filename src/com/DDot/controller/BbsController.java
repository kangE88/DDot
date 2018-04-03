package com.DDot.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DDot.model.BbsDto;
import com.DDot.service.BbsService;

@Controller
public class BbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Autowired
	BbsService bbsService;
	
	
	// category & subcategory 선택에 따른 게시글 목록
	@RequestMapping(value="bbslist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbslist(Model model, BbsDto bbs, String category, String subcategory) throws Exception{
		logger.info("DDotBbsController bbslist"+ new Date());		
		
		// subcategory 0~3 이 아닌 다른 숫자  top.jsp 에서 "9" 값으로 설정 하여 subcategory 전체 게시글 목록 표현
		if(subcategory.equals("9") ) {
			bbs.setCategory(category);
			List<BbsDto> list = bbsService.getBbsList(bbs);
			model.addAttribute("bbslist", list);
			model.addAttribute("category", category);
		}else { // subcategory 선택에 따른 게시글 목록 표현
			bbs.setCategory(category);
			bbs.setSubcategory(subcategory);
			List<BbsDto> list = bbsService.getBbsList_Subcategory(bbs);
			model.addAttribute("bbslist", list);
			model.addAttribute("category", category);
		}
		return "bbslist.tiles";
	}
	
	@RequestMapping(value = "bbswrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String bbswrite(Model model) {
		logger.info(" DDotBbsController bbswrite! "+ new Date());
		return "bbswrite.tiles";
	}
	
	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
	public String bbswriteAf(BbsDto bbs, Model model) throws Exception {
		if(bbs.getContent().equals("") || bbs.getTitle().equals("") || bbs.getNickname().equals("")){
			return "bbswrite";
		}
		logger.info("DDotBbsController bbswriteAf! "+ new Date());
		bbsService.writeBbs(bbs);
		model.addAttribute("category", bbs.getCategory());
		model.addAttribute("subcategory", bbs.getSubcategory());
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbsdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbsdetail(int seq, Model model) throws Exception {
		logger.info("DDotBbsController bbsdetail! "+ new Date());
		BbsDto bbs=null;
		bbsService.readCount(seq);
		bbs=bbsService.getBbs(seq);
		model.addAttribute("bbs", bbs);
		return "bbsdetail.tiles";
	}
	
	@RequestMapping(value = "bbsupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbsupdate(int seq, Model model) throws Exception{
		logger.info("DDotBbsController bbsupdate! "+ new Date());
		
		BbsDto bbs=bbsService.getBbs(seq);		
		model.addAttribute("bbs", bbs);		
		return "bbsupdate.tiles";
	}
	
	@RequestMapping(value="bbsupdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbsupdateAf(Model model, BbsDto bbs) throws Exception{
		logger.info("DDotBbsController bbsupdateAf"+ new Date());		
		
		bbsService.updateBbs(bbs);
		return "redirect:/bbslist.do"; 
	}
	
	
	 
	
}
