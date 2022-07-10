package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

import javax.print.DocFlavor.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.BoardDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.ReplyDto;
import com.google.gson.Gson;



@Service
public class BoardService {

	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	//자랑게시판 이미지 등록 경로
	private String roomSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\room";
	
	//일반게시판 이미지 등록 경로 
	private String boardSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board";
	
	//자취방자랑 글 등록
	public ModelAndView insertRoomWrite(BoardDto room, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardService.insertRoomWrite() 호출");
		
		//글번호 생성
		String bdcode = bdao.selectMaxBdcode();
		System.out.println("maxBdcode: "+bdcode);
		int bdcodeNum = Integer.parseInt(bdcode.substring(2))+1;
		System.out.println("bdcodeNum: "+bdcodeNum);
		if(bdcodeNum<10) {
			bdcode = "BD0000"+bdcodeNum;
		} else if(bdcodeNum<100) {
			bdcode = "BD000"+bdcodeNum;
		} else if(bdcodeNum<1000) {
			bdcode = "BD00"+bdcodeNum;
		} else if(bdcodeNum<10000) {
			bdcode = "BD0"+bdcodeNum;
		} else if(bdcodeNum<100000) {
			bdcode = "BD"+bdcodeNum;
		} 
		//System.out.println("bdcode: "+bdcode);
		room.setBdcode(bdcode);
		
		//대표이미지 파일
		MultipartFile bdimgfile = room.getBdimgfile();
		//대표이미지의 파일명
		String bdimg = "";
		
		//대표이미지 파일 처리
		if( ! bdimgfile.isEmpty() ) {
			System.out.println("대표 이미지 있음");
			UUID uuid = UUID.randomUUID();
			
			//파일명 생성
			bdimg = "M"+uuid.toString()+"_"+bdimgfile.getOriginalFilename();
			//대표 이미지 파일 저장
			System.out.println(roomSavePath);
			bdimgfile.transferTo( new File (roomSavePath, bdimg)  );
			
			//room에 setBdimg 
			System.out.println("bdimg : " + bdimg);
		} 
		
		room.setBdimg(bdimg);
		
		
		//상세이미지 파일
		MultipartFile[] bddetailimgfile = room.getBddetailimgfile();
		//상세이미지의 파일명(최대 5개)
		String bddetailimg = "";
		//상세이미지 파일 처리
		//System.out.println("상세이미지개수: "+bddetailimgfile.length);
		//상세 이미지를 선택 안해도 배열의 크키가 1로 나옴
		//0번 인덱스의 filename이 있는지로 확인해야 함
		System.out.println("bddetailimgfile[0].length: "+bddetailimgfile[0].getOriginalFilename().length());
		
		if( bddetailimgfile[0].getOriginalFilename().length() > 0 ) {
			
			for(int i=0; i<bddetailimgfile.length; i++) {
				UUID uuid = UUID.randomUUID();
				//파일명 생성
				String bddetailimgname = uuid.toString()+"_"+bddetailimgfile[i].getOriginalFilename();
				//상세 이미지 파일 저장
				bddetailimgfile[i].transferTo(  new File(roomSavePath, bddetailimgname)   );
				bddetailimg += bddetailimgname+"___";
			}
			
			//room에 setBddetailimg 
			System.out.println("bddetailimg : " + bddetailimg);
		} 
		room.setBddetailimg(bddetailimg);
		
		//로그인 아이디
		room.setBdmid((String)session.getAttribute("loginId"));
		
		//카테고리 -- 자랑
		room.setBdcategory("자랑");
		
		//System.out.println(room);
		//자취방자랑 글 등록 (dao  - insert문)
		int insertResult = 0;
		
			insertResult = bdao.insertRoomWrite(room);
		
				
		if(insertResult>0) {
			System.out.println("등록 성공!");
			ra.addFlashAttribute("msg", "자취방 자랑글이 등록되었습니다.");
			//메인페이지로 돌아가기	>> 등록한 글 상세보기 페이지로 이동으로 수정	
			mav.setViewName("redirect:/selectRoomList");
		} else {
			System.out.println("등록 실패!");
			ra.addFlashAttribute("msg", "자취방 자랑글 등록에 실패했습니다.");
			//자취방 자랑글 작성 폼으로 돌아가기
			//이전 작성 페이지로 가고 싶은데... (location.history 처럼)
			mav.setViewName("redirect:/loadTowriteRoom");
		}
		
	
		return mav;
	}

	   //게시판(커뮤니티) 메인페이지 이동 
	   public ModelAndView loadToBoardMainPage() {
	      System.out.println("BoardService.loadToBoardMainPage() 호출");
	      ModelAndView mav = new ModelAndView();
	      
	      //자랑글 목록 조회 
	      ArrayList<BoardDto> roomList = bdao.selectRoomList();
	      System.out.println(roomList);
	      
	      /* 카테고리별 게시글 목록 조회 */
	      //1. 자유글 목록 
		  String bdcategory_Free = "자유";
	      ArrayList<BoardDto> boardList_Free = bdao.selectBoardList_Free(bdcategory_Free);
		  System.out.println(boardList_Free);
		  
		  //2. 질문글 목록 
		  String bdcategory_Question = "질문";
	      ArrayList<BoardDto> boardList_Question = bdao.selectBoardList_Question(bdcategory_Question);
	      System.out.println(boardList_Question);
	      
	      //3. 정보글 목록 
	      String bdcategory_Infomation = "정보";
	      ArrayList<BoardDto> boardList_Information = bdao.selectBoardList_Information(bdcategory_Infomation);  
	      System.out.println(boardList_Information);
	     
	      //4. 후기글 목록 
	      String bdcategory_Review = "후기";
	      ArrayList<BoardDto> boardList_Review = bdao.selectBoardList_Review(bdcategory_Review);
	      System.out.println(boardList_Review);
	      
	      //공지글 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      System.out.println(noticeList);
	      
	      mav.addObject("roomList", roomList);
	      mav.addObject("boardList_Free", boardList_Free);
	      mav.addObject("boardList_Question", boardList_Question);
	      mav.addObject("boardList_Information", boardList_Information);
	      mav.addObject("boardList_Review", boardList_Review);
	      mav.addObject("noticeList", noticeList);
	      mav.setViewName("board/BoardMain");
	      
	      return mav;
	   }
	   
	   //게시판 글목록 페이지 
	   public ModelAndView boardListPage() {
	      System.out.println("BoardService.boardListPage() 호출");
	      ModelAndView mav = new ModelAndView();
	      
	      //공지글 목록 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      System.out.println(noticeList);
	      
	      //일반글 목록 조회 
	      ArrayList<BoardDto> boardList = bdao.selectBoardList();
	      System.out.println(boardList);
	      
	      //일반게시판 댓글개수 조회 
	      mav.addObject("noticeList", noticeList);
	      mav.addObject("boardList", boardList);
	      mav.setViewName("board/BoardListPage");
	      
	      return mav;
	   }
	   
	   //카테고리별 글목록 조회 (ajax)
	   public String boardCategoryList_ajax(String bdcategory) {
	      System.out.println("BoardService.boardCategoryList() 호출");
	      System.out.println(bdcategory);
	      
	      ArrayList<BoardDto> boardList = bdao.selectBoardCategoryList_ajax(bdcategory);
	      System.out.println(boardList);
	      
	      Gson gson = new Gson();
	      String boardList_json = gson.toJson(boardList);
	      System.out.println(boardList_json);
	      
	      return boardList_json;
	   }
	   
	   //글검색 목록 
	   public ModelAndView selectBoardSearchList(String bdcategory, String searchType, String searchText) {
	      System.out.println("BoardService.selectBoardSearchList() 호출");
	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println("검색게시판: " + bdcategory);
	      System.out.println("검색타입: " + searchType);
	      System.out.println("검색어: " + searchText);
	      
	      //글검색 목록 조회 
	      ArrayList<BoardDto> searchBdList = bdao.selectBoardSearchList(bdcategory, searchType, searchText);
	      System.out.println(searchBdList);
	      
	      mav.addObject("searchBdList", searchBdList);
	      mav.setViewName("board/BoardSearchListPage");
	      
	      return mav;
	   }


	//자취방 자랑 메인 페이지(목록)   
	public ModelAndView selectRoomList() {
		System.out.println("BoardService.selectRoomList() 호출");
		ModelAndView mav = new ModelAndView();
	    ArrayList<BoardDto> roomList = bdao.selectRoomList();	
	    System.out.println("자취방 자랑글 개수: "+roomList.size());
	    
	    /*
	    for (int i = 0; i < roomList.size(); i++) {
			if(roomList.get(i).getBdimg().equals("")){
				
			}
		}
	    */
	    
	    mav.addObject("roomList", roomList);
	    
	    /* 확인용 출력
	    for(int i=0; i<roomList.size(); i++) {
	    	System.out.println(roomList.get(i));
	    }
	    */
	    

	    
	    mav.setViewName("board/RoomListPage");
		return mav;
	}


	//공지글상세 페이지 이동 
	public ModelAndView selectNoticeBoardView(String nbcode) {
		System.out.println("BoardService.selectNoticeBoardView() 호출");
		ModelAndView mav = new ModelAndView();
		 
		System.out.println("nbcode:" +  nbcode);
		
		//공지글 조회수 업데이트 
		int updateResult = bdao.updateNoticeBdHits(nbcode);
		
		//공지글 정보 조회 
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		System.out.println(noticeBoard);
		
		mav.addObject("noticeBoard", noticeBoard);
		mav.setViewName("board/NoticeBoardView");
		
		return mav;
	}
	
	//일반게시판 - 글상세페이지 이동 
	public ModelAndView selectBoardView(String bdcode) {
		System.out.println("BoardService.selectBoardView() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("bdcode : " + bdcode);
		
		//게시글 조회수 증가 
		updateBoardHits(bdcode);
		//글상세정보 조회 
		BoardDto board = bdao.selectBoardView(bdcode);
		System.out.println(board);
		
		mav.addObject("board", board);
		mav.setViewName("board/BoardView");
		
		return mav;
	}

	//자취방 자랑글 상세 보기
	public String selectRoomView(String bdcode) {
		System.out.println("BoardService.selectRoomView() 호출");
		
		//조회수 업데이트
		int updateResult = bdao.updateRoomhits(bdcode);
		System.out.println("hitsUpdateResult: "+updateResult);
		
		ModelAndView mav = new ModelAndView();
		
		//로그인 여부 확인
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "";
		}
		System.out.println("로그인 아이디: "+loginId);
		BoardDto roomView = bdao.selectRoomView(bdcode, loginId);
		System.out.println("추천/신고/스크랩 기록 추가: "+roomView);
		//System.out.println(roomView);
		
		//null이면 toJson할 때 사라짐 null값을 수정
		//img, detailimg, bdreply, bdscrap, bdrecommend
		if(roomView.getBdimg() == null) {
			roomView.setBdimg("noimg");
		}
		
		if(roomView.getBddetailimg() == null) {
			roomView.setBddetailimg("noimg");
		}
		
		if(roomView.getBdreply() == null) {
			roomView.setBdreply("0");
		}
		
		if(roomView.getBdscrap() == null) {
			roomView.setBdscrap("0");
		}
		
		if(roomView.getBdrecommend() == null) {
			roomView.setBdrecommend("0");
		}
		
		if(roomView.getRchistory() == null) {
			roomView.setRchistory("n");
		}
		
		if(roomView.getSchistory()==null) {
			roomView.setSchistory("n");
		}
		
		if(roomView.getWbhistory()==null) {
			roomView.setWbhistory("n");
		}
		
		if(roomView.getBdmprofile()==null) {
			roomView.setBdmprofile("nomprofile");
		}
		Gson gson = new Gson();
		String roomView_json = gson.toJson(roomView);
		
		System.out.println(roomView_json);
		return roomView_json;
	}

	//roomView 추천/스크랩/신고 
	public int updateLog(String bdcode, String history, String currentState) {
		System.out.print("service.updateLog() 호출 ");
		System.out.println(history+"상태 변경 요청");
		int updateResult=0;
		String loginId = (String)session.getAttribute("loginId");
		System.out.println("아이디: "+loginId);
		
		
		if(currentState.equals("1")) {
			//history 있다면 취소
			updateResult = bdao.deleteState(bdcode, loginId, history); 
			System.out.println("추천취소결과:"+updateResult);
			return updateResult;
		}
		
		//history 없다면 입력
		updateResult = bdao.insertState(bdcode, loginId, history); 	
		
		System.out.println("updateStateResult: "+updateResult);
		
		return updateResult;
	}
	
	//게시글 댓글등록(ajax)
	public int insertBoardReply_ajax(String bdcode, String rpcontents) {
		System.out.println("BoardService.insertBoardComment_ajax() 호출");
		
		ReplyDto reply = new ReplyDto();
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println("로그인 아이디 : " + loginId); 
		System.out.println("댓글작성할 글번호 : " + bdcode); 
		System.out.println("작성할 댓글 내용 : " + rpcontents);
		
		//댓글 줄바꿈, 띄어쓰기 적용
		rpcontents.replace("", "&nbsp;");
		rpcontents.replace("\r\n", "<br>");//?
		System.out.println(rpcontents);
		reply.setRpcontents(rpcontents);
		
		//댓글번호 생성 
		String maxRpcode = bdao.selectReplyMaxNumber();
		System.out.println("maxRpcode : " + maxRpcode);
		String rpcode = "RP";
		
		if( maxRpcode == null) {
			rpcode = rpcode + "00001";
		}else {
		
			String rpcode_stirng = maxRpcode.substring(4);
			int rpcode_num = Integer.parseInt(rpcode_stirng)+1;
			
			if( rpcode_num < 10) {
				rpcode = rpcode + "0000" + rpcode_num;
			}else if( rpcode_num < 100 ) {
				rpcode = rpcode + "000" + rpcode_num;
			}else if( rpcode_num < 1000 ) {
				rpcode = rpcode + "00" + rpcode_num;
			}else if( rpcode_num < 10000 ) {
				rpcode = rpcode + "0" + rpcode_num;
			}else {
				rpcode = rpcode + rpcode_num;
			}
		}
		System.out.println(rpcode);
		
		//Reply 객체에 저장 
		reply.setRpcode(rpcode);
		reply.setRpbdcode(bdcode);
		reply.setRpmid(loginId);
		
		int insertResult = bdao.insertBoardReply_ajax(reply);
		
		return insertResult;
	}
	
	//게시글 댓글목록 조회(ajax)
	public String selectBoardReplyList_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardReplyList_ajax() 호출");
		
		ArrayList<ReplyDto> replyList = bdao.selectBoardReplyList(bdcode);
		//System.out.println(replyList);
	
		//프로필 사진 없는 경우 rpmprofile에 nomprofile 저장
		for (int i = 0; i < replyList.size(); i++) {
			if(replyList.get(i).getRpmprofile()==null) {
				replyList.get(i).setRpmprofile("nomprofile");
			}
		}
		
		for ( int i=0; i< replyList.size(); i++) {
			String rpcontents = replyList.get(i).getRpcontents().replace("<br>", "\r\n");
			rpcontents = replyList.get(i).getRpcontents().replace("&nbsp;", "");
			replyList.get(i).setRpcontents(rpcontents);
		}
		System.out.println("댓글목록 조회 ");
		System.out.println(replyList);
		
		//댓글목록 JSON 타입으로 변환 
		Gson gson = new Gson();
		String replyList_json = gson.toJson(replyList);
		System.out.println(replyList_json);
		
		return replyList_json;
	}
	
	//게시글 댓글개수 조회(ajax)
	public int selectReplyCount_ajax(String bdcode) {
		System.out.println("BoardService.selectReplyCount_ajax() 호출");
		
		int replyCount = bdao.selectReplyCount_ajax(bdcode);
		System.out.println("댓글개수 : " + replyCount);
		
		return replyCount;
	}
	
	//게시글 댓글삭제[상태변경] (ajax)
	public int updateReplyState_ajax(String rpcode) {
		System.out.println("BoardService.updateReplyState_ajax() 호출");
		
		int updateResult = bdao.updateReplyState_ajax(rpcode);
		
		return updateResult;
	}
	
	//게시글 신고 유무 확인 
	public String checkBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.checkBoardWarning_ajax() 호출");
		
		String wnCheck ="";
		String warning = bdao.checkBoardWarning_ajax(loginId, bdcode);
		if( warning != null ) {
			//이미 신고한 게시물
			wnCheck = "Yes";
		}
		return wnCheck;
	}
	
	//게시글 신고 (ajax)
	public int insertBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.updateBoardWarningCount_ajax() 호출");
		
		int insertResult = bdao.insertBoardWarning_ajax(loginId, bdcode);
		return insertResult;
	}
	
	//게시글 신고 취소(삭제)
	public int deleteBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.deleteBoardWarning_ajax() 호출");
		
		int insertResult = bdao.deleteBoardWarning_ajax(loginId, bdcode);
		
		return insertResult;
	}
	
	
	//게시글 추천
	public String insertBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.insertBoardRecommend_ajax() 호출");
		
		String recommend = "";
		int insertResult = bdao.insertBoardRecommend_ajax(loginId, bdcode);
		if( insertResult > 0 ) {
			recommend = "Regist";
		}
		
		return recommend;
	}
	
	//게시글 추천 취소 (추천 중복 클릭 시) 
	public int deleteBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.deleteBoardRecommend_ajax() 호출");
		
		int deleteResult = bdao.deleteBoardRecommend_ajax(loginId, bdcode);
		
		return deleteResult;
	}
	
	//게시글 추천 유무 확인 
	public String checkBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.checkBoardRecommend_ajax() 호출");
		
		String rcCheck = "";
		String rcBdcode = bdao.checkBoardRecommend_ajax(loginId, bdcode);
		if( rcBdcode != null ) {
			System.out.println("이미 추천한 글");
			rcCheck = "Yes";
		}else {
			rcCheck = "No";
		}
		return rcCheck;
	}
	
	//게시글 추천'수' 조회 
	public int selectBoardRecommendCount_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardRecommendCount_ajax() 호출");
		
		int boardRecommendCount = bdao.selectBoardRecommendCount_ajax(bdcode);
		System.out.println("게시글 추천수 : " + boardRecommendCount);
		
		return boardRecommendCount;
	}
	

	//게시글 삭제 
	public ModelAndView updateBoardDelete(String bdcode, String bdcategory, RedirectAttributes ra) {
		System.out.println("BoardService.updateBoardDelete() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 글번호 : " + bdcode );
		
		int updateResult = bdao.updateBoardDelete(bdcode);
		if( updateResult > 0 ) {
			ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		}
		
		//삭제 후 전체 글목록 페이지로 이동
		if(bdcategory.equals("자랑")) {
			System.out.println("자랑글 삭제 성공");
			mav.setViewName("redirect:/selectRoomList");			
		} else {
			System.out.println("일반글 삭제 성공");
			mav.setViewName("redirect:/selectBoardList");			
		}
		
		return mav;
	}
	
	 //게시글 수정 페이지 이동 요청 
	   public ModelAndView loadToBoardModify(String bdcode, String bdcategory) {
	      System.out.println("BoardService.loadToBoardModify() 호출");
	      ModelAndView mav = new ModelAndView();
	      System.out.println(bdcode+", "+bdcategory);
	      
	      //수정할 게시글 정보 
	      BoardDto board;

	      if(bdcategory == null){
	         //일반글
	         board = bdao.selectBoardView(bdcode);
	         String bdcontents = board.getBdcontents().replace("&nbsp;","");
	         bdcontents = board.getBdcontents().replace("<br>","\r\n");
	         board.setBdcontents(bdcontents);
	         //System.out.println(board);
	      } else {   
	         //자랑글(selec문 분리);
	         board = bdao.selectRoomModify(bdcode);
	         String[] roomdetailimgs= board.getBddetailimg().split("___");
	         System.out.println(roomdetailimgs.length);
	         mav.addObject("roomdetailimgs", roomdetailimgs);
	      }

	      mav.addObject("board", board);
	      if(bdcategory != null){               
	         mav.setViewName("board/RoomModifyForm");
	      } else {         
	         mav.setViewName("board/BoardModifyForm");
	      }
	      
	      return mav;
	   }
	
	//게시글 수정
	public ModelAndView updateBoardModify(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("BoardService.updateBoardModify() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(board);
		
		//게시글 띄어쓰기, 줄바꿈 
		String bdcontents = board.getBdcontents().replace("", "&nbsp;");
		bdcontents = board.getBdcontents().replace("\r\n", "<br>");
		board.setBdcontents(bdcontents);
		
		//이미지 저장 
		String bdimgfile = "";
		if ( !board.getBdimgfile().isEmpty() ) {//업로드한 이미지가 있을 경우 
			System.out.println("첨부파일 있음");
			//파일 가져오기 
			MultipartFile bfile = board.getBdimgfile();//파일 자체를 가져오기 
			
			UUID uuid = UUID.randomUUID();
			
			//파일명 생성 
			bdimgfile = uuid.toString()+"_"+board.getBdimgfile().getOriginalFilename();
			//파일 저장 
			//파일저장 경로 : "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board"
			bfile.transferTo( new File(boardSavePath, bdimgfile) );
			
		}
		System.out.println(bdimgfile);
		board.setBdimg(bdimgfile);
		
		int updateResult = bdao.updateBoardModify(board);
		ra.addFlashAttribute("msg", "글이 수정되었습니다.");
		//글수정 후 다시 글 상세페이지로 이동 
		mav.setViewName("redirect:/selectBoardView?bdcode="+board.getBdcode());
		
		return mav;
	}


	//자랑글 현재 추천,스크랩,신고 상태 조회
	public String currentRchistory(String bdcode, String history) {
		System.out.println("BoardService.currentRchistory() 호출");
		String loginId = (String)session.getAttribute("loginId");
		String currnetState = bdao.selectCurrentHisroty(bdcode, history, loginId);
		System.out.println(bdcode+"의 현재 "+history+"상태: "+currnetState);
		return currnetState;
	}
	
	//글작성 페이지 이동 
	public ModelAndView loadToBoardWrite() {
		System.out.println("BoardService.loadToBoardWrite() 호출");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/BoardWriteForm");
		
		return mav;
	}
	
	//글작성 
	public ModelAndView insertBoardWrite(BoardDto board, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("BoardService.insertBoardWrite() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(board);
		
		//글작성 시 지역선택을 하지 않았을 때 -> 전국으로 설정
		if ( board.getBdrgcode() == null ) {
			board.setBdrgcode("ALL");
		}
		
		//게시글 띄어쓰기, 줄바꿈 
		String bdcontents = board.getBdcontents().replace("", "&nbsp;");
		bdcontents = board.getBdcontents().replace("\r\n", "<br>");
		board.setBdcontents(bdcontents);
		
		//글번호 생성
		String bdcode = bdao.selectMaxBdcode();
		System.out.println("maxBdcode: "+bdcode);
		int bdcodeNum = Integer.parseInt(bdcode.substring(2))+1;
		System.out.println("bdcodeNum: "+bdcodeNum);
		if(bdcodeNum<10) {
			bdcode = "BD0000"+bdcodeNum;
		} else if(bdcodeNum<100) {
			bdcode = "BD000"+bdcodeNum;
		} else if(bdcodeNum<1000) {
			bdcode = "BD00"+bdcodeNum;
		} else if(bdcodeNum<10000) {
			bdcode = "BD0"+bdcodeNum;
		} else if(bdcodeNum<100000) {
			bdcode = "BD"+bdcodeNum;
		} 
		board.setBdcode(bdcode);
		
		//이미지 저장 
		String bdimgfile = "";
		if ( !board.getBdimgfile().isEmpty() ) {//업로드한 이미지가 있을 경우 
			System.out.println("첨부파일 있음");
			//파일 가져오기 
			MultipartFile bfile = board.getBdimgfile();//파일 자체를 가져오기 
			
			UUID uuid = UUID.randomUUID();
			
			//파일명 생성 
			bdimgfile = uuid.toString()+"_"+board.getBdimgfile().getOriginalFilename();
			//파일 저장 
			//파일저장 경로 : "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board"
			bfile.transferTo( new File(boardSavePath, bdimgfile) );
			
		}
		System.out.println(bdimgfile);
		ra.addFlashAttribute("msg", "글이 작성되었습니다");
		board.setBdimg(bdimgfile);
		
		//글작성
		int insertResult = bdao.insertBoard(board);
		
		
		//글작성 성공 시 글상세페이지로 이동
		mav.setViewName("redirect:/selectBoardView?bdcode="+bdcode);
		return mav;
	}

	//게시글 조회수 증가
	public int updateBoardHits(String bdcode) {
		System.out.println("BoardService.updateBoardHits() 호출");
		
		int boardHits = bdao.updateBoardHits(bdcode);
		
		return boardHits;
		
	}
	
	//자유게시판 이동 
	public ModelAndView selectFreeBoardList() {
		System.out.println("BoardService.selectFreeBoardList() 호출");
		ModelAndView mav = new ModelAndView();
		
		String bdcategory_Free = "자유";
		ArrayList<BoardDto> boardList = bdao.selectBoardList_Free(bdcategory_Free);
		System.out.println(boardList);
		
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("boardList", boardList);
		mav.setViewName("board/FreeBoardList");
		
		return mav;
	}

	//댓글정보 불러오기 
	public ReplyDto selectRpContents_ajax(String rpcode) {
		System.out.println("BoardService.selectRpContents_ajax() 호출");
		System.out.println("수정할 댓글번호 : " + rpcode);
		
		ReplyDto reply = bdao.selectRpContents_ajax(rpcode);
		System.out.println(reply);
		
		return reply;
	}
	
	//댓글수정 
	public int updateRpcontents_ajax(String rpcode, String rpcontents) {
		System.out.println("BoardService.updateRpcontents_ajax() 호출");
		System.out.println("rpcontents : " + rpcontents);
		
		int updateResult = bdao.updateRpcontents_ajax(rpcode, rpcontents);
		
		return updateResult;
	}
	
	//공지게시판 이동 
	public ModelAndView selecNoticeBoardList() {
		System.out.println("BoardService.selecNoticeBoardList() 호출");
		ModelAndView mav = new ModelAndView();
		
		//공지글 목록 조회 
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
		
		mav.addObject("noticeList", noticeList);
		mav.setViewName("board/NoticeBoardList");
		
		return mav;
	} 
	


}
