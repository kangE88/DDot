package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.DDot.service.CommService;

@Controller
public class CommController {

	@Autowired
	CommService commService;
}
