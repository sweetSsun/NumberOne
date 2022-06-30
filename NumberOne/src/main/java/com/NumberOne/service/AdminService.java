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
	private Gson gson;

	@Autowired
	private AdminDao adao;
	
	// 회원관리 페이지 이동 메소드
	public ModelAndView selectMemberList() {
		System.out.println("AdminService_selectMemberList() 호출");
		mav = new ModelAndView();
		String searchVal = "all";
		ArrayList<MemberDto> memberList = adao.selectMemberList(searchVal);
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
		ArrayList<MemberDto> memberList = adao.selectMemberList(searchVal);
		System.out.println("memberList : " + memberList);
		gson = new Gson();
		String memberList_ajax = gson.toJson(memberList);
		System.out.println("memberList_ajax : " + memberList_ajax);
		return memberList_ajax;
	}

	// 회원상태 변경 ajax
	public String updateMstate_ajax(String mid, String mstate) {
		System.out.println("AdminService_updateMstate_ajax() 호출");
		System.out.println("상태변경할 mid : " + mid);
		System.out.println("상태변경할 mstate : " + mstate);
		int updateResult = adao.updateMstate_ajax(mid, mstate);
		String memberInfo_json = "";
		if(updateResult > 0) {
			// 버튼 css변경을 위해 회원상태 조회
			memberInfo_json = selectMemberInfo_ajax(mid);
		}
		return memberInfo_json;
	}
	
	// 회원 상세정보 조회 ajax
	public String selectMemberInfo_ajax(String mid) {
		System.out.println("selectMemberInfo_ajax() 호출");
		MemberDto memberInfo = adao.selectMemberInfo_ajax(mid);
		System.out.println(memberInfo);
		String maadr_replace = memberInfo.getMaddr().replace("_", " ");
		memberInfo.setMaddr(maadr_replace);
		gson = new Gson();
		String memberInfo_json = gson.toJson(memberInfo);
		return memberInfo_json;
	}

}
