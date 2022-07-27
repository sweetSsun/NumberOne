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
	
	
	
	/* 공구 관리 */
	@RequestMapping (value="admin_selectGonguList")
	public ModelAndView admin_selectGonguList(Paging paging, RedirectAttributes ra) {
		System.out.println("공구 관리페이지 이동 요청");
		String NbCheck = "Gb";
		mav = asvc.admin_selectNoticeList(paging, ra, NbCheck);
		return mav;
	}
	
	@RequestMapping (value="admin_selectGonguList_ajax")
	public @ResponseBody String admin_selectGonguList_ajax(Paging paging) {
		System.out.println("공구 관리페이지 정렬 요청");
		String noticeList_json = asvc.admin_selectGonguList_ajax(paging);
		return noticeList_json;
	}
	
	//공구 작성페이지 이동
	@RequestMapping (value="gongu_loadToBoardWrite")
	public ModelAndView gongu_loadToBoardWrite(RedirectAttributes ra) {
		System.out.println("공구 작성페이지 이동 요청");
		String NbCheck = "Gb";
		mav = asvc.admin_loadToNoticeWrite(ra, NbCheck);
		return mav;
	}
	
	//공구 작성 DB 입력 (관리자)
	@RequestMapping (value="gongu_insertBoardWrite")
	public ModelAndView admin_insertNoticeWrite(NoticeDto notice, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("작성한 공구 입력 요청");
		mav = gsvc.gongu_insertBoardWrite(notice, ra);
		return mav;
	}
	
	
	 
	 
}
