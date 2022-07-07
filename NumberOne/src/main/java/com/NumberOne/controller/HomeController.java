package com.NumberOne.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.BoardDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardService bsvc;
	
	@Autowired
	BoardDao bdao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );

		
		ModelAndView mav = new ModelAndView();
		
		// 자랑 게시판 불러오기 loadTowriteRoom :: 메인배너로 & 자랑글상세 링크 필요
		
		
		// 전체 게시판 불러오기 & 일반 상세 링크 /selectBoardView
		ArrayList<BoardDto> boardList = bdao.selectBoardList();
		System.out.println(boardList);
		mav.addObject("boardList", boardList);
		
		
		// 공지 게시판 불러오기 & 공지 상세 링크 /selectNoticeBoardView	    
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	    System.out.println(noticeList);
	    mav.addObject("noticeList", noticeList);
	    
	    
		// 중고거래 팔구 목록 불러오기 /selectResellSellList
	    // ArrayList<UsedBoardDto> sellList= bsvc.selectResellSellList();
	    // System.out.println(sellList);
	    // mav.addObject("sellList", sellList");
	    
		// 중고거래 사구 목록 불러오기 /selectResellBuyList
	    // ArrayList<UsedBoardDto> buyList= bsvc.selectResellBuyList();
	    // System.out.println(buyList);
	    // mav.addObject("buyList", buyList");
	    
		
		mav.setViewName("Main");
		return mav;

	}
	
	@RequestMapping(value="/loadToFail")
	public String loadToFail() {
		System.out.println("실패 페이지로 이동");
		return "Fail";
	}
	
}
