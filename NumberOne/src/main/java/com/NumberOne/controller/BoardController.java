package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bsvc;

	
	//자취방 자랑 메인 페이지 이동
	@RequestMapping(value="/selectRoomList")
	public ModelAndView selectRoomList(String bdcode, String jsp) {
		System.out.println("자쥐방 자랑 메인 요청(목록페이지)");	
		System.out.println(bdcode+"/"+jsp);
		ModelAndView mav = new ModelAndView();
		mav=bsvc.selectRoomList();
		
		if(bdcode != "") {
			//bdcode 추가
			mav.addObject("bdcode", bdcode);
			if(jsp !=null) {
				if(jsp.equals("view")) {
					//상세보기 페이지로 이동
					mav.setViewName("board/RoomViewPage");
				}
			}
			
		}
		
		
		return mav;
	}

	//자취방 자랑글 작성 페이지 이동
	@RequestMapping(value="/loadToWriteRoom")
	public String loadToWriteRoom(RedirectAttributes ra) {
		System.out.println("자쥐방 자랑 Form 요청");
		return "board/RoomWriteForm";
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
	
	//전체글목록 페이지 
	@RequestMapping ( value = "/selectBoardList")
	public ModelAndView boardListPage() {
	    System.out.println("게시판 글목록 페이지 요청");
	    ModelAndView mav = bsvc.boardListPage();
	    return mav;
	}
	
	
	
	//카테고리별 글목록 조회 ( ajax )
	@RequestMapping ( value = "/getBoardCategoryList_ajax")
	@ResponseBody public String boardCategoryList_ajax( String bdcategory) {
		System.out.println("카테고리별 글목록 요청_ajax");
	      
	    String boardCateList_json = bsvc.boardCategoryList_ajax(bdcategory);
	      
	    return boardCateList_json;
	      
	}
	   
	 //글검색 
	 @RequestMapping ( value = "/selectBoardSearchList")
	 public ModelAndView selectBoardSearchList( String bdcategory, String searchType, String searchText) {
	     System.out.println("글검색 목록 요청");
	      
	     ModelAndView mav = bsvc.selectBoardSearchList(bdcategory, searchType, searchText);
	      
	     return mav;
	 }
	 
	 //공지글검색
	 @RequestMapping ( value = "/selectNoticeSearchList")
	 public ModelAndView selectNoticeSearchList( String searchType, String searchText ) {
		 System.out.println("공지글 검색 목록 요청");
		 
		 ModelAndView mav = bsvc.selectNoticeSearchList(searchType, searchText);
		 
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
	 
	 //댓글 수정버튼 클릭 시 댓글정보 불러오기(ajax)
	 @RequestMapping ( value = "/selectRpContents_ajax")
	 @ResponseBody
	 public ReplyDto selectRpContents_ajax(String rpcode) {
		 System.out.println("댓글정보 요청_ajax");
		 
		 ReplyDto reply = bsvc.selectRpContents_ajax(rpcode);
		 
		 return reply;
		 
	 }
	 
	 //댓글 수정 (ajax)
	 @RequestMapping ( value = "/updateRpcontents_ajax")
	 @ResponseBody
	 public int  updateRpcontents_ajax(String rpcode, String rpcontents) {
		 System.out.println("댓글수정 요청_ajax");
		 
		 int updateResult = bsvc.updateRpcontents_ajax(rpcode, rpcontents);
		 
		 
		 return updateResult;
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
	 public String insertBoardRecommend_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 추천 요청_ajax");
		 
		 String recommend = bsvc.insertBoardRecommend_ajax(loginId, bdcode);
		 
		 return recommend;
	 }
	 
	 //게시글 추천 취소(추천 중복 클릭 시)
	 @RequestMapping ( value = "/deleteBoardRecommend_ajax")
	 @ResponseBody
	 public int deleteBoardRecommend_ajax(String loginId, String bdcode ) {
		 System.out.println("게시글 추천 삭제_ajax");
		 
		 int deleteResult = bsvc.deleteBoardRecommend_ajax(loginId, bdcode);
		 
		 return deleteResult;
	 }
	 //게시글 추천 유무 확인 
	 @RequestMapping ( value = "/checkBoardRecommend_ajax")
	 @ResponseBody
	 public String checkBoardRecommend_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 추천 유무 확인 요청_ajax");
		 
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
	 /* 게시글 신고  */
	 //게시글 신고 유무 확인
	 @RequestMapping ( value = "/checkBoardWarning_ajax")
	 @ResponseBody
	 public String checkBoardWarning_ajax(String loginId, String bdcode ) {
		 System.out.println("게시글 신고 유무 확인 요청_ajax");
		 
		 String wnCheck = bsvc.checkBoardWarning_ajax(loginId, bdcode);
		 
		 return wnCheck;
	 }
	 
	 //게시글 신고 
	 @RequestMapping ( value = "/insertBoardWarning_ajax")
	 @ResponseBody
	 public int insertBoardWarning_ajax(String loginId, String bdcode) {
		 System.out.println("게시글 신고 요청_ajax");
		 
		 int insertResult = bsvc.insertBoardWarning_ajax(loginId, bdcode);
		 
		 return insertResult;
	 }
	 //게시글 신고 취소 (신고 중복 클릭 시 )
	 @RequestMapping ( value = "/deleteBoardWarning_ajax")
	 @ResponseBody 
	 public int deleteBoardWarning_ajax(String loginId, String bdcode ) {
		 System.out.println("게시글 신고 취소 요청_ajax");
		 
		 int deleteResult = bsvc.deleteBoardWarning_ajax(loginId, bdcode);
		 
		 return deleteResult;
		 
	 }
	 
	 
	 //게시글 수정 페이지 이동 
	 @RequestMapping ( value = "/loadToBoardModify")
	 public ModelAndView loadToBoardModify(String bdcode, String bdcategory) {
		 System.out.println("게시글 수정페이지 이동 요청");
		 ModelAndView mav = bsvc.loadToBoardModify(bdcode, bdcategory);
		 
		 return mav;
	 }
	 
	 //게시글 수정 
	 @RequestMapping ( value = "/updateBoardModify")
	 public ModelAndView updateBoardModify(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("게시글 수정 요청");
		 
		 ModelAndView mav = bsvc.updateBoardModify(board, ra);
		 
		 return mav;
		 
	 }
	 
	 //게시글 삭제
	 @RequestMapping ( value = "/updateBoardDelete")
	 public ModelAndView updateBoardDelete (String bdcode, String bdcategory, RedirectAttributes ra) {
		 System.out.println("게시글 삭제 요청");
		 
		 ModelAndView mav = bsvc.updateBoardDelete(bdcode, bdcategory ,ra);
		 
		 return mav;
		 
	 }
	 
	 //게시글 작성 페이지 이동 
	 @RequestMapping ( value = "/loadToBoardWrite")
	 public ModelAndView loadToBoardWrite(String bdcategory) {
		 System.out.println("게시글 작성페이지 이동 요청");
		 
		 ModelAndView mav = bsvc.loadToBoardWrite(bdcategory);
		 
		 return mav;
	 }
	 
	 //게시글 작성 
	 @RequestMapping ( value = "/insertBoardWrite")
	 public ModelAndView insertBoardWrite(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("게시글 작성 요청");
		 
		 ModelAndView mav = bsvc.insertBoardWrite(board, ra);
		 
		 return mav;
	 }
	 //공지게시판 이동
	 @RequestMapping ( value = "/selectNoticeBoardList")
	 public ModelAndView selectNoticeBoardList() {
		 System.out.println("공지게시판 이동 요청");
		 
		 ModelAndView mav = bsvc.selecNoticeBoardList();
		 
		 return mav;
	 }
	 
	 //자유게시판 이동 
	 @RequestMapping ( value = "/selectFreeBoardList")
	 public ModelAndView selectFreeBoardList() {
		 System.out.println("자유게시판 이동 요청");
		 
		 ModelAndView mav = bsvc.selectFreeBoardList();
		 
		 return mav;
		 
	 }
	 
   
	 //질문게시판 이동 
	 @RequestMapping ( value = "/selectQuestionBoardList")
	 public ModelAndView selectQuestionBoardList() {
		 System.out.println("질문게시판 이동 요청");
		 
		 ModelAndView mav =bsvc.selectQuestionBoardList();
		 
		 return mav;
		 
	 }
   
	 //정보게시판 이동 
	 @RequestMapping ( value = "/selectInfoBoardList")
	 public ModelAndView selectInfoBoardList() {
		 System.out.println("정보게시판 이동");
		 
		 ModelAndView mav = bsvc.selectInfoBoardList();
		 
		 return mav;
	 }
	 //후기게시판 이동 
	 @RequestMapping ( value = "/selectReviewBoardList")
	 public ModelAndView selectReviewBoardList() {
		 System.out.println("후기게시판 이동");
		 
		 ModelAndView mav = bsvc.selectReviewBoardList();
		 
		 return mav;
	 }
	 
	 //지역게시판 이동 
	 @RequestMapping ( value = "/selectRegionBoardList")
	 public ModelAndView selectRegionBoardList() {
		 System.out.println("지역게시판 이동");
		 
		 ModelAndView mav = bsvc.selectRegionBoardList();
		 
		 return mav;
	 }
	 
	 //지역별 게시판 이동 
	 @RequestMapping ( value = "/selectDetailBoardList")
	 public ModelAndView selectDetailBoardList(String bdrgcode) {
		 System.out.println("지역별 게시판 이동");
		 System.out.println(bdrgcode);
		 ModelAndView mav = bsvc.selectDetailBoardList(bdrgcode);
		 
		 return mav;
		 
	 }

	 
	 //자취방 자랑글 상세 모달 요청
	 @RequestMapping ( value = "/selectRoomView")
	 public @ResponseBody String selectRoomView(String bdcode) {
		 System.out.println(bdcode+"번 자랑글 상세모달 요청");
		 String roomView_json = bsvc.selectRoomView(bdcode);
		 
		 return roomView_json;
	 }
	 
	 
	 //자취방 자랑글 추천/스크랩/신고 요청
	 @RequestMapping ( value = "/updateLog")
	 public @ResponseBody String updateRbrecommend(String bdcode, String history, String currentState ) {
		 System.out.println(bdcode+"번 자랑글 "+history+"업데이트 요청 현재상태: "+currentState);
		 int updateResult = bsvc.updateLog(bdcode, history, currentState);
		 
		 return updateResult+"";
	 }
	 
	 //자취방 자랑글 현재 추천,스크랩,신고 상태
	 @RequestMapping ( value = "/currentHistory")
	 public @ResponseBody String currentRchistory(String bdcode, String history) {
		 System.out.print(bdcode+"번글 ");
		 System.out.println(history+"의 현재 상태 요청");
		 String currnetState = bsvc.currentRchistory(bdcode, history);

		 return currnetState;
	 }
	 
		/*
		 * //자취방 자랑글 상세 페이지 요청(마이페이지, 게시판메인. 관리자 연결용)
		 * 
		 * @RequestMapping( value="/loadToRoomViewPage") public ModelAndView
		 * loadToRoomViewPage(String bdcode) {
		 * System.out.println(bdcode+"번 자랑글 상세 페이지 이동 요청"); //상세 보기 하단에 나올 자랑글 목록
		 * 받아오기(상세글은 ajax로) ModelAndView mav = bsvc.selectRoomList();
		 * mav.addObject("bdcode", bdcode); mav.setViewName("board/RoomViewPage");
		 * return mav; }
		 */
	 
	 
	 @RequestMapping ( value = "/updateRoomView")
	 public ModelAndView updateRoomView(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("자랑글 수정 요청");
		 
		 ModelAndView mav = bsvc.updateRoomView(board, ra);
		 
		 return mav;
		 
	 }
}
