package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.GonguBoardDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.service.GonguBoardService;

@Controller
public class GonguBoardController {
	
	private ModelAndView mav;
	
	@Autowired
	private GonguBoardService gbsvc;
	
		
	/* 관리자 페이지 */
	@RequestMapping (value="admin_selectGonguList")
	public ModelAndView admin_selectGonguList(Paging paging, RedirectAttributes ra) {
		System.out.println("공구 관리페이지 이동 요청");
		mav = gbsvc.admin_selectGonguList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectGonguList_ajax")
	public @ResponseBody String admin_selectGonguList_ajax(Paging paging) {
		System.out.println("공구 관리페이지 정렬 요청");
		String gonguList_json = gbsvc.admin_selectGonguList_ajax(paging);
		return gonguList_json;
	}
	
	@RequestMapping (value="admin_updateGbstate_ajax")
	public @ResponseBody int admin_updateGbstate_ajax(String gbcode, int gbstate) {
		System.out.println("공구 관리 상태 변경 요청");
		int updateResult = gbsvc.admin_updateGbstate_ajax(gbcode, gbstate);
		return updateResult;
	}
	
	@RequestMapping (value="admin_updateGbstate")
	public ModelAndView admin_updateGbstate(String gbcode, int gbstate, RedirectAttributes ra) {
		System.out.println("공구 관리 상태 변경 요청_공구글 삭제");
		mav = gbsvc.admin_updateGbstate(gbcode, gbstate, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateGbfix_ajax")
	public @ResponseBody int admin_updateGbfix_ajax(String gbcode, int gbfix) {
		System.out.println("공구 관리 고정 변경 요청");
		int updateResult = gbsvc.admin_updateGbfix_ajax(gbcode, gbfix);
		return updateResult;
	}
	
	@RequestMapping (value="admin_selectGonguBoardView")
	public ModelAndView admin_selectGonguBoardView(String codeIdx, Paging paging) {
		System.out.println("공구 관리 상세페이지 이동 요청");
		mav = gbsvc.admin_selectGonguBoardView(codeIdx, paging);
		return mav;
	}
	
	//공구 작성페이지 이동
	@RequestMapping (value="admin_loadToGonguWrite")
	public ModelAndView admin_loadToGonguWrite(RedirectAttributes ra) {
		System.out.println("공구 작성페이지 이동 요청");
		mav = gbsvc.admin_loadToGonguWrite(ra);
		return mav;
	}
	
	@RequestMapping (value="admin_insertGonguWrite")
	public ModelAndView admin_insertGonguWrite(GonguBoardDto gonguBoard, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("작성한 공구 입력 요청");
		mav = gbsvc.admin_insertGonguWrite(gonguBoard, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectGonguModify")
	public ModelAndView admin_selectGonguModify(String codeIdx, Paging paging, RedirectAttributes ra) {
		System.out.println("공구 수정페이지 이동 요청");
		System.out.println("codeIdx : " + codeIdx);
		mav = gbsvc.admin_selectGonguModify(codeIdx, paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateGonguModify")
	public ModelAndView admin_updateGonguModify(GonguBoardDto gonguBoard, Paging paging, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("공구 수정 요청");
		mav = gbsvc.admin_updateGonguModify(gonguBoard, paging, ra);
		return mav;
	}
	
	
	
	/* 일반 페이지 */
	//공구게시판 이동 및 글검색
	 @RequestMapping ( value = "/selectGonguBoardList")
	 public ModelAndView selectGonguBoardList(Paging paging, String gbstate) {
		 System.out.println("공지글 이동 및 검색 요청");
		 ModelAndView mav = gbsvc.selectGonguBoardList(paging, gbstate);
		 
		 return mav;
	 }
	 
	//공구글 상세페이지 이동 
	 @RequestMapping ( value = "/selectGonguBoardView" )
	 public ModelAndView selectGonguBoardView(String codeIdx, Paging paging) {
		 System.out.println("공지글 상세페이지 이동 요청");
		 ModelAndView mav = gbsvc.selectGonguBoardView(codeIdx, paging);
		 
		 return mav;
	 }

	
	
	
	@RequestMapping (value="insertCheck_ajax")
	public @ResponseBody String insertCheck_ajax(String gnbcode, String gmid) {
		System.out.println("공동구매 참여 중복체크");
		String checkResult = gbsvc.insertCheck_ajax(gnbcode, gmid);
		System.out.println(checkResult);
		return checkResult;
	}
	
	
	
}
