package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.service.MemberService;

@Controller
public class MemberController {
	private ModelAndView mav;
	
	@Autowired
	private MemberService mscv;
	
	@RequestMapping(value="/test")
	public ModelAndView test() {
		System.out.println("DB 연결 테스트");
		String test1 = mscv.test1();
		mav.addObject("test1", test1);
		mav.setViewName("DBtest");
		return mav;
	}

}
