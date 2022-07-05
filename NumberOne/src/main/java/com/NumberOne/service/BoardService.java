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
	
	//사용할 때 자기 폴더 경로로 바꾸어야 함
	private String roomSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\room";

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
			mav.setViewName("redirect:/");
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
	      
	      /* 카테고리별 게시글 목록 조회 */
	      //1. 자유 게시글 목록 
		  String bdcategory_Free = "자유";
	      ArrayList<BoardDto> boardList_Free = bdao.selectBoardList_Free(bdcategory_Free);
		  System.out.println(boardList_Free);
		  
		  //2. 질문 게시글 목록 
		  String bdcategory_Question = "질문";
	      ArrayList<BoardDto> boardList_Question = bdao.selectBoardList_Question(bdcategory_Question);
	      System.out.println(boardList_Question);
	      
	      //3. 정보 게시글 목록 
	      String bdcategory_Infomation = "정보";
	      ArrayList<BoardDto> boardList_Information = bdao.selectBoardList_Information(bdcategory_Infomation);  
	      System.out.println(boardList_Information);
	     
	      //4. 후기 게시글 목록 
	      String bdcategory_Review = "후기";
	      ArrayList<BoardDto> boardList_Review = bdao.selectBoardList_Review(bdcategory_Review);
	      System.out.println(boardList_Review);
	      
	      //공지게시판 글목록 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      System.out.println(noticeList);
	      
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
	      
	      //공지게시판 글목록 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      System.out.println(noticeList);
	      
	      //일반게시판 글목록 조회 
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
	   public ModelAndView selectBoardSearchList(String searchType, String searchText) {
	      System.out.println("BoardService.selectBoardSearchList() 호출");
	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println("검색타입: " + searchType);
	      System.out.println("검색어: " + searchText);
	      
	      //글검색 목록 조회 
	      ArrayList<BoardDto> searchBdList = bdao.selectBoardSearchList(searchType, searchText);
	      System.out.println(searchBdList);
	      
	      mav.addObject("searchBdList", searchBdList);
	      mav.setViewName("board/BoardSearchListPage");
	      
	      return mav;
	   }


	//자취방 메인 페이지(목록)   
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
	    //확인용 출력
	    
	    for(int i=0; i<roomList.size(); i++) {
	    	System.out.println(roomList.get(i));
	    }
	    

	    
	    mav.setViewName("board/RoomListPage");
		return mav;
	}


	//공지글상세 페이지 이동 
	public ModelAndView selectNoticeBoardView(String nbcode) {
		System.out.println("BoardService.selectNoticeBoardView() 호출");
		ModelAndView mav = new ModelAndView();
		 
		System.out.println("nbcode:" +  nbcode);
		
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
		
		//글상세정보 조회 
		BoardDto board = bdao.selectBoardView(bdcode);
		System.out.println(board);
		
		mav.addObject("board", board);
		mav.setViewName("board/BoardView");
		
		return mav;
	}

	//아이디로 닉네임 찾기
	public ModelAndView selectRoomWriterMnickname(RedirectAttributes ra) {
		System.out.println("BoardService.selectRoomWriterMnickname() 호출");
		String mid = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		
		if(mid == null) {
			System.out.println("비로그인 상태!");
			ra.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
			//로그인 폼으로 돌아가기
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
		String mnickname = bdao.selectRoomWriterMnickname(mid);
		mav.addObject("mnickname", mnickname);
		mav.setViewName("board/WriteRoomForm");
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
	
	//게시글 댓글작성(ajax)
	public int insertBoardReply_ajax(String bdcode, String rpcontents) {
		System.out.println("BoardService.insertBoardComment_ajax() 호출");
		
		ReplyDto reply = new ReplyDto();
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println("로그인 아이디 : " + loginId); 
		System.out.println("댓글작성할 글번호 : " + bdcode); 
		System.out.println("작성할 댓글 내용 : " + rpcontents);
	
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
		reply.setRpcontents(rpcontents);
		
		int insertResult = bdao.insertBoardReply_ajax(reply);
		
		return insertResult;
	}
	
	//게시글 댓글목록 조회(ajax)
	public String selectBoardReplyList_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardReplyList_ajax() 호출");
		
		ArrayList<ReplyDto> replyList = bdao.selectBoardReplyList(bdcode);
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

	//게시글 신고 (ajax)
	public int insertBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.updateBoardWarningCount_ajax() 호출");
		
		int insertResult = bdao.insertBoardWarning_ajax(loginId, bdcode);
		System.out.println("insertResult 신고결과 : " + insertResult );
		return insertResult;
	}
	
	//게시글 추천
	public int insertBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.insertBoardRecommend_ajax() 호출");
		
		int insertResult = bdao.insertBoardRecommend_ajax(loginId, bdcode);

		return insertResult;
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
		
		String recommendCheck = bdao.checkBoardRecommend_ajax(loginId, bdcode);
		System.out.println(recommendCheck);
		String rcCheck = null;
		if( recommendCheck == null ) {
			rcCheck = "No";//추천한적 없음 
		}else {
			rcCheck = "Yes";//추천한적 있음 
		}
		
		
		return rcCheck;
	}
	
	//게시글 추천수 조회 
	public int selectBoardRecommendCount_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardRecommendCount_ajax() 호출");
		
		int boardRecommendCount = bdao.selectBoardRecommendCount_ajax(bdcode);
		System.out.println("게시글 추천수 : " + boardRecommendCount);
		
		return boardRecommendCount;
	}
	

	//게시글 삭제 
	public ModelAndView updateBoardDelete(String bdcode, RedirectAttributes ra) {
		System.out.println("BoardService.updateBoardDelete() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 글번호 : " + bdcode );
		
		int updateResult = bdao.updateBoardDelete(bdcode);
		if( updateResult > 0 ) {
			ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		}
		
		//삭제 후 전체 글목록 페이지로 이동
		mav.setViewName("redirect:/selectBoardList");
		
		return mav;
	}
	
	//게시글 수정 페이지 이동 요청 
	public ModelAndView loadToBoardModify(String bdcode) {
		System.out.println("BoardService.loadToBoardModify() 호출");
		ModelAndView mav = new ModelAndView();
		
		//수정할 게시글 정보 
		BoardDto board = bdao.selectBoardView(bdcode);
		System.out.println(board);
		
		mav.addObject("board", board);
		mav.setViewName("board/BoardModifyForm");
		
		return mav;
	}
	
	//게시글 수정
	public ModelAndView updateBoardModify(BoardDto board, RedirectAttributes ra) {
		System.out.println("BoardService.updateBoardModify() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(board);
		
		String bdcontents = board.getBdcontents().replace("", "&nbsp;");
		bdcontents = board.getBdcontents().replace("\r\n", "<br>");
		board.setBdcontents(bdcontents);
		
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

}
