package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.DDot.service.UpDownService;

@Controller
public class UpDownController {

	@Autowired
	UpDownService upDownService;
}
