package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

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
	private String roomSavePath = "D:\\numberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\room";
	
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
		System.out.println("bdcode: "+bdcode);
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
			bdimgfile.transferTo(  new File(roomSavePath, bdimg)   );
			
			//room에 setBdimg 
			System.out.println("bdimg : " + bdimg);
			room.setBdimg(bdimg);
		} 
		
		
		//상세이미지 파일
		MultipartFile[] bddetailimgfile = room.getBddetailimgfile();
		//상세이미지의 파일명(최대 5개)
		String bddetailimg = "";
		//상세이미지 파일 처리
		System.out.println("상세이미지개수: "+bddetailimgfile.length);
		
		if( bddetailimgfile.length > 0 ) {
			
			for(int i=0; i<bddetailimgfile.length; i++) {
				UUID uuid = UUID.randomUUID();
				//파일명 생성
				String bddetailimgname = uuid.toString()+bddetailimgfile[i].getOriginalFilename();
				//상세 이미지 파일 저장
				bddetailimgfile[i].transferTo(  new File(roomSavePath, bddetailimgname)   );
				bddetailimg += "___"+bddetailimgname;
			}
			
			//room에 setBddetailimg 
			System.out.println("bddetailimg : " + bddetailimg);
			room.setBddetailimg(bddetailimg);
		} 

		//로그인 기능 없어서 id는 nhd로 함
		room.setBdmid("nhd");
		
		//카테고리 -- 자랑
		room.setBdcategory("자랑");
		
		//System.out.println(room);
		//자취방자랑 글 등록 (dao  - insert문)
		int insertResult = bdao.insertRoomWrite(room);
		
		if(insertResult>0) {
			System.out.println("등록 성공!");
			ra.addFlashAttribute("msg", "자취방 자랑글이 등록되었습니다.");
			//메인페이지로 돌아가기	>> 자랑글 메인으로 수정 해야 함	
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
	      
	      //일반게시판 글목록 조회 
	      ArrayList<BoardDto> boardList = bdao.selectBoardList();
	      System.out.println(boardList);
	      
	      //공지게시판 글목록 조회 
	      ArrayList<NoticeDto> noticeList = bdao.selectNoticeList();
	      System.out.println(noticeList);
	      
	      mav.addObject("boardList", boardList);
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
	    ArrayList<BoardDto> roomList = bdao.selectRoomList("자랑");	
	    System.out.println("자취방 자랑글 개수: "+roomList.size());
	    
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
		
		BoardDto board = bdao.selectBoardView(bdcode);
		
		mav.addObject("board", board);
		mav.setViewName("board/BoardView");
		
		return mav;
	}
	

}
