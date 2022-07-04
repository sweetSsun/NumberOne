package com.NumberOne.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
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
	
	@RequestMapping (value="/admin_loadToAdminMainPage")
	public String admin_loadToAdminMainPage() {
		System.out.println("관리자 메인페이지 이동 요청");
		return "admin/Admin_Main";
	}
	
	/* 회원 관리 */
	@RequestMapping (value="/admin_selectMemberList")
	public ModelAndView admin_selectMemberList(int page) {
		System.out.println("회원 관리페이지 이동 요청");
		mav = asvc.admin_selectMemberList(page);
		return mav;
	}
	
	@RequestMapping (value="/admin_selectMemberList_ajax")
	public @ResponseBody String admin_selectMemberList_ajax(String searchVal, int page) {
		System.out.println("회원 관리페이지 정렬 요청");
		String memberList_json = asvc.admin_selectMemberList_ajax(searchVal, page);
		return memberList_json;
	}
	
	@RequestMapping (value="/admin_selectMemberPagingNumber_ajax")
	public @ResponseBody String admin_selectMemberPagingNumber_ajax(String searchVal, int page) {
		System.out.println("회원 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectMemberPagingNumber_ajax(searchVal, page);
		return paging_json;
	}
	
	@RequestMapping (value= "/admin_updateMstate_ajax")
	public @ResponseBody String admin_updateMstate_ajax(String mid, String mstate) {
		System.out.println("회원상태 변경 요청");
		String memberInfo_json = asvc.admin_updateMstate_ajax(mid, mstate);
		return memberInfo_json;
	}
	
	@RequestMapping (value="/admin_selectMemberInfo_ajax")
	public @ResponseBody String admin_selectMemberInfo_ajax(String mid) {
		System.out.println("회원 상세정보 조회 요청");
		String memberInfo_json = asvc.admin_selectMemberInfo_ajax(mid);
		return memberInfo_json;
	}
	
	/* 공지 관리 */
	@RequestMapping (value="admin_selectNoticeList")
	public ModelAndView admin_selectNoticeList(String searchVal, String searchType, String keyword, int page) {
		System.out.println("공지 관리페이지 이동 요청");
		mav = asvc.admin_selectNoticeList(searchVal, searchType, keyword, page);
		return mav;
	}
	
	@RequestMapping (value="admin_selectNoticeList_ajax")
	public @ResponseBody String admin_selectNoticeList_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("공지 관리페이지 정렬 요청");
		String noticeList_json = asvc.admin_selectNoticeList_ajax(searchVal, searchType, keyword, page);
		return noticeList_json;
	}	
	
	@RequestMapping (value="/admin_selectNoticePagingNumber_ajax")
	public @ResponseBody String admin_selectNoticePagingNumber_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("회원 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectNoticePagingNumber_ajax(searchVal, searchType, keyword, page);
		return paging_json;
	}
	
	@RequestMapping (value="admin_updateNbstate_ajax")
	public @ResponseBody int admin_updateNbstate_ajax(String nbcode, String nbstate) {
		System.out.println("공지상태 변경 요청");
		int updateResult = asvc.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}
	
	
		
}
