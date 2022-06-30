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
	@RequestMapping(value="/roomListPage")
	public ModelAndView roomListPage() {
		System.out.println("자쥐방 자랑 메인 요청");		
		return null;
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
	@RequestMapping(value="/writeRoom")
	public ModelAndView writeRoom(BoardDto room, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("자쥐방 자랑글 등록 요청");
		ModelAndView mav = new ModelAndView();
		mav = bsvc.writeRoom(room, ra);
		return null;
	}
	
	
	//게시판 메인 페이지 이동 
	@RequestMapping( value="/boardMainPage")
	public ModelAndView communityMainPage() {
	    System.out.println("게시판(커뮤니티) 메인 페이지 이동");
	    ModelAndView mav = bsvc.boardMainPage();
	    return mav;
	}
	
	
	//게시판 글목록 페이지 
	@RequestMapping ( value = "/boardListPage")
	public ModelAndView boardListPage() {
	    System.out.println("게시판 글목록 페이지 요청");
	    ModelAndView mav = bsvc.boardListPage();
	    return mav;
	}
	   
	//카테고리별 글목록 조회 ( ajax )
	@RequestMapping ( value = "/getBoardCategoryList")
	@ResponseBody public String boardCategoryList( String bdcategory) {
		System.out.println("카테고리별 글목록 요청 - ajax");
	      
	    String boardCateList_json = bsvc.boardCategoryList(bdcategory);
	      
	    return boardCateList_json;
	      
	}
	   
	 //글검색 
	 @RequestMapping ( value = "/searchBoard")
	 public ModelAndView searchBoard( String searchText) {
	     System.out.println("글검색 목록 요청");
	      
	     ModelAndView mav = bsvc.searchBoard(searchText);
	      
	     return null;
	      
	 }
}
