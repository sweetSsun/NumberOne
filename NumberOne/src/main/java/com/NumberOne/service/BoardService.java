package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.AdminDao;
import com.NumberOne.dao.BoardDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;
import com.google.gson.Gson;

@Service
public class BoardService {

	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private AdminDao adao;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	// 자랑게시판 이미지 등록 경로
	private String roomSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\room";

	// 일반게시판 이미지 등록 경로
	private String boardSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board";
	
	//로그인 확인 (파라미터: ra/리턴: mav)
	public ModelAndView loginChToFail(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId == null) {
			System.out.println("비로그인");
			
			//메세지
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다");
			
			//실패페이지로 이돌(msg alert 띄우고, history back)
			mav.setViewName("redirect:loadToFail");
			
			//session에 loginCh = 0으로 저장(리턴 받은 곳에서 loginCh 확인하고
			//0이면 session.removeAttribute("loginCh"); 으로 세션에 정보 삭제
			//return mav;로 메소드 종료
			session.setAttribute("loginCh", 0);
		
		} else {
			System.out.println("로그인");
			
			//session에 loginCh = 1으로 저장(리턴 받은 곳에서 loginCh 확인하고
			//1이면 session.removeAttribute("loginCh"); 으로 세션에 정보 삭제
			//다음 메소드 진행
			session.setAttribute("loginCh", 1);
		}
		
		//호출한 곳에 들어갈 내용
		/*
		//로그인 확인
		ModelAndView mav = bsvc.loginChToFail(ra);
		int loginCh = (int) session.getAttribute("loginCh");
		if(loginCh == 0) {
			session.removeAttribute("loginCh");
			return mav;
		}	
		session.removeAttribute("loginCh");
		*/
		
		return mav;
	}
	
	//작성자 확인 (파라미터: ra, 작성자 아이디/리턴: mav)
	public ModelAndView writerChToFail(RedirectAttributes ra, String checkId ) {
		System.out.println("service.writerChToFail 호출");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId == null) {
			System.out.println("비로그인");
			
			//메세지
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다");
			
			//실패페이지로 이돌(msg alert 띄우고, history back)
			mav.setViewName("redirect:loadToFail");
			
			//session에 loginCh = 0으로 저장(리턴 받은 곳에서 loginCh 확인하고
			//0이면 session.removeAttribute("loginCh"); 으로 세션에 정보 삭제
			//return mav;로 메소드 종료
			session.setAttribute("loginCh", 0);
		} else if (loginId != null && ! loginId.equals(checkId)) {
			System.out.println("작성자 본인 아님");
				
			//메세지
			ra.addFlashAttribute("msg", "작성자가 아닙니다");
				
			//실패페이지로 이돌(msg alert 띄우고, history back)
			mav.setViewName("redirect:loadToFail");
			
			//session에 loginCh = 0으로 저장(리턴 받은 곳에서 loginCh 확인하고
			//0이면 session.removeAttribute("loginCh"); 으로 세션에 정보 삭제
			//return mav;로 메소드 종료
			session.setAttribute("loginCh", 0);
				
		} else {
			System.out.println("작성자 본인");
			//session에 loginCh = 1으로 저장(리턴 받은 곳에서 loginCh 확인하고
			//1이면 session.removeAttribute("loginCh"); 으로 세션에 정보 삭제
			//다음 메소드 진행
			session.setAttribute("loginCh", 1);
			
		} 
		
		//호출한 곳에 들어갈 내용
		/*
		//작성자 확인
		mav = bsvc.writerChToFail(ra, board.getBdmid());
		int loginCh = (int) session.getAttribute("loginCh");
		if(loginCh == 0) {
			session.removeAttribute("loginCh");
			return mav;
		}
		session.removeAttribute("loginCh");
		*/
		
		return mav;
	}

	// 자취방자랑 글 등록
	public ModelAndView insertRoomWrite(BoardDto room, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("BoardService.insertRoomWrite() 호출");

		// 글번호 생성
		String bdcode = bdao.selectMaxBdcode();
		System.out.println("maxBdcode: " + bdcode);
		int bdcodeNum = Integer.parseInt(bdcode.substring(2)) + 1;
		System.out.println("bdcodeNum: " + bdcodeNum);
		if (bdcodeNum < 10) {
			bdcode = "BD0000" + bdcodeNum;
		} else if (bdcodeNum < 100) {
			bdcode = "BD000" + bdcodeNum;
		} else if (bdcodeNum < 1000) {
			bdcode = "BD00" + bdcodeNum;
		} else if (bdcodeNum < 10000) {
			bdcode = "BD0" + bdcodeNum;
		} else if (bdcodeNum < 100000) {
			bdcode = "BD" + bdcodeNum;
		}
		// System.out.println("bdcode: "+bdcode);
		room.setBdcode(bdcode);

		// 대표이미지 파일
		MultipartFile bdimgfile = room.getBdimgfile();
		// 대표이미지의 파일명
		String bdimg = "";

		// 대표이미지 파일 처리
		if (!bdimgfile.isEmpty()) {
			System.out.println("대표 이미지 있음");
			UUID uuid = UUID.randomUUID();

			// 파일명 생성
			bdimg = "M" + uuid.toString() + "_" + bdimgfile.getOriginalFilename();
			// 대표 이미지 파일 저장
			System.out.println(roomSavePath);
			bdimgfile.transferTo(new File(roomSavePath, bdimg));

			// room에 setBdimg
			System.out.println("bdimg : " + bdimg);
		}

		room.setBdimg(bdimg);

		// 상세이미지 파일
		MultipartFile[] bddetailimgfile = room.getBddetailimgfile();
		// 상세이미지의 파일명(최대 5개)
		String bddetailimg = "";
		// 상세이미지 파일 처리
		// System.out.println("상세이미지개수: "+bddetailimgfile.length);
		// 상세 이미지를 선택 안해도 배열의 크키가 1로 나옴
		// 0번 인덱스의 filename이 있는지로 확인해야 함
		System.out.println("bddetailimgfile[0].length: " + bddetailimgfile[0].getOriginalFilename().length());

		if (bddetailimgfile[0].getOriginalFilename().length() > 0) {

			for (int i = 0; i < bddetailimgfile.length; i++) {
				UUID uuid = UUID.randomUUID();
				// 파일명 생성
				String bddetailimgname = uuid.toString() + "_" + bddetailimgfile[i].getOriginalFilename();
				// 상세 이미지 파일 저장
				bddetailimgfile[i].transferTo(new File(roomSavePath, bddetailimgname));
				bddetailimg += bddetailimgname + "___";
			}
			
		}
		// room에 setBddetailimg
		System.out.println("bddetailimg : " + bddetailimg);
		room.setBddetailimg(bddetailimg);

		// 로그인 아이디
		room.setBdmid((String) session.getAttribute("loginId"));

		// 카테고리 -- 자랑
		room.setBdcategory("자랑");

		// System.out.println(room);
		// 자취방자랑 글 등록 (dao - insert문)
		int insertResult = 0;

		insertResult = bdao.insertRoomWrite(room);

		if (insertResult > 0) {
			System.out.println("등록 성공!");
			ra.addFlashAttribute("msg", "자취방 자랑글이 등록되었습니다.");
			// 메인페이지로 돌아가기 >> 등록한 글 상세보기 페이지로 이동으로 수정
			mav.setViewName("redirect:/selectRoomList");
		} else {
			System.out.println("등록 실패!");
			ra.addFlashAttribute("msg", "자취방 자랑글 등록에 실패했습니다.");
			// 자취방 자랑글 작성 폼으로 돌아가기
			// 이전 작성 페이지로 가고 싶은데... (location.history 처럼)
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
	      //System.out.println(roomList);
	      
	      /* 카테고리별 게시글 목록 조회 */
	      //1. 자유글 목록 
		  String bdcategory_Free = "자유";
	      ArrayList<BoardDto> boardList_Free = bdao.selectBoardList_Free(bdcategory_Free);
		 //System.out.println(boardList_Free);
		  
		  //2. 질문글 목록 
		  String bdcategory_Question = "질문";
	      ArrayList<BoardDto> boardList_Question = bdao.selectBoardList_Question(bdcategory_Question);
	      //System.out.println(boardList_Question);
	      
	      //3. 정보글 목록 
	      String bdcategory_Infomation = "정보";
	      ArrayList<BoardDto> boardList_Information = bdao.selectBoardList_Information(bdcategory_Infomation);  
	      //System.out.println(boardList_Information);
	     
	      //4. 후기글 목록 
	      String bdcategory_Review = "후기";
	      ArrayList<BoardDto> boardList_Review = bdao.selectBoardList_Review(bdcategory_Review);
	      //System.out.println(boardList_Review);
	      
	      //공지글 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      //System.out.println(noticeList);
	      
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
	   public ModelAndView boardListPage(Paging paging) {
	      System.out.println("BoardService.boardListPage() 호출");
	      ModelAndView mav = new ModelAndView();
	      System.out.println(paging.getSearchType());
	      
	      //페이징 
	      if(paging.getKeyword() == null) { // dao 조건문이 keyword에 null값이 들어가면 오류가 나기 때문에 ""로 변경
				paging.setKeyword("");
	      }
	      //1. 전체 글 수 조회 
	      int totalCount = bdao.selectBoardTotalCount(paging);
	      paging.setTotalCount(totalCount);
	      paging.calc(); // 페이지 처리 계산 실행
	      //System.out.println(paging);
	      
	      //공지글 목록 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      //System.out.println(noticeList);
	      
	      //2. 일반글 목록 조회 
	      ArrayList<BoardDto> boardList = bdao.selectBoardList_Paging(paging);
	      //System.out.println(boardList);
	      
	      mav.addObject("noticeList", noticeList);
	      mav.addObject("boardList", boardList);
	      mav.addObject("paging", paging);
	      mav.setViewName("board/BoardListPage");
	      
	      return mav;
	   }
	   
	   //자유,질문,정보,후기 게시판 이동 및 글검색
	   public ModelAndView selectCategoryBoardList(Paging paging) {
			System.out.println("BoardService.selectCategoryBoardList() 호출");
			ModelAndView mav = new ModelAndView();
			System.out.println(paging.getSearchVal());
			
			// 페이징
			if(paging.getKeyword() == null) {// dao 조건문이 keyword에 null값이 들어가면 오류가 나기 때문에 ""로 변경
				paging.setKeyword("");
			}
			int totalCount = bdao.selectBoardTotalCount(paging);
			paging.setTotalCount(totalCount);
			paging.calc();
			//System.out.println(paging);
			
			//공지글 목록 조회 
		    ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
		    //System.out.println(noticeList);
		    
		    //일반글 목록 조회 
		    ArrayList<BoardDto> boardList = bdao.selectBoardList_Paging(paging);
		    

		    /*
		    자유 ~ 후기 게시판 이동
		   	if( paging.getSearchVal().equals("자유") ) {
		   		mav.setViewName("board/FreeBoardList");
		   	}else if( paging.getSearchVal().equals("질문") ) {
		   		mav.setViewName("board/QuestionBoardList");
		   	}else if( paging.getSearchVal().equals("정보") ) {
		   		mav.setViewName("board/InfomationBoardList");
		   	}else {//후기게시판
		   		mav.setViewName("board/ReviewBoardList");
		   	}
		   	*/
		   	
		   	if( paging.getSearchVal() != "후기" ) {
		   		mav.setViewName("board/DetailBoardList");
		   	}else {
		   		mav.setViewName("board/ReviewBoardList");
		   	}
		   	
		    mav.addObject("noticeList", noticeList);
		    mav.addObject("boardList", boardList);
		    mav.addObject("paging", paging);
		    
		   	return mav;
		}
	   
	   //글정렬 요청 (BoardMain 페이지)
		public String selectBoardCategoryList_ajax(Paging paging) {
			System.out.println("BoardService.selectBoardCategoryList_ajax() 호출");
			System.out.println("searchVal : " + paging.getSearchVal());
			
			int totalCont = bdao.selectBoardTotalCount(paging);//페이지 처리
			paging.setTotalCount(totalCont);
			paging.calc();
			//System.out.println(paging);
			
			ArrayList<BoardDto> boardList = bdao.selectBoardList_Paging(paging);
			System.out.println("글정렬 리스트");
			//System.out.println(boardList);
			
			Gson gson = new Gson();
			if( paging.getAjaxCheck().equals("list")) {
				String boardList_json = gson.toJson(boardList);
				
				return boardList_json;
						
			}else {	//paging ajax일 경우
				String paging_json = gson.toJson(paging);
				return paging_json;
			}
		}
	   
	   //공지게시판 이동 및 검색 
	   public ModelAndView selectNoticeBoardList(Paging paging) {
		   System.out.println("BoardService.selectNoticeBoard() 호출");
		   ModelAndView mav = new ModelAndView();
		   
		   //페이징 
		   if(paging.getKeyword() == null) {
			   paging.setKeyword("");
		   }
		   int totalCount = bdao.selectNoticeTotalCount(paging);
		   paging.setTotalCount(totalCount);
		   paging.calc(); // 페이지 처리 계산 실행 
		   System.out.println(paging);
		   
		   
		   //고정공지
		   ArrayList<NoticeDto> noticeList_fix = bdao.selectNoticeList();
		   
		   ArrayList<NoticeDto> noticeList = bdao.selectNoticeBoardList(paging);
		   //System.out.println(noticeList);
		   
		   mav.addObject("noticeList_fix", noticeList_fix);
		   mav.addObject("noticeList", noticeList);
		   mav.addObject("paging", paging);
		   mav.setViewName("board/NoticeBoardList");
		   
		   return mav;
	   }

		// 자취방 자랑 메인 페이지(목록)
		public ModelAndView selectRoomList(Paging paging) {
			System.out.println("BoardService.selectRoomList() 호출");
			ModelAndView mav = new ModelAndView();
			
			//페이징 없는 글목록
			//ArrayList<BoardDto> roomList = bdao.selectRoomList();
			
			//System.out.println("1번:"+paging);
			
			//자랑글 개수 받기
			//키워드가 있는 경우 검색, 아니면 전체 글 개수 받아옴
			//null값을 맵핑하면 오류가 남 keyword가 null이면 searchType을 notSearch로 바꾸기
			if(paging.getKeyword() == null) {
				System.out.println("keyword가 null");
				paging.setSearchType("notSearch");
			} 
		
			int totalRoomCount = bdao.selectRoomTotalCount(paging);			
			System.out.println("totalRoomCount: "+ totalRoomCount);
			
			paging.setTotalCount(totalRoomCount);
			paging.calc();
			
			if(paging.getSearchVal() == "all") {
				//정렬 기준이 없는 경우 최신순으로 정렬
				paging.setSearchVal("bdcode");	
			}
			
			//System.out.println("2번:"+paging);
			
			//페이징을 위한 글 목록 받기
			
			ArrayList<BoardDto> roomList = bdao.selectRoomList_paging(paging);
			for (int i = 0; i < roomList.size(); i++) {
				System.out.println(roomList.get(i).getBdcode()+" "+roomList.get(i).getBdhits()+" "+roomList.get(i).getBdreply()+" "+roomList.get(i).getBdrecommend()+" "+roomList.get(i).getBdscrap());
			}
			
			if(paging.getSearchType().equals("bdtitle||bdcontents")) {
				paging.setSearchType("bdtc");
			}
			
			//mav에 object와 view 저장
			mav.addObject("paging", paging);
			mav.addObject("roomList", roomList);
			mav.setViewName("board/RoomListPage");

			return mav;
		}


	// 공지글상세 페이지 이동
	public ModelAndView selectNoticeBoardView(String nbcode) {
		System.out.println("BoardService.selectNoticeBoardView() 호출");
		ModelAndView mav = new ModelAndView();

		System.out.println("nbcode:" + nbcode);

		// 공지글 조회수 업데이트
		int updateResult = bdao.updateNoticeBdHits(nbcode);

		// 공지글 정보 조회
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		System.out.println(noticeBoard);

		mav.addObject("noticeBoard", noticeBoard);
		mav.setViewName("board/NoticeBoardView");

		return mav;
	}

	// 일반/지역 - 글상세페이지 이동
	public ModelAndView selectBoardView(String bdcode, String bdtype) {
		System.out.println("BoardService.selectBoardView() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("bdcode : " + bdcode);
		
		if( bdtype == null ) {
			bdtype = "";
		}
		
		System.out.println("게시판 타입 : " + bdtype);
		
		// 게시글 조회수 증가
		updateBoardHits(bdcode);
		// 글상세정보 조회
		BoardDto board = bdao.selectBoardView(bdcode);
		System.out.println(board);
		
		mav.addObject("board", board);
		
		
		if ( bdtype.equals("region") ) {
			mav.setViewName("board/Region_BoardView");
		}else {
			mav.setViewName("board/BoardView");
		}

		return mav;
	}
	
	// 후기글 상세페이지 이동 
	public ModelAndView selectReviewBoardView(String bdcode) {
		System.out.println("BoardService.selectReviewBoardView() 호출");
		ModelAndView mav = new ModelAndView();
		
		// 게시글 조회수 증가
		updateBoardHits(bdcode);
		BoardDto board = bdao.selectBoardView(bdcode);
		
		mav.addObject("board", board);
		mav.setViewName("board/ReviewBoardView");
		
		return mav;
	}

	
	// 자취방 자랑글 상세 보기
	public String selectRoomView(String bdcode) {
		System.out.println("BoardService.selectRoomView() 호출");

		// 조회수 업데이트
		int updateResult = bdao.updateRoomhits(bdcode);
		System.out.println("hitsUpdateResult: " + updateResult);

		ModelAndView mav = new ModelAndView();

		// 로그인 여부 확인
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			loginId = "";
		}
		System.out.println("로그인 아이디: " + loginId);
		BoardDto roomView = bdao.selectRoomView(bdcode, loginId);
		System.out.println("추천/신고/스크랩 기록 추가: " + roomView);
		// System.out.println(roomView);

		// null이면 toJson할 때 사라짐 null값을 수정
		// img, detailimg, bdreply, bdscrap, bdrecommend
		if (roomView.getBdimg() == null) {
			roomView.setBdimg("noimg");
		}

		if (roomView.getBddetailimg() == null) {
			roomView.setBddetailimg("noimg");
		}

		if (roomView.getBdreply() == null) {
			roomView.setBdreply("0");
		}

		if (roomView.getBdscrap() == null) {
			roomView.setBdscrap("0");
		}

		if (roomView.getBdrecommend() == null) {
			roomView.setBdrecommend("0");
		}

		if (roomView.getRchistory() == null) {
			roomView.setRchistory("n");
		}

		if (roomView.getSchistory() == null) {
			roomView.setSchistory("n");
		}

		if (roomView.getWbhistory() == null) {
			roomView.setWbhistory("n");
		}

		if (roomView.getBdmprofile() == null) {
			roomView.setBdmprofile("nomprofile");
		}
		Gson gson = new Gson();
		String roomView_json = gson.toJson(roomView);

		System.out.println(roomView_json);
		return roomView_json;
	}

	// roomView 추천/스크랩/신고
	public int updateLog(String bdcode, String history, String currentState) {
		System.out.print("service.updateLog() 호출 ");
		System.out.println(history + "상태 변경 요청");
		int updateResult = 0;
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("아이디: " + loginId);

		if (currentState.equals("1")) {
			// history 있다면 취소
			updateResult = bdao.deleteState(bdcode, loginId, history);
			System.out.println("추천취소결과:" + updateResult);
			return updateResult;
		}

		// history 없다면 입력
		updateResult = bdao.insertState(bdcode, loginId, history);

		System.out.println("updateStateResult: " + updateResult);

		return updateResult;
	}

	
	// 게시글 댓글등록(ajax)
	   public int insertBoardReply_ajax(String bdcode, String rpcontents) {
	      System.out.println("BoardService.insertBoardComment_ajax() 호출");

	      ReplyDto reply = new ReplyDto();
	      
	      String loginId = (String) session.getAttribute("loginId");
	      System.out.println("로그인 아이디 : " + loginId);
	      System.out.println("댓글작성할 글번호 : " + bdcode);
	      System.out.println("작성할 댓글 내용 : " + rpcontents);

	      String maxRpcode = bdao.selectReplyMaxNumber();
	      System.out.println("maxRpcode : " + maxRpcode);
	      String rpcode = "RP";

	      if (maxRpcode == null) {
	         rpcode = rpcode + "00001";
	      } else {

	         String rpcode_stirng = maxRpcode.substring(4);
	         int rpcode_num = Integer.parseInt(rpcode_stirng) + 1;

	         if (rpcode_num < 10) {
	            rpcode = rpcode + "0000" + rpcode_num;
	         } else if (rpcode_num < 100) {
	            rpcode = rpcode + "000" + rpcode_num;
	         } else if (rpcode_num < 1000) {
	            rpcode = rpcode + "00" + rpcode_num;
	         } else if (rpcode_num < 10000) {
	            rpcode = rpcode + "0" + rpcode_num;
	         } else {
	            rpcode = rpcode + rpcode_num;
	         }
	      }
	      System.out.println(rpcode);

	      // Reply 객체에 저장
	      reply.setRpcontents(rpcontents);
	      reply.setRpcode(rpcode);
	      reply.setRpbdcode(bdcode);
	      reply.setRpmid(loginId);

	      int insertResult = bdao.insertBoardReply_ajax(reply);

	      return insertResult;
	   }

	// 게시글 댓글목록 조회(ajax)
	public String selectBoardReplyList_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardReplyList_ajax() 호출");

		ArrayList<ReplyDto> replyList = bdao.selectBoardReplyList(bdcode);
		// System.out.println(replyList);

		// 프로필 사진 없는 경우 rpprofile에 nomprofile 저장
		for (int i = 0; i < replyList.size(); i++) {
			if (replyList.get(i).getRpprofile() == null) {
				replyList.get(i).setRpprofile("nomprofile");
			}
		}

		// 줄바꿈
		for (int i = 0; i < replyList.size(); i++) {
			String rpcontents = replyList.get(i).getRpcontents().replace("<br>", "\r\n");
			rpcontents = replyList.get(i).getRpcontents().replace("&nbsp;", " ");

			// 자취방 자랑글 보기에서 댓글의 첫번째 글자가 공백인 경우 이상하게 출력되는 것을 발견하여 공백을 없애는 과정을 추가함
			String firstletter = rpcontents.substring(0, 1);

			if (firstletter.equals(" ")) {
				rpcontents = rpcontents.substring(1);
			}
			replyList.get(i).setRpcontents(rpcontents);
		}
		System.out.println("댓글목록 조회 ");
		System.out.println(replyList);

		// 댓글목록 JSON 타입으로 변환
		Gson gson = new Gson();
		String replyList_json = gson.toJson(replyList);
		System.out.println(replyList_json);

		return replyList_json;
	}

	// 게시글 댓글개수 조회(ajax)
	public int selectReplyCount_ajax(String bdcode) {
		System.out.println("BoardService.selectReplyCount_ajax() 호출");

		int replyCount = bdao.selectReplyCount_ajax(bdcode);
		System.out.println("댓글개수 : " + replyCount);

		return replyCount;
	}

	// 게시글 댓글삭제[상태변경] (ajax)
	public int updateReplyState_ajax(String rpcode) {
		System.out.println("BoardService.updateReplyState_ajax() 호출");

		int updateResult = bdao.updateReplyState_ajax(rpcode);

		return updateResult;
	}

	// 게시글 신고 유무 확인
	public String checkBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.checkBoardWarning_ajax() 호출");

		String wnCheck = "";
		String warning = bdao.checkBoardWarning_ajax(loginId, bdcode);
		if (warning != null) {
			// 이미 신고한 게시물
			wnCheck = "Yes";
		}
		return wnCheck;
	}

	// 게시글 신고 (ajax)
	public int insertBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.updateBoardWarningCount_ajax() 호출");

		int insertResult = bdao.insertBoardWarning_ajax(loginId, bdcode);
		return insertResult;
	}

	// 게시글 신고 취소(삭제)
	public int deleteBoardWarning_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.deleteBoardWarning_ajax() 호출");

		int insertResult = bdao.deleteBoardWarning_ajax(loginId, bdcode);

		return insertResult;
	}

	// 게시글 추천
	public String insertBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.insertBoardRecommend_ajax() 호출");

		String recommend = "";
		int insertResult = bdao.insertBoardRecommend_ajax(loginId, bdcode);
		if (insertResult > 0) {
			recommend = "Regist";
		}

		return recommend;
	}

	// 게시글 추천 취소 (추천 중복 클릭 시)
	public int deleteBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.deleteBoardRecommend_ajax() 호출");

		int deleteResult = bdao.deleteBoardRecommend_ajax(loginId, bdcode);

		return deleteResult;
	}

	// 게시글 추천 유무 확인
	public String checkBoardRecommend_ajax(String loginId, String bdcode) {
		System.out.println("BoardService.checkBoardRecommend_ajax() 호출");

		String rcCheck = "";
		String rcBdcode = bdao.checkBoardRecommend_ajax(loginId, bdcode);
		if (rcBdcode != null) {
			System.out.println("이미 추천한 글");
			rcCheck = "Yes";
		} else {
			rcCheck = "No";
		}
		return rcCheck;
	}

	// 게시글 추천'수' 조회
	public int selectBoardRecommendCount_ajax(String bdcode) {
		System.out.println("BoardService.selectBoardRecommendCount_ajax() 호출");

		int boardRecommendCount = bdao.selectBoardRecommendCount_ajax(bdcode);
		System.out.println("게시글 추천수 : " + boardRecommendCount);

		return boardRecommendCount;
	}

	// 게시글 삭제
	public ModelAndView updateBoardDelete(String bdcode, String bdcategory, RedirectAttributes ra) {
		System.out.println("BoardService.updateBoardDelete() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 글번호 : " + bdcode);
		System.out.println("삭제할 게시판 : " + bdcategory);

		int updateResult = bdao.updateBoardDelete(bdcode);
		if (updateResult > 0) {
			ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		}

		// 삭제 후 전체 글목록 페이지로 이동
		if (bdcategory.equals("자랑")) {
			System.out.println("자랑글 삭제 성공");
			mav.setViewName("redirect:/selectRoomList");
		} else {
			System.out.println("일반글 삭제 성공");
			ra.addAttribute("searchVal", bdcategory);
			mav.setViewName("redirect:/selectCategoryBoardList");
		} 

		return mav;
	}

	// 게시글 수정 페이지 이동 요청
	public ModelAndView loadToBoardModify(String bdcode, String bdcategory, RedirectAttributes ra) {
		System.out.println("BoardService.loadToBoardModify() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(bdcode + ", " + bdcategory);
		
		// 수정할 게시글 정보
		BoardDto board;
		if (bdcategory == null || bdcategory.equals("후기")) {
			// 일반글
			board = bdao.selectBoardView(bdcode);
		}else {
			// 자랑글(selec문 분리);
			board = bdao.selectRoomModify(bdcode);
		}
		
		
		//작성자 확인
		mav = writerChToFail(ra, board.getBdmid());
		int loginCh = (int) session.getAttribute("loginCh");
		if(loginCh == 0) {
			session.removeAttribute("loginCh");
			return mav;
		}
		session.removeAttribute("loginCh");
		
		
		//작성 페이지로 이동
		if (bdcategory == null || bdcategory.equals("후기")) {
			// 일반글
			System.out.println("일반글 수정 페이지로 이동 요청");
			String bdcontents = board.getBdcontents().replace("&nbsp;", " ");
			bdcontents = board.getBdcontents().replace("<br>", "\r\n");
			board.setBdcontents(bdcontents);
			
			if(bdcategory != null && bdcategory.equals("후기")) {
				mav.setViewName("board/ReviewBoardModifyForm");
			} else {
				mav.setViewName("board/BoardModifyForm");
			}
	
		}else {
			// 자랑글
			System.out.println("자랑글 수정 페이지로 이동 요청");
						
			//디테일 이미지가 있는 경우 이미지 이름 배열 생성
			if(board.getBddetailimg()!=null) {
				System.out.println(board.getBddetailimg());
				String[] roomdetailimgs = board.getBddetailimg().split("___");
				//System.out.println(roomdetailimgs.length);
				
				//상세 이미지 이름 배열
				mav.addObject("roomdetailimgs", roomdetailimgs);
				//상세 이미지 개수
				mav.addObject("detailCount", roomdetailimgs.length);
			}			
			mav.setViewName("board/RoomModifyForm");
		}
		
		mav.addObject("board", board);
		
		return mav;
	}

    // 게시글 수정
    public ModelAndView updateBoardModify(BoardDto board, String del_bdimg, RedirectAttributes ra)
          throws IllegalStateException, IOException {
       System.out.println("BoardService.updateBoardModify() 호출");
       ModelAndView mav = new ModelAndView();
       System.out.println(board);
       
    
    //작성자 확인
    mav = writerChToFail(ra, board.getBdmid());
    int loginCh = (int) session.getAttribute("loginCh");
    if(loginCh == 0) {
       session.removeAttribute("loginCh");
       return mav;
    }
    session.removeAttribute("loginCh");
    
    //이미지 저장 
     String bdimgfile = "";
     if (!board.getBdimgfile().isEmpty()) {// 업로드한 이미지가 있을 경우
          System.out.println("첨부파일 있음");
          // 파일 가져오기
          MultipartFile bfile = board.getBdimgfile();// 파일 자체를 가져오기

          UUID uuid = UUID.randomUUID();

          // 파일명 생성
          bdimgfile = uuid.toString() + "_" + board.getBdimgfile().getOriginalFilename();
          // 파일 저장
          // 파일저장 경로 :
          // "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board"
          bfile.transferTo(new File(boardSavePath, bdimgfile));
          
          board.setBdimg(bdimgfile);

          int updateResult = bdao.updateBoardModify(board);
          if( updateResult > 0 ) {
             ra.addFlashAttribute("msg", "글이 수정되었습니다.");
             File delFile;
             delFile =  new File(boardSavePath, del_bdimg);
             if( delFile.exists() ) {
                if( delFile.delete() ) {
                   System.out.println("파일삭제 성공");
                }else {
                   System.out.println("파일삭제 실패");
                }
                
             }else {
                System.out.println("존재하지 않는 파일입니다.");
             }
          }
          
       }else {
          System.out.println("첨부파일 없음");
          if ( del_bdimg != null) { //삭제파일 있음 
             System.out.println("삭제파일 있음");
             board.setBdimg("");
             int updateResult = bdao.updateBoardModify(board);
             if ( updateResult > 0 ) {
                File delFile;
                delFile =  new File(boardSavePath, del_bdimg);
                if( delFile.exists() ) {
                   if( delFile.delete() ) {
                      System.out.println("파일삭제 성공");
                   }else {
                      System.out.println("파일삭제 실패");
                   }
                   
                }else {
                   System.out.println("존재하지 않는 파일입니다.");
                }
                 ra.addFlashAttribute("msg", "글이 수정되었습니다.");
             }
          
       }else {//삭제파일 없음
          System.out.println("삭제파일 없음");
          int updateResult = bdao.updateBoardModify(board);
          ra.addFlashAttribute("msg", "글이 수정되었습니다.");
       }
          
       }
       
       // 글수정 후 다시 글 상세페이지로 이동
       if( board.getBdcategory().equals("후기") ) {
          mav.setViewName("redirect:/selectReviewBoardView?bdcode=" + board.getBdcode());
       }else {
          mav.setViewName("redirect:/selectBoardView?bdcode=" + board.getBdcode());
       }

       return mav;
    }
    
	// 자랑글 현재 추천,스크랩,신고 상태 조회
	public String currentRchistory(String bdcode, String history) {
		System.out.println("BoardService.currentRchistory() 호출");
		String loginId = (String) session.getAttribute("loginId");
		String currnetState = bdao.selectCurrentHisroty(bdcode, history, loginId);
		System.out.println(bdcode + "의 현재 " + history + "상태: " + currnetState);
		return currnetState;
	}

	// 글작성 페이지 이동
	public ModelAndView loadToBoardWrite(String bdcategory, String bdrgcode, String bdrgname) {
		System.out.println("BoardService.loadToBoardWrite() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("bdcategory : " + bdcategory);
		System.out.println("bdrgcode : " + bdrgcode);
		System.out.println("bdrgname : " + bdrgname);
		
		if ( bdcategory != null ) {
			mav.setViewName("board/BoardWriteForm");
		}else {
			mav.setViewName("board/Region_BoardWriteForm");
		}
		mav.addObject("bdcategory", bdcategory);
		mav.addObject("bdrgcode", bdrgcode);
		mav.addObject("bdrgname",bdrgname);
		
		return mav;
	}

	// 글작성
	public ModelAndView insertBoardWrite(BoardDto board, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("BoardService.insertBoardWrite() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("카테고리 : " + board.getBdcategory());
		
		//글작성 시 지역선택을 하지 않았을 때 -> 전국으로 설정
		if ( board.getBdrgcode() == null ) {
			board.setBdrgcode("ALL");
		}

		String bdcode = bdao.selectMaxBdcode();
		System.out.println("maxBdcode: " + bdcode);
		int bdcodeNum = Integer.parseInt(bdcode.substring(2)) + 1;
		System.out.println("bdcodeNum: " + bdcodeNum);
		if (bdcodeNum < 10) {
			bdcode = "BD0000" + bdcodeNum;
		} else if (bdcodeNum < 100) {
			bdcode = "BD000" + bdcodeNum;
		} else if (bdcodeNum < 1000) {
			bdcode = "BD00" + bdcodeNum;
		} else if (bdcodeNum < 10000) {
			bdcode = "BD0" + bdcodeNum;
		} else if (bdcodeNum < 100000) {
			bdcode = "BD" + bdcodeNum;
		}
		board.setBdcode(bdcode);

		// 이미지 저장
		String bdimgfile = "";
		if (!board.getBdimgfile().isEmpty()) {// 업로드한 이미지가 있을 경우
			System.out.println("첨부파일 있음");
			// 파일 가져오기
			MultipartFile bfile = board.getBdimgfile();// 파일 자체를 가져오기

			UUID uuid = UUID.randomUUID();

			// 파일명 생성
			bdimgfile = uuid.toString() + "_" + board.getBdimgfile().getOriginalFilename();
			// 파일 저장
			// 파일저장 경로 :
			// "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\board"
			bfile.transferTo(new File(boardSavePath, bdimgfile));

		}
		//System.out.println(bdimgfile);
		board.setBdimg(bdimgfile);
		//System.out.println(board);
		
		//글작성 - 로그인 상태 확인
		if( session.getAttribute("loginId") != null ) {
			int insertResult = bdao.insertBoard(board);
			ra.addFlashAttribute("msg", "글이 작성되었습니다");
		
			//글작성 후 글상세페이지로 이동 
			if( board.getBdcategory().equals("후기") ) {
				mav.setViewName("redirect:/selectReviewBoardView?bdcode="+bdcode);
			}else {
				mav.setViewName("redirect:/selectBoardView?bdcode="+bdcode);
			}
		}else {
			ra.addFlashAttribute("msg", "로그인 상태가 아닙니다.");
			mav.setViewName("redirect:/loadToLogin");
		}
		return mav;
	}

	// 게시글 조회수 증가
	public int updateBoardHits(String bdcode) {
		System.out.println("BoardService.updateBoardHits() 호출");

		int boardHits = bdao.updateBoardHits(bdcode);

		return boardHits;

	}

	// 댓글정보 불러오기
	public ReplyDto selectRpContents_ajax(String rpcode) {
		System.out.println("BoardService.selectRpContents_ajax() 호출");
		System.out.println("수정할 댓글번호 : " + rpcode);

		ReplyDto reply = bdao.selectRpContents_ajax(rpcode);
		reply.getRpcontents().replace("<br>", "\r\n");
		reply.setRpcontents(reply.getRpcontents().replace("<br>", "\r\n"));

		System.out.println(reply);

		return reply;
	}

	// 댓글수정
	public int updateRpcontents_ajax(String rpcode, String rpcontents) {
		System.out.println("BoardService.updateRpcontents_ajax() 호출");
		System.out.println("rpcontents : " + rpcontents);

		int updateResult = bdao.updateRpcontents_ajax(rpcode, rpcontents);

		return updateResult;
	}

	//지역게시판 이동 및 검색 
	public ModelAndView selectRegionBoardList(Paging paging) {
		System.out.println("BoardService.selectRegionBoardList() 호출");
		ModelAndView mav = new ModelAndView();
		
		//검색 키워드가 없을 경우 keyword의 값을 공백처리
		if( paging.getKeyword() == null ) {
			paging.setKeyword("");
		}
		
		//1. 전체글 수 조회
		int totalCount = bdao.selectRegionTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.calc();
		
		//지역글목록 조회 
		ArrayList<BoardDto> regionList = bdao.selectRegionBoardList_Paging(paging);
		//System.out.println(regionList);
		
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("regionList", regionList);
		mav.addObject("paging", paging);
		mav.setViewName("board/Region_BoardList");
		
		return mav;
	}
	
	//지역게시판 글정렬 (ajax)
	public String selectRegionBoardList_ajax(Paging paging) {
		System.out.println("BoardService.selectRegionBoardList_ajax() 호출");
		System.out.println("선택한 지역코드 : " + paging.getSearchVal() );
		
		//검색 키워드가 없을 경우 keyword의 값을 공백처리
		if( paging.getKeyword() == null ) {
			paging.setKeyword("");
		}
			
		int totalCount = bdao.selectRegionTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.calc();
		//System.out.println(paging);
		
		ArrayList<BoardDto> regionList = bdao.selectRegionBoardList_Paging(paging);
		//System.out.println(regionList);
		
		Gson gson = new Gson();
		if( paging.getAjaxCheck().equals("list")) {
			String selRegionList_ajax = gson.toJson(regionList);
			
			return selRegionList_ajax;
		}else {
			String paging_json = gson.toJson(paging);
			
			return paging_json;
		}
	}
	
	//지역별 게시판 이동
	public ModelAndView selectDetailBoardList(Paging paging) {
		System.out.println("BoardService.selectDetailBoardList() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("선택 지역 게시판 : " + paging.getSearchVal());
		
		if( paging.getSearchVal().equals("SEL") ) {
			paging.setBdrgname("서울");
		}else if( paging.getSearchVal().equals("ICN") ) {
			paging.setBdrgname("인천");
		}else if(paging.getSearchVal().equals("GSD") ) {
			paging.setBdrgname("경상");
		}else if(paging.getSearchVal().equals("JLD") ) {
			paging.setBdrgname("전라");
		}else if(paging.getSearchVal().equals("CCD") ) {
			paging.setBdrgname("충청");
		}else if(paging.getSearchVal().equals("GWD") ) {
			paging.setBdrgname("강원");
		}else if(paging.getSearchVal().equals("JJD") ) {
			paging.setBdrgname("제주");
		}else if(paging.getSearchVal().equals("GGD") ) {
			paging.setBdrgname("경기");
		}
		
		System.out.println("지역명: " + paging.getBdrgname());
		
		//검색 키워드가 없을 경우 keyword의 값을 공백처리
		if( paging.getKeyword() == null ) {
			paging.setKeyword("");
		}
		
		//1. 전체 글 개수 조회
		int totalCount = bdao.selectRegionTotalCount(paging);
		paging.setTotalCount(totalCount);
		paging.calc();
		System.out.println(paging);
		
		//지역별 목록 조회
		ArrayList<BoardDto> regionList = bdao.selectRegionBoardList_Paging(paging);
		ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("regionList", regionList);
		mav.addObject("paging", paging);
		
		//mav.setViewName("board/Region_"+paging.getSearchVal()+"Board");
		mav.setViewName("board/Region_DetailBoardList");
		
		return mav;
	}
	
	// 자랑글 수정
	public ModelAndView updateRoomView(BoardDto room, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("BoardService.updateRoomView() 호출");
		ModelAndView mav = new ModelAndView();

		//삭제할 파일을 모으는 배열
		ArrayList<String> deleteFile = new ArrayList<>();

		// System.out.println(room);

		// 대표이미지
		MultipartFile bdimgfile = room.getBdimgfile();

		// 대표이미지 파일 처리
		if (!bdimgfile.isEmpty()) {
			
			//기존 대표 이미지명 deleteFile에 저장
			deleteFile.add(room.getBdimg());
 			
			// 대표이미지의 파일명
			String bdimg = "";
			System.out.println("대표 이미지 변경");
			UUID uuid = UUID.randomUUID();

			// 파일명 생성
			bdimg = "M" + uuid.toString() + "_" + bdimgfile.getOriginalFilename();
			// 대표 이미지 파일 저장
			//System.out.println(roomSavePath);
			bdimgfile.transferTo(new File(roomSavePath, bdimg));

			// room에 setBdimg
			System.out.println("bdimg : " + bdimg);
			room.setBdimg(bdimg);
			
			//기존 대표이미지 이름에 del_  추가
		}

		// 상세 이미지 del_ 이 붙으면 삭제하는 파일 아니면 유지
		String[] currentDetailImg = room.getBddetailimg().split("___");
		String bddetailimg = "";
		for (int i = 0; i < currentDetailImg.length; i++) {
			System.out.println(i+"번 상세 이미지명: "+currentDetailImg[i].length());
			if(currentDetailImg[i].length() != 0) {				
				if (!currentDetailImg[i].substring(0, 4).equals("del_")) {
					System.out.println(i+"번 상세 유지: "+currentDetailImg[i]);
					//유지파일
					bddetailimg += currentDetailImg[i] + "___";
					System.out.println("bddetailimg: "+bddetailimg);
				} else {
					//삭제파일
					deleteFile.add(currentDetailImg[i].substring(4));
					System.out.println("bddetailimg: "+bddetailimg);
				}
			}
		}
		//System.out.println("bddetailimg: "+bddetailimg);
		System.out.println("deleteFile.size(): "+deleteFile.size());
		
		//추가된 상세이미지 파일 
		MultipartFile[] bddetailimgfile = room.getBddetailimgfile();
		//상세이미지 파일 처리
		//상세 이미지를 선택 안해도 배열의 크기가 1로 나와서 0번 인덱스의 filename이 있는지로 확인해야 함
		System.out.println("bddetailimgfile[0].length: "+bddetailimgfile[0].getOriginalFilename().length());

		if( bddetailimgfile[0].getOriginalFilename().length() > 0 ) {
			for(int i=0; i<bddetailimgfile.length; i++) { UUID uuid = UUID.randomUUID();
				//추가된 상세 이미지 파일명 생성 
				String bddetailimgname = uuid.toString()+"_"+bddetailimgfile[i].getOriginalFilename(); 
				//추가된 상세 이미지 파일 저장
				bddetailimgfile[i].transferTo( new File(roomSavePath, bddetailimgname) );
				//상세 이미지 컬럼에 들어갈 문자열 추가
				bddetailimg += bddetailimgname+"___"; 
				//room에 setBddetailimg System.out.println("bddetailimg : " + bddetailimg); }
			}
			
		}
		room.setBddetailimg(bddetailimg);
		System.out.println(room);
		
		int updateResult = bdao.updateRoomView(room);
		//System.out.println("updateResult: "+updateResult);
		
		if(updateResult==0) {
			System.out.println("글 수정 실패");
			ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
			mav.setViewName("redirect:/loadToFail");
			return mav;
		} else {			
			System.out.println("글 수정 성공");

			//기존 파일 삭제
			File delFile;
			for(int i=0; i<deleteFile.size(); i++) {
				System.out.println(deleteFile.get(i));
				delFile = new File(roomSavePath, deleteFile.get(i)) ;
				if(delFile.exists()) { //해당 파일 있는지 확인 후
					System.out.println(deleteFile.get(i)+"파일 삭제");
					delFile.delete(); //삭제
				}
				
			}
			
			ra.addFlashAttribute("msg", "수정에 성공하였습니다.");
			mav.setViewName("redirect:/selectRoomList?bdcode="+room.getBdcode());
		}
		
		return mav;

	}

	//자랑글 정렬 요청(글목록)
	public String selectRoomList_ajax(Paging paging) {
		System.out.println("BoardnService.selectRoomList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = bdao.selectRoomTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		//System.out.println(totalCount);
		
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<BoardDto> roomList =bdao.selectRoomList_paging(paging);
		for (int i = 0; i < roomList.size(); i++) {
			System.out.println(roomList.get(i).getBdcode()+" "+roomList.get(i).getBdhits()+" "+roomList.get(i).getBdreply()+" "+roomList.get(i).getBdrecommend()+" "+roomList.get(i).getBdscrap());
		}
		/*
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // boardList ajax일 경우
			String boardList_json = gson.toJson(boardList); 
			return boardList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}*/
		return null;
	}

	//자랑글 정렬 요청(paging)
	public String selectRoomPaging_ajax(Paging paging) {
		System.out.println("BoardnService.selectRoomPaging_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = bdao.selectRoomTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		System.out.println(totalCount);
		
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		return null;
		
	}
	
	

}




