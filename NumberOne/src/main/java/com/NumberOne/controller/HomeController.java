package com.NumberOne.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.BoardDao;
import com.NumberOne.dao.ResellDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
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
	
	@Autowired
	ResellDao rdao;
	
	@Autowired
	private HttpSession session;
	
	
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
		
		
		
		// 고정된 자랑글 불러오기 :: 메인배너로 & 자랑글상세 링크 필요
		ArrayList<BoardDto> fixList = bdao.selectFixedRoomView();
		//System.out.println(fixList);
		mav.addObject("fixList", fixList);
		
		// 전체 게시판 불러오기 & 목록 링크 /loadToBoardMainPage & 상세 링크 동일 /selectBoardView?bdcode
		ArrayList<BoardDto> boardList = bdao.selectBoardList();
		//System.out.println(boardList);
		mav.addObject("boardList", boardList);
		
		
		String bdcategory_Free = "자유";
		String bdcategory_qa = "질문";
		String bdcategory_info = "정보";
		String bdcategory_review = "후기";
		
		// 자유 게시판 불러오기 & 목록 링크 /selectFreeBoardList
		ArrayList<BoardDto> boardList_free = bdao.selectBoardList_Free(bdcategory_Free);
		//System.out.println(boardList_free);
		mav.addObject("boardList_free", boardList_free);
		
		// 질문 게시판 불러오기 & 목록 링크 /selectQuestionBoardList
		ArrayList<BoardDto> boardList_qa = bdao.selectBoardList_Question(bdcategory_qa);
		//System.out.println(boardList_qa);
		mav.addObject("boardList_qa", boardList_qa);

		// 정보 게시판 불러오기 & 목록 링크 /selectInfoBoardList
		ArrayList<BoardDto> boardList_info = bdao.selectBoardList_Information(bdcategory_info);
		//System.out.println(boardList_info);
		mav.addObject("boardList_info", boardList_info);

		// 후기 게시판 불러오기 & 목록 링크 /selectReviewBoardList
		ArrayList<BoardDto> boardList_review = bdao.selectBoardList_Review(bdcategory_review);
		//System.out.println(boardList_review);
		mav.addObject("boardList_review", boardList_review);
				
		// 공지 게시판 불러오기 & 목록 링크 /selectNoticeBoardList  
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	    //System.out.println(noticeList);
	    mav.addObject("noticeList", noticeList);
	    
	    
		// 중고거래 팔구 목록 불러오기 /selectResellSellList
	    Paging paging = new Paging();
	    String checkMethod = "Main";
	    
	    if((String) session.getAttribute("loginRegion") != null) {
			paging.setSearchVal(rdao.selectRegionCode((String) session.getAttribute("loginRegion")));				
		}
	    paging.setSellBuy("S");	
		ArrayList<UsedBoardDto> SellList = rdao.selectResellPageList(paging, checkMethod);
				
		// 중고거래 사구 목록 불러오기 /selectResellBuyList
		paging.setSellBuy("B");
		ArrayList<UsedBoardDto> buyList = rdao.selectResellPageList(paging, checkMethod);
		
		mav.addObject("SellList", SellList);
		mav.addObject("buyList", buyList);

		
		mav.setViewName("Main");
		return mav;
		
	}
	
	// login/logout 확인작업입니다. 결과값이 "2"인 경우로 조건을 줘야합니다.
	@RequestMapping(value = "/selectLoginOut_ajax")
	public @ResponseBody String selectLoginOut_ajax () {
		System.out.println("로그인/로그아웃 확인 요청");
		
		// 로그아웃 확인
		if(session.getAttribute("loginId")==null) {
			return "2";
		}
		return "1";
	}
	
	// 관리자용 login/logout 확인작업. 결과값이 "2"인 경우로 조건을 줘야합니다.
	@RequestMapping(value = "/Admin_selectLoginOut_ajax")
	public @ResponseBody String Admin_selectLoginOut_ajax () {
		System.out.println("관리자 로그인/로그아웃 확인 요청");
		String loginId = (String) session.getAttribute("loginId");
		// 로그아웃 확인
		if(loginId == null || !loginId.equals("admin")) {
			return "2";
		}
		return "1";
	}
	
	@RequestMapping(value="/loadToFail")
	public String loadToFail() {
		System.out.println("실패 페이지로 이동");
		return "Fail";
	}
	
}
