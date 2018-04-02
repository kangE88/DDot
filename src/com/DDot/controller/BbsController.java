package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DDot.service.BbsService;

@Controller
public class BbsController {

	@Autowired
	BbsService bbsService;
	
	@RequestMapping(value="bbslist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String bbslist(Model model,int category) {
		model.addAttribute("category", category);
		return "bbslist.tiles";
	}
}
