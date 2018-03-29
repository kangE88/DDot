package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.DDot.service.BbsService;

@Controller
public class BbsController {

	@Autowired
	BbsService bbsService;
}
