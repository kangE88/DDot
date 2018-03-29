package com.DDot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.DDot.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
}
