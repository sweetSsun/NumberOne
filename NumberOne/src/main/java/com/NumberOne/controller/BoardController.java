package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bsvc;

	
	//자취방 자랑 메인 페이지 이동
	@RequestMapping(value="/selectRoomList")
	public ModelAndView roomListPage() {
		System.out.println("자쥐방 자랑 메인 요청(목록페이지)");	
		ModelAndView mav = new ModelAndView();
		mav=bsvc.selectRoomList();
		return mav;
	}

	//자취방 자랑글 작성 페이지 이동
	@RequestMapping(value="/loadTowriteRoom")
	public ModelAndView loadTowriteRoom() {
		System.out.println("자쥐방 자랑 Form 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/WriteRoomForm");
		return mav;
	}

	//자취방 자랑글 등록
	@RequestMapping(value="/insertRoomWrite")
	public ModelAndView writeRoom(BoardDto room, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("자쥐방 자랑글 등록 요청");
		ModelAndView mav = new ModelAndView();
		mav = bsvc.insertRoomWrite(room, ra);
		return mav;
	}
	
	
	//게시판 메인 페이지 이동 
	@RequestMapping( value="/loadToBoardMainPage")
	public ModelAndView loadToBoardMainPage() {
	    System.out.println("게시판(커뮤니티) 메인 페이지 이동");
	    ModelAndView mav = bsvc.loadToBoardMainPage();
	    return mav;
	}
	
	//게시판 글목록 페이지 
	@RequestMapping ( value = "/selectBoardList")
	public ModelAndView boardListPage() {
	    System.out.println("게시판 글목록 페이지 요청");
	    ModelAndView mav = bsvc.boardListPage();
	    return mav;
	}
	   
	//카테고리별 글목록 조회 ( ajax )
	@RequestMapping ( value = "/getBoardCategoryList")
	@ResponseBody public String boardCategoryList_ajax( String bdcategory) {
		System.out.println("카테고리별 글목록 요청_ajax");
	      
	    String boardCateList_json = bsvc.boardCategoryList_ajax(bdcategory);
	      
	    return boardCateList_json;
	      
	}
	   
	 //글검색 
	 @RequestMapping ( value = "/selectBoardSearchList")
	 public ModelAndView selectBoardSearchList( String searchType, String searchText) {
	     System.out.println("글검색 목록 요청");
	      
	     ModelAndView mav = bsvc.selectBoardSearchList(searchType, searchText);
	      
	     return mav;
	 }
	 
	 //공지글 상세페이지 이동 
	 @RequestMapping ( value = "/selectNoticeBoardView" )
	 public ModelAndView selectNoticeBoardView(String nbcode) {
		 System.out.println("공지글 상세페이지 이동 요청");
		 
		 ModelAndView mav = bsvc.selectNoticeBoardView(nbcode);
		 
		 return mav;
	 }
	 
	 //일반게시판 - 글상세페이지 이동
	 @RequestMapping ( value = "/selectBoardView")
	 public ModelAndView selectBoardView(String bdcode) {
		 System.out.println("글상세페이지 이동 요청");
		 
		 ModelAndView mav = bsvc.selectBoardView(bdcode);
		 
		 return mav;
		 
	 }
}
