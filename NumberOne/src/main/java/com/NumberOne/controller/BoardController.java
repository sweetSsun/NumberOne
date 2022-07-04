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
import com.google.gson.Gson;

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
	public ModelAndView loadTowriteRoom(RedirectAttributes ra) {
		System.out.println("자쥐방 자랑 Form 요청");
		ModelAndView mav = new ModelAndView();
		mav = bsvc.selectRoomWriterMnickname(ra);
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
	    System.out.println("게시판(커뮤니티) 메인 페이지 이동 요청");
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
	 
	 //댓글작성(ajax)
	 @RequestMapping ( value = "/insertBoardReply_ajax")
	 @ResponseBody
	 public int insertBoardReply_ajax(String bdcode, String rpcontents) {
		 System.out.println("댓글등록 요청_ajax");
		 
		 int insertResult = bsvc.insertBoardReply_ajax(bdcode, rpcontents);
		 
		 return insertResult;
	 }
	 
	 //댓글목록 조회(ajax)
	 @RequestMapping ( value = "/selectBoardReplyList_ajax")
	 @ResponseBody
	 public String selectBoardReplyList_ajax(String bdcode) {
		 System.out.println("댓글목록 요청_ajax");
		 
		 String replyList_ajax = bsvc.selectBoardReplyList_ajax(bdcode);
		 
		 return replyList_ajax;
	 }
	 
	 //댓글개수 조회(ajax)
	 @RequestMapping ( value= "/selectReplyCount_ajax")
	 @ResponseBody
	 public int selectReplyCount_ajax(String bdcode) {
		 System.out.println("댓글개수 요청_ajax");
		 
		 int replyCount = bsvc.selectReplyCount_ajax(bdcode);
		 
		 return replyCount;
	 }
	 
	 //댓글삭제(상태변경) (ajax)
	 @RequestMapping ( value = "/updateReplyState_ajax")
	 @ResponseBody 
	 public int updateReplyState_ajax(String rpcode) {
		 System.out.println("댓글삭제 요청_ajax");
		 
		 int updateResult = bsvc.updateReplyState_ajax(rpcode);
		 
		 return updateResult;
	 }
	 
	 //게시글 추천
	 @RequestMapping ( value = "/insertBoardRecommend_ajax")
	 @ResponseBody 
	 public int insertBoardRecommend_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 추천 요청_ajax");
		 
		 int insertResult = bsvc.insertBoardRecommend_ajax(loginId, bdcode);
		 
		 return insertResult;
	 }
	 
	 //게시글 추천 취소(추천 중복 클릭 시)
	 @RequestMapping ( value = "/deleteBoardRecommend_ajax")
	 @ResponseBody
	 public int deleteBoardRecommend_ajax(String loginId, String bdcode ) {
		 
		 int deleteResult = bsvc.deleteBoardRecommend_ajax(loginId, bdcode);
		 
		 return deleteResult;
	 }
	 
	 //게시글 신고 
	 @RequestMapping ( value = "/insertBoardWarning_ajax")
	 @ResponseBody
	 public int insertBoardWarning_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 신고 요청_ajax");
		 
		 int insertResult = bsvc.insertBoardWarning_ajax(loginId, bdcode);
		 
		 return insertResult;
	 }
	 
	 //게시글 추천 유무 조회 
	 @RequestMapping ( value = "/checkBoardRecommend_ajax")
	 @ResponseBody
	 public String checkBoardRecommend_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 추천 유무 확인 요청");
		 
		 String rcCheck = bsvc.checkBoardRecommend_ajax(loginId, bdcode);
		 
		 return rcCheck;
		 
	 }
	 
	 //게시글 추천수 조회 
	 @RequestMapping ( value = "/selectBoardRecommendCount_ajax")
	 @ResponseBody 
	 public int selectBoardRecommendCount_ajax(String bdcode) {
		 System.out.println("게시글 추천수 조회 요청_ajax");
		 
		 int boardRecommendCount = bsvc.selectBoardRecommendCount_ajax(bdcode);
		 
		 return boardRecommendCount;
		 
	 }
	 //게시글 수정 페이지 이동 
	 @RequestMapping ( value = "/loadToBoardModify")
	 public ModelAndView loadToBoardModify(String bdcode) {
		 System.out.println("게시글 수정페이지 이동 요청");
		 
		 ModelAndView mav = bsvc.loadToBoardModify(bdcode);
		 
		 return mav;
	 }
	 
	 //게시글 수정 
	 @RequestMapping ( value = "/updateBoardModify")
	 public ModelAndView updateBoardModify(BoardDto board, RedirectAttributes ra) {
		 System.out.println("게시글 수정 요청");
		 
		 ModelAndView mav = bsvc.updateBoardModify(board, ra);
		 
		 return mav;
		 
	 }
	 
	 //게시글 삭제
	 @RequestMapping ( value = "/updateBoardDelete")
	 public ModelAndView updateBoardDelete (String bdcode, RedirectAttributes ra) {
		 System.out.println("게시글 삭제 요청");
		 
		 ModelAndView mav = bsvc.updateBoardDelete(bdcode, ra);
		 
		 return mav;
		 
	 }
	 
	 
	 //자취방 자랑글 상세 페이지 이동
	 @RequestMapping ( value = "/selectRoomView")
	 public @ResponseBody String selectRoomView(String bdcode) {
		 System.out.println("자취방 자랑글 상세페이지 이동 요청");
		 System.out.println(bdcode+"번글 상세보기 요청");
		 String roomView_json = bsvc.selectRoomView(bdcode);
		 
		 return roomView_json;
	 }
	 
	 //자취방 자랑글 추천
	 @RequestMapping ( value = "/updateRbrecommend")
	 public @ResponseBody String updateRbrecommend(String bdcode) {
		 System.out.println(bdcode+"번글 추천 요청");
		 int updateResult = bsvc.updateRbrecommend(bdcode);
		 
		 return null;
	 }

}
