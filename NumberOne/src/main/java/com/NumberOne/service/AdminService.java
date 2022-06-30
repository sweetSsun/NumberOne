package com.NumberOne.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.AdminDao;
import com.NumberOne.dto.MemberDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	private ModelAndView mav;

	@Autowired
	private AdminDao adao;
	
	// 회원관리 페이지 이동 메소드
	public ModelAndView selectMemberList() {
		System.out.println("AdminService_selectMemberList() 호출");
		mav = new ModelAndView();
		String searchVal = "all";
		ArrayList<MemberDto> memberList = adao.selectmemberList(searchVal);
		System.out.println(memberList);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/Admin_Member");
		return mav;
	}
	
	// 선택한 상태값에 따른 회원목록 ajax
	public String selectMemberList_ajax(String searchVal) {
		System.out.println("AdminService_selectMemberList_ajax() 호출");
		mav = new ModelAndView();
		System.out.println("searchVal : " + searchVal);
		ArrayList<MemberDto> memberList = adao.selectmemberList(searchVal);
		System.out.println("memberList : " + memberList);
		Gson gson = new Gson();
		String memberList_ajax = gson.toJson(memberList);
		System.out.println("memberList_ajax : " + memberList_ajax);
		return memberList_ajax;
	}

}
