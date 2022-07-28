package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.service.AdminService;
import com.NumberOne.service.BoardService;
import com.NumberOne.service.GonguService;


@Controller
public class GonguController {
	
	private ModelAndView mav;
	
	@Autowired
	private AdminService asvc;
	@Autowired
	private BoardService bsvc;
	@Autowired
	private GonguService gsvc;
	

	

	
	
	 
	 
}
