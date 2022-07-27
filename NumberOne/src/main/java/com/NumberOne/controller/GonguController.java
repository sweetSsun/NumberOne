package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.service.AdminService;
import com.NumberOne.service.GonguService;


@Controller
public class GonguController {
	
	private ModelAndView mav;
	
	@Autowired
	private AdminService asvc;
	
	@Autowired
	private GonguService gsvc;
	

	
	//공구 작성페이지 이동 (관리자)
	@RequestMapping (value="gongu_loadToBoardWrite")
	public ModelAndView gongu_loadToBoardWrite(RedirectAttributes ra) {
		System.out.println("공구 작성페이지 이동 요청");
		mav = gsvc.gongu_loadToBoardWrite(ra);
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
