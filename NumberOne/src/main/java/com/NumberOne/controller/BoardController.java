package com.NumberOne.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	BoardService bsvc;
	@Autowired
	private HttpSession session;
	
	//자취방 자랑글 메인 페이지 이동
	//게시판 메인에서 자랑글 클릭 시 이동
	//자랑글 상세 페이지 이동
	@RequestMapping(value="/selectRoomList")
	public ModelAndView selectRoomList(String bdcode, String jsp, Paging paging) {
		System.out.println("자쥐방 자랑 메인 요청(목록페이지)");	
		System.out.println(bdcode+"/"+jsp);
		
		//자랑글은 10개씩 페이징
		paging.setPerPageNum(10);
		
		System.out.println(paging);
		ModelAndView mav = new ModelAndView();
		mav=bsvc.selectRoomList(paging, bdcode, jsp);
		
		if(bdcode != "") {
			//bdcode 추가
			mav.addObject("bdcode", bdcode);
			if(jsp !=null && jsp.equals("view")) {
				//상세보기 페이지로 이동
				mav.setViewName("board/RoomViewPage");
			}
		}
		return mav;
	}

	//자랑글 목록 정렬 요청(글목록)
	@RequestMapping (value="selectRoomList_ajax")
	public @ResponseBody String selectRoomList_ajax(Paging paging) {
		System.out.println("자랑글 정렬 요청-글목록");
		String roomList_json = bsvc.selectRoomList_ajax(paging);
		return roomList_json;
	}
	
	//자랑글 목록 정렬 요청(paging)
		@RequestMapping (value="selectRoomPaging_ajax")
		public @ResponseBody String selectRoomNum_ajax(Paging paging) {
			System.out.println("자랑글 정렬 요청-paging");
			String paging_json = bsvc.selectRoomPaging_ajax(paging);
			return paging_json;
		}
	
		
	//자취방 자랑글 작성 페이지 이동
	@RequestMapping(value="/loadToWriteRoom")
	public ModelAndView loadToWriteRoom(RedirectAttributes ra) {
		System.out.println("자쥐방 자랑 Form 요청");
		ModelAndView mav;
		
		//로그인 확인
		 mav = bsvc.loginChToFail(ra);
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단
			 //실패페이지로 이동(msg alert 띄우고, history back)
			return mav;
		 }
		
		mav.setViewName("board/RoomWriteForm");
		return mav;
	}

	//자취방 자랑글 등록
	@RequestMapping(value="/insertRoomWrite")
	public ModelAndView writeRoom(BoardDto room, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("자쥐방 자랑글 등록 요청");
		ModelAndView mav = new ModelAndView();
		
		//로그인 확인
		 mav = bsvc.loginChToFail(ra);
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단
			 //실패페이지로 이동(msg alert 띄우고, history back)
			return mav;
		 }
		
		mav = bsvc.insertRoomWrite(room, ra);
		return mav;
	}
	
	//게시판 메인 페이지 이동 
	@RequestMapping( value="/loadToBoardMainPage")
	public ModelAndView loadToBoardMainPage(Paging paging) {
	    System.out.println("게시판(커뮤니티) 메인 페이지 이동 요청");
	    ModelAndView mav = bsvc.loadToBoardMainPage(paging);
	    return mav;
	}
	
	//전체글목록 페이지 
	@RequestMapping ( value = "/selectBoardList")
	public ModelAndView boardListPage(Paging paging) {
	    System.out.println("게시판 글목록 페이지 요청");
	    ModelAndView mav = bsvc.boardListPage(paging);
	    return mav;
	}
	
	//카테고리별 글목록 조회 ( ajax ) - 페이징 용
	@RequestMapping ( value = "/selectBoardCategoryList_ajax")
	@ResponseBody public String selectBoardCategoryList_ajax( Paging paging ) {
		System.out.println("카테고리별 글목록 요청_ajax");
		
		String boardCateList_json = bsvc.selectBoardCategoryList_ajax(paging);
		
		return boardCateList_json;
	}
	
	//자유,질문,정보,후기게시판 이동 및 글검색
	@RequestMapping ( value = "/selectCategoryBoardList")
	public ModelAndView selectCategoryBoardList(Paging paging) {
		System.out.println(paging.getSearchVal() + "게시판 이동 및 검색 요청");
		
		ModelAndView mav = bsvc.selectCategoryBoardList(paging);
		
		return mav;
	}

	 
	 //공지게시판 이동 및 글검색
	 @RequestMapping ( value = "/selectNoticeBoardList")
	 public ModelAndView selectNoticeBoardList(Paging paging) {
		 System.out.println("공지글 이동 및 검색 요청");
		 ModelAndView mav = bsvc.selectNoticeBoardList(paging);
		 
		 return mav;
	 }
	 
	 //공지글 상세페이지 이동 
	 @RequestMapping ( value = "/selectNoticeBoardView" )
	 public ModelAndView selectNoticeBoardView(String codeIdx, Paging paging) {
		 System.out.println("공지글 상세페이지 이동 요청");
		 ModelAndView mav = bsvc.selectNoticeBoardView(codeIdx, paging);
		 
		 return mav;
	 }
	 
	 //일반/지역 - 글상세페이지 이동 
	 @RequestMapping ( value = "/selectBoardView")
	 public ModelAndView selectBoardView(String codeIdx, Paging paging) {
		 System.out.println("글상세페이지 이동 요청");
		 System.out.println("글카테고리 : "+paging.getSearchVal());
		 
		 ModelAndView mav = bsvc.selectBoardView(paging, codeIdx);
		 
		 return mav;
	 }
	 
	 //후기글 상세페이지 이동 
	 @RequestMapping ( value = "/selectReviewBoardView")
	 public ModelAndView selectReviewBoardView(String codeIdx, Paging paging) {
		 System.out.println("후기글 상세페이지 이동 요청");
		 System.out.println("codeIdx : " + codeIdx);
		 
		 ModelAndView mav = bsvc.selectReviewBoardView(codeIdx, paging);
		 
		 return mav;
	 }
	 
	 //댓글등록(ajax)
	 @RequestMapping ( value = "/insertBoardReply_ajax")
	 @ResponseBody
	 public int insertBoardReply_ajax(String bdcode, String rpcontents) {
		 System.out.println("댓글등록 요청_ajax");
		 
		 //로그인 확인
		 String loginId = (String) session.getAttribute("loginId");
		 if(loginId == null) {
			 //로그인 하지 않았을 경우
			 return 2;
		 }
		 
		 int insertResult = bsvc.insertBoardReply_ajax(bdcode, rpcontents);
		 
		 return insertResult;
	 }
	 
	 //댓글등록 + 대댓글 ajax
	 @RequestMapping ( value = "/insertBoardReply_ajax2")
	 @ResponseBody
	 public int insertBoardReply_ajax2(ReplyDto reply) {
		 System.out.println("댓글등록 요청_ajax(+ 대댓글)");
		 
		 //로그인 확인
		 String loginId = (String) session.getAttribute("loginId");
		 if(loginId == null) {
			 //로그인 하지 않았을 경우
			 return 2;
		 }
		 
		 //set rpmid
		 reply.setRpmid(loginId);
		 
		 int insertResult = bsvc.insertBoardReply_ajax(reply);
		 
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
	 public int  updateRpcontents_ajax(String rpcode, String rpcontents, String rpmid) {
		 System.out.println("댓글수정 요청_ajax");
		 
		 String loginId = (String) session.getAttribute("loginId");
		 System.out.println("loginId : " + loginId);
		 System.out.println("rpmid : " + rpmid);
		 
		 if( loginId == null) {
			 return 2;
		 }
		 
		 int updateResult = bsvc.updateRpcontents_ajax(rpcode, rpcontents);

		 System.out.println("댓글수정 결과 : " + updateResult);
		 
		 return updateResult;
	 }
	 
	 //댓글삭제(상태변경) (ajax)
	 @RequestMapping ( value = "/updateReplyState_ajax")
	 @ResponseBody 
	 public int updateReplyState_ajax(String rpcode) {
		 System.out.println("댓글삭제 요청_ajax");
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
		 if( loginId == null) {
			 return 2;
		 }
		 
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
    public ModelAndView loadToBoardModify(String bdcode, Paging paging , RedirectAttributes ra) {
       System.out.println("게시글 수정페이지 이동 요청");
       
       //bdmid 정보가 없어서 service에서 로그인 체크
       ModelAndView mav = bsvc.loadToBoardModify(bdcode, paging, ra);
       
       return mav;
    }
	 
	 //게시글 수정 
	 @RequestMapping ( value = "/updateBoardModify")
	 public ModelAndView updateBoardModify(BoardDto board, String del_bdimg, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("게시글 수정 요청");
		 ModelAndView mav = new ModelAndView();
		 
		//작성자 본인 확인
		 mav = bsvc.writerChToFail(ra, board.getBdmid());
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단하고 
			 //실패페이지로 이동(msg alert 띄우고, history back)
			return mav;
		 }
		 
		mav = bsvc.updateBoardModify(board, del_bdimg, ra);
		 
		 return mav;
	 }
	 
	 //게시글 삭제
	    @RequestMapping ( value = "/updateBoardDelete")
	    public ModelAndView updateBoardDelete (String bdtype, String bdcode, String bdcategory, String bdmid, RedirectAttributes ra) {
	       System.out.println("게시글 삭제 요청");
	       ModelAndView mav = new ModelAndView();
	       
	      //작성자 본인 확인
	       mav = bsvc.writerChToFail(ra, bdmid);
	       if(mav.getViewName() != null) {
	          //setView에 loadtologin이 담겨있으면 메소드 중단하고 
	          //실패페이지로 이동(msg alert 띄우고, history back)
	         return mav;
	       }
	       
	      mav = bsvc.updateBoardDelete(bdtype, bdcode, bdcategory ,ra);
	      return mav;

	    }
	 
	 //게시글 작성 페이지 이동 
    @RequestMapping ( value = "/loadToBoardWrite")
    public ModelAndView loadToBoardWrite(String bdcategory, String bdrgcode, String bdrgname, RedirectAttributes ra) {
       System.out.println("게시글 작성페이지 이동 요청");
       ModelAndView mav = new ModelAndView();
	       //로그인 확인
       mav = bsvc.loginChToFail(ra);
       if(mav.getViewName() != null) {
          //setView에 loadtologin이 담겨있으면 메소드 중단
         return mav;
       }   
	      //mav.addObject("bdcategory", bdcategory);
      //mav.addObject("bdrgcode", bdrgcode);
      //mav.addObject("bdrgname",bdrgname);
       
      mav = bsvc.loadToBoardWrite(bdcategory, bdrgcode, bdrgname);
       
       return mav;
    }
	 
	 //게시글 작성 
	 @RequestMapping ( value = "/insertBoardWrite")
	 public ModelAndView insertBoardWrite(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("게시글 등록 요청");
		 
		 ModelAndView mav;
		 
		 //로그인 확인
		 mav = bsvc.loginChToFail(ra);
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단
			return mav;
		 }	
		 
		 mav = bsvc.insertBoardWrite(board, ra);
		 
		 return mav;
	 }
	 
	 //지역게시판 이동 
	 @RequestMapping ( value = "/selectRegionBoardList")
	 public ModelAndView selectRegionBoardList(Paging paging) {
		 System.out.println("지역게시판 이동");
		 
		 ModelAndView mav = bsvc.selectRegionBoardList(paging);
		 
		 return mav;
	 }
	 
	 //지역게시판 글정렬 (ajax)
	 @RequestMapping ("/selectRegionBoardList_ajax")
	 @ResponseBody
	 public String selectRegionList_ajax(Paging paging) {
		 System.out.println("지역게시판 카테고리 정렬 목록 조회 ");
		 
		 String selRegionList_ajax = bsvc.selectRegionBoardList_ajax(paging);
		 
		 return selRegionList_ajax;
	 }
	 
	 //지역별 게시판 이동 
	 @RequestMapping ( value = "/selectDetailBoardList")
	 public ModelAndView selectDetailBoardList(Paging paging) {
		 System.out.println("지역별 게시판 이동");
		 ModelAndView mav = bsvc.selectDetailBoardList(paging);
		 
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
	 
		 //현재 상태 조회할 때 로그인 체크해서 신고 처리에는 로그인 체크 없음
		 
		 int updateResult = bsvc.updateLog(bdcode, history, currentState);
		 
		 return updateResult+"";
	 }
	 
	 //자취방 자랑글 현재 추천,스크랩,신고 상태
	 @RequestMapping ( value = "/currentHistory")
	 public @ResponseBody String currentRchistory(String bdcode, String history) {
		 System.out.print(bdcode+"번글 ");
		 System.out.println(history+"의 현재 상태 요청");
		 
		 //로그인 확인
		 String loginId = (String) session.getAttribute("loginId");
		 if(loginId == null) {
			 //로그인 하지 않거나 본인 댓글이 아닌 경우
			 return 2+"";
		 }
		 
		 
		 String currnetState = bsvc.currentRchistory(bdcode, history);

		 return currnetState;
	 }
	 
	 
	 @RequestMapping ( value = "/updateRoomView")
	 public ModelAndView updateRoomView(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		 System.out.println("자랑글 수정 요청");
		 ModelAndView mav = new ModelAndView();
		 String loginId = (String) session.getAttribute("loginId");
		 
		//작성자 본인 확인
		 mav = bsvc.writerChToFail(ra, board.getBdmid());
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단하고 
			 //실패페이지로 이동(msg alert 띄우고, history back)
			return mav;
		 }
		 
		 mav = bsvc.updateRoomView(board, ra);
		 
		 return mav;
	 }
	 
	 
	 //후기글 작성페이지 이동
	 @RequestMapping ( value = "/loadToWriteReview")
	 public ModelAndView loadToWriteReview(RedirectAttributes ra) {
		 System.out.println("후기글 작성페이지 이동 요청");
		 ModelAndView mav= new ModelAndView();
		 
		 //로그인 확인
		 mav = bsvc.loginChToFail(ra);
		 if(mav.getViewName() != null) {
			 //setView에 loadtologin이 담겨있으면 메소드 중단
			 //실패페이지로 이동(msg alert 띄우고, history back)
			return mav;
		 }
		 
		 mav.setViewName("board/ReviewWriteForm");
		 
		 return mav;
		 
	 }
	 
	 //댓글삭제2 (작성자 확인) (ajax)
	 @RequestMapping ( value = "/updateReplyState_ajax2")
	 @ResponseBody 
	 public int updateReplyState_ajax2(String rpcode , String rpmid) {
		 System.out.println("댓글삭제 요청_ajax2");
		 
		 String loginId = (String) session.getAttribute("loginId");
		 if(loginId == null || ! loginId.equals(rpmid)) {
			 //로그인 하지 않거나 본인 댓글이 아닌 경우
			 return 2;
		 }
		 
		 int updateResult = bsvc.updateReplyState_ajax(rpcode);
		 
		 return updateResult;
	 }
	 
	 ///////
	 //대댓글 등록
	 @RequestMapping ( value = "/insertBoardRe_Reply_ajax")
	 @ResponseBody
	 public int insertBoardRe_Reply_ajax(ReplyDto reply, String bdcode) {
		 System.out.println("대댓글 등록 요청_ajax");
		 
		 String loginId = (String)session.getAttribute("loginId");
		 
		 if(loginId == null ) {
			 
			 return 2;
		 }
		 
		 int updateResult = bsvc.insertBoardRe_Reply_ajax(reply, bdcode, loginId);
		 
		 return updateResult;
		 
	 }
	 
	 
}
