package com.NumberOne.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.MemberDao;

@Service
public class MemberService {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberDao mdao;

	public String test1() {
		String Test1 = mdao.test1();
		System.out.println("Test1 : " + Test1);
		return Test1;
	}

	
}
