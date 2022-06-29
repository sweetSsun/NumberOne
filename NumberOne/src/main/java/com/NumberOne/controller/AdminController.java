package com.NumberOne.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dto.MemberDto;
import com.NumberOne.service.AdminService;

@Controller
public class AdminController {
	
	private ModelAndView mav;
	
	@Autowired
	private AdminService asvc;
	
	@RequestMapping (value="/loadToAdminMainPage")
	public String loadToAdminMainPage() {
		System.out.println("관리자 메인페이지 이동 요청");
		return "admin/Admin_Main";
	}
	
	@RequestMapping (value="/selectMemberList")
	public ModelAndView selectMemberList() {
		System.out.println("회원 관리페이지 이동 요청");
		mav = asvc.selectMemberList();
		return mav;
	}
	
	@RequestMapping (value="/selectMemberList_ajax")
	public @ResponseBody String selectMemberList(String searchVal) {
		System.out.println("회원 관리페이지 이동 요청");
		String memberList = asvc.selectMemberList_ajax(searchVal);
		return memberList;
	}
}
