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
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.service.BbsService;



@Controller
public class BbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Autowired
	BbsService bbsService;
	
	
	// category & subcategory �꽑�깮�뿉 �뵲瑜� 寃뚯떆湲� 紐⑸줉
	@RequestMapping(value="bbslist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbslist(Model model, String category, String subcategory, BbsParam param) throws Exception{
		logger.info("DDotBbsController bbslist"+ new Date());		
		
		// �럹�씠吏� 泥섎━
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
				
		// subcategory 0~3 �씠 �븘�땶 �떎瑜� �닽�옄  top.jsp �뿉�꽌 "9" 媛믪쑝濡� �꽕�젙 �븯�뿬 subcategory �쟾泥� 寃뚯떆湲� 紐⑸줉 �몴�쁽
		if(subcategory.equals("9") ) {
			int totalRecordCount = bbsService.getBbsCount(param);
			List<BbsDto> list = bbsService.getBbsPagingList(param);
			model.addAttribute("bbslist", list);
			model.addAttribute("category", category);			
			model.addAttribute("subcategory", subcategory);
			model.addAttribute("totalRecordCount", totalRecordCount);
		// subcategory �꽑�깮�뿉 �뵲瑜� 寃뚯떆湲� 紐⑸줉 �몴�쁽
		}else {
			int totalRecordCount = bbsService.getBbsCount_Subcategory(param);
			List<BbsDto> list = bbsService.getBbsPagingList_Subcategory(param);
			model.addAttribute("bbslist", list);
			model.addAttribute("category", category);			
			model.addAttribute("subcategory", subcategory);
			model.addAttribute("totalRecordCount", totalRecordCount);
		}

			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("s_category", param.getS_category());
			System.out.println("s_category: " + param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
		
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
		model.addAttribute("category", bbs.getCategory());
		model.addAttribute("subcategory", bbs.getSubcategory());
		return "redirect:/bbslist.do"; 
	}
	
	@RequestMapping(value="bbsdelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbsdelete(Model model, String category, String subcategory, int seq) throws Exception{
		logger.info("DDotBbsController bbsdelete"+ new Date());		
		
		BbsDto bbs=bbsService.getBbs(seq);
		bbsService.deleteBbs(seq);
		
		model.addAttribute("category", bbs.getCategory());
		model.addAttribute("subcategory", bbs.getSubcategory());
		return "redirect:/bbslist.do";
	}
	
	@ResponseBody
	@RequestMapping(value="getusericon.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int getusericon(String sseq) {
		
		int seq = Integer.parseInt(sseq);
		int point = bbsService.getusericon(seq);		
		
		return point;
	}	
	
	@RequestMapping(value="boardsearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String boardsearch(String category, String text, Model model) throws Exception {
		
		List<BbsDto> boardlist = null;
		List<CommDto> commlist = null;
		int boardcount = 0;
		int commcount = 0;
		
		AttendDto adto = new AttendDto();
		
		adto.setTable(category);
		adto.setNickname(text);
		
		if(category.equals("all")) {
			category = null;
		}
		model.addAttribute("s_category", category);
		model.addAttribute("s_keyword", text);
		
		boardcount = bbsService.boardsearchcount(adto);
		model.addAttribute("boardcount", boardcount);
		boardlist = bbsService.boardlist(adto);
		model.addAttribute("boardlist", boardlist);
		commcount = bbsService.commsearchcount(adto);
		model.addAttribute("commcount", commcount);
		commlist = bbsService.commlist(adto);
		model.addAttribute("commlist", commlist);
		
		
		System.out.println("category: " + category);
		
		System.out.println("text: " + text);
		
		return "boardsearch.tiles";
	}

}
