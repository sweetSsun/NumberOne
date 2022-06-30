package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.NumberOne.service.MemberService;

@Controller
public class ResellController {

	@Autowired
	private MemberService mscv;
	
	
	@RequestMapping (value="/loadToResellMainPage")
	public String loadToResellMainPage() {
		return "resell/Resell_Main";
	}
	
	@RequestMapping (value="/selectResellView")
	public String selectResellView() {
		return "resell/Resell_View";
	}
	
}
