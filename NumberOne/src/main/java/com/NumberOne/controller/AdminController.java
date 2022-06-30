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
	
	@RequestMapping (value= "/updateMstate_ajax")
	public @ResponseBody String updateMstate_ajax(String mid, String mstate) {
		System.out.println("회원상태 변경 요청");
		String memberInfo_json = asvc.updateMstate_ajax(mid, mstate);
		return memberInfo_json;
	}
	
	@RequestMapping (value="/selectMemberInfo_ajax")
	public @ResponseBody String selectMemberInfo_ajax(String mid) {
		System.out.println("회원 상세정보 조회 요청");
		String memberInfo_json = asvc.selectMemberInfo_ajax(mid);
		return memberInfo_json;
	}
		
}
