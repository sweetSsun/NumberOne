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
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.PageDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.dto.UsedBoardDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	private ModelAndView mav;
	private Gson gson;

	@Autowired
	private AdminDao adao;
	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	// 파일 저장 경로
	String nbImgSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\noticeUpLoad";
	
	/* 관리자 로그인 확인 (파라미터: ra/리턴: mav) */
	public ModelAndView loginAdminChToFail(RedirectAttributes ra) {
	    mav = new ModelAndView();
	    String loginId = (String) session.getAttribute("loginId");
	      
	    if(loginId == null || loginId != "admin"){
	       //비로그인이거나, 관리자가 아닌 경우
		    System.out.println("관리자 아님");
	        //메세지 전송
	        ra.addFlashAttribute("msg", "관리자 로그인 후 이용가능합니다");
	        //실패페이지로 이동(msg alert 띄우고, history back)
	        mav.setViewName("redirect:/loadToLogin");
	    }
        return mav;
    }
	
	/* 회원 관리 */
	// 회원 관리페이지 이동
	public ModelAndView admin_selectMemberList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectMemberList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		// 페이징
		if(paging.getKeyword() == null) { // dao 조건문이 keyword에 null값이 들어가면 오류가 나기 때문에 ""로 변경
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectMemberTotalCount(paging); // 전체 회원수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println(paging);
		
		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(paging);
		System.out.println(memberList);
		
		mav.addObject("memberList", memberList);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_MemberList");
		return mav;
	}
	
	// 선택한 상태값에 따른 회원목록 ajax
	public String admin_selectMemberList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectMemberList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		
		int totalCount = adao.admin_selectMemberTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(paging);
		System.out.println("memberList : " + memberList);
		
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // memberList ajax일 경우
			String memberList_json = gson.toJson(memberList);
			return memberList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}

	// 회원상태 변경 ajax
	public String admin_updateMstate_ajax(String mid, int mstate) {
		System.out.println("AdminService.admin_updateMstate_ajax() 호출");
		System.out.println("상태변경할 mid : " + mid);
		System.out.println("상태변경할 mstate : " + mstate);
		int updateResult = adao.admin_updateMstate_ajax(mid, mstate);
		String memberInfo_json = "";
		if(updateResult > 0) {
			// 버튼 css변경을 위해 회원상태 조회
			memberInfo_json = admin_selectMemberInfo_ajax(mid);
		}
		return memberInfo_json;
	}
	
	// 회원 상세정보 조회 ajax
	public String admin_selectMemberInfo_ajax(String mid) {
		System.out.println("AdminService_admin_selectMemberInfo_ajax() 호출");
		MemberDto memberInfo = adao.admin_selectMemberInfo_ajax(mid);
		System.out.println(memberInfo);
		if (memberInfo.getMaddr() != null) {
			String maadr_replace = memberInfo.getMaddr().replace("_", " ");
			memberInfo.setMaddr(maadr_replace);
		}
		gson = new Gson();
		String memberInfo_json = gson.toJson(memberInfo);
		return memberInfo_json;
	}
	
	/* 공지 관리*/
	// 공지 관리페이지 이동
	public ModelAndView admin_selectNoticeList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectNoticeList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}

		// 페이징
		if(paging.getKeyword() == null) { // dao 조건문이 keyword에 null값이 들어가면 오류가 나기 때문에 ""로 변경
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectNoticeTotalCount(paging); // 전체 공지수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println(paging);
		
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(paging);
		System.out.println(noticeList);
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_NoticeList");
		return mav;
	}

	// 선택한 상태값에 따른 공지목록 ajax
	public String admin_selectNoticeList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectNoticeList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		
		int totalCount = adao.admin_selectNoticeTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(paging);
		System.out.println("noticeList : " + noticeList);
		
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // memberList ajax일 경우
			String noticeList_json = gson.toJson(noticeList);
			return noticeList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}

	// 공지상태 변경
	public int admin_updateNbstate_ajax(String nbcode, int nbstate) {
		System.out.println("AdminService.admin_updateNbstate_ajax() 호출");
		System.out.println("상태변경할 nbcode : " + nbcode);
		System.out.println("상태변경할 nbstate : " + nbstate);
		int updateResult = adao.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}

	// 공지상태 변경_공지글 삭제
	public ModelAndView admin_updateNbstate(String nbcode, int nbstate, RedirectAttributes ra) {
		System.out.println("AdminService.admin_updateNbstate() 호출");
		System.out.println("상태변경할 nbcode : " + nbcode);
		System.out.println("상태변경할 nbstate : " + nbstate);
		mav = new ModelAndView();
		int updateResult = adao.admin_updateNbstate_ajax(nbcode, nbstate);
		if (updateResult > 0) {
			ra.addFlashAttribute("msg", nbcode+" 공지가 비활성화 처리 되었습니다.");
			mav.setViewName("redirect:/admin_selectNoticeList?searchVal=all&searchType=&keyword=&page=1");
		}
		return mav;
	}

	// 고정공지 변경
	public int admin_updateNbfix_ajax(String nbcode, int nbfix) {
		System.out.println("AdminService.admin_updateNbfix_ajax() 호출");
		System.out.println("변경할 nbcode : " + nbcode);
		System.out.println("변경할 nbfix : " + nbfix);
		int updateResult = adao.admin_updateNbfix_ajax(nbcode, nbfix);
		return updateResult;
	}
	
	//공지 상세페이지 이동 
	public ModelAndView admin_selectNoticeBoardView(String nbcode,  Paging paging) {
		System.out.println("AdminService.admin_selectNoticeBoardView() 호출");
		System.out.println("nbcode:" +  nbcode);
		System.out.println("paging : " + paging);
		
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		

		
		System.out.println(noticeBoard);
		mav = new ModelAndView();
		mav.addObject("noticeBoard", noticeBoard);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_NoticeBoardView");
		
		return mav;
	}

	// 공지 작성페이지 이동
	public ModelAndView admin_loadToNoticeWrite(RedirectAttributes ra) {
		System.out.println("AdminService.admin_loadToNoticeWrite() 호출");
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		mav.setViewName("admin/Admin_NoticeWriteForm");
		
		return mav;
	}

	// 작성 공지 DB에 입력
	public ModelAndView admin_insertNoticeWrite(NoticeDto notice, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.admin_insertNoticeWrite() 호출");
		notice.setNbmid( (String) session.getAttribute("loginId")); // 세션id set
		
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		// nbcode 생성
		String maxNbcode = adao.admin_selectMaxNbcode();
		int nbcodeNum = Integer.parseInt(maxNbcode.substring(3)) + 1;
//		System.out.println("nbcodeNum: "+nbcodeNum);
		String nbcode;
		if(nbcodeNum<10) {
			nbcode = "NB0000"+nbcodeNum;
		} else if(nbcodeNum<100) {
			nbcode = "NB000"+nbcodeNum;
		} else if(nbcodeNum<1000) {
			nbcode = "NB00"+nbcodeNum;
		} else if(nbcodeNum<10000) {
			nbcode = "NB0"+nbcodeNum;
		} else {
			nbcode = "NB"+nbcodeNum;
		} 
//		System.out.println("nbcode: "+nbcode);
		notice.setNbcode(nbcode); // 생성한 nbcode set
		
		// 파일 등록
		MultipartFile nbimgfile = notice.getNbimgfile();
		String nbimg = ""; // 파일명 저장할 변수명
		if(!nbimgfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			nbimg = uuid.toString() + "_" + nbimgfile.getOriginalFilename();
			nbimgfile.transferTo( new File(nbImgSavePath, nbimg) );
		}
		notice.setNbimg(nbimg); // 생성한 파일명 set

		// INSERT
		System.out.println(notice);
		int insertresult =  adao.admin_insertNoticeWrite(notice);
		
		if(insertresult > 0) {
			ra.addFlashAttribute("msg", nbcode+" 공지가 작성되었습니다.");
			ra.addAttribute("codeIdx", nbcode);
			mav.setViewName("redirect:/admin_selectNoticeBoardView");
		} else {
			ra.addFlashAttribute("msg", "공지 작성에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}

		return mav;
	}

	// 공지 수정페이지 이동
	public ModelAndView admin_selectNoticeModify(String nbcode, Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectNoticeModify() 호출");
		System.out.println("nbcode : " + nbcode);
		System.out.println("paging : " + paging);
		
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		System.out.println(noticeBoard);
        
		mav.addObject("noticeBoard", noticeBoard);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_NoticeModifyForm");
		
		return mav;
	}
	
	// 수정 공지 DB에 입력
	public ModelAndView admin_updateNoticeModify(NoticeDto modiNotice, Paging paging, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.admin_updateNoticeModify() 호출");
		System.out.println("originImg : " + modiNotice.getOriginImg());
		System.out.println("paging : " + paging);

		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
				
		// 파일 등록
		MultipartFile nbimgfile = modiNotice.getNbimgfile();
		String nbimg = ""; // 파일명 저장할 변수명
		if(!nbimgfile.isEmpty()) { // 파일 수정
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			nbimg = uuid.toString() + "_" + nbimgfile.getOriginalFilename();
			nbimgfile.transferTo( new File(nbImgSavePath, nbimg) );
			modiNotice.setNbimg(nbimg); // 생성한 파일명 set
		} else { // 파일 수정 X
			if(modiNotice.getOriginImg().length() > 0) { // 기존 첨부파일이 있으면
				modiNotice.setNbimg(modiNotice.getOriginImg());
			} else { // 기존 첨부파일이 없으면
				modiNotice.setNbimg(nbimg); // 생성한 파일명 set
			}
		}
		
		// UPDATE
		System.out.println(modiNotice);
		int updateresult =  adao.admin_updateNoticeModify(modiNotice);
		
		if(updateresult > 0) {
			if(!nbimgfile.isEmpty() && modiNotice.getOriginImg().length() > 0) { // 파일을 수정하고 기존 첨부파일이 있었으면
					File delFile = new File(nbImgSavePath, modiNotice.getOriginImg());
					delFile.delete();
			}
			ra.addFlashAttribute("msg", modiNotice.getNbcode()+ " 공지가 수정되었습니다.");
			mav.setViewName("redirect:/admin_selectNoticeBoardView"+paging.makeQueryPage(modiNotice.getNbcode(), paging.getPage()));
		} else {
			ra.addFlashAttribute("msg", "공지 수정에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}
		return mav;
	}
	
	/* 중고거래 관리 */
	// 중고거래 관리페이지 이동
	public ModelAndView admin_selectResellList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectResellList() 호출");
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
			
		if(paging.getKeyword() == null) {
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectResellTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println(paging);
		ArrayList<UsedBoardDto> usedBoardList = adao.admin_selectResellList(paging);
		System.out.println("boardList : " + usedBoardList);
		mav.addObject("paging", paging);
		mav.addObject("usedBoardList", usedBoardList);
			
		mav.setViewName("admin/Admin_ResellList");
		return mav;
	}
	
	// 선택한 상태값에 따른 커뮤니티 목록 ajax
	public String admin_selectResellList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectResellList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = adao.admin_selectResellTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<UsedBoardDto> usedBoardList = adao.admin_selectResellList(paging);
		System.out.println("usedBoardLis : " + usedBoardList);
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // usedBoardLis ajax일 경우
			String usedBoardList_json = gson.toJson(usedBoardList); 
			return usedBoardList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}	

	// 중고거래 글상태 변경 요청
	public int admin_updateUbstate_ajax(String ubcode, int ubstate) {
		System.out.println("AdminService.admin_updateUbstate_ajax() 호출");
		System.out.println("상태변경할 ubcode : " + ubcode);
		System.out.println("상태변경할 ubstate : " + ubstate);
		int updateResult = adao.admin_updateUbstate_ajax(ubcode, ubstate);
		return updateResult;
	}
	
	
	/* 커뮤니티 관리 */
	/* 경고/정지 관리 */
	// 경고/정지 관리페이지 이동
	public ModelAndView admin_selectBoardList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectBoardList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		if(paging.getKeyword() == null) {
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectBoardTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		
		System.out.println(paging);
		ArrayList<BoardDto> boardList = adao.admin_selectBoardList(paging);
		System.out.println("boardList : " + boardList);
		mav.addObject("paging", paging);
		mav.addObject("boardList", boardList);
		mav.setViewName("admin/Admin_BoardList");
		return mav;
	}

	// 경고/정지 글 상태 변경 요청
	public int admin_updateBdstate_ajax(String bdcode, int bdstate) {
		System.out.println("AdminService.admin_updateBdstate_ajax() 호출");
		System.out.println("상태변경할 bdcode : " + bdcode);
		System.out.println("상태변경할 bdstate : " + bdstate);
		int updateResult = adao.admin_updateBdstate_ajax(bdcode, bdstate);
		return updateResult;
	}

	// 선택한 상태값에 따른 커뮤니티 목록 ajax
	public String admin_selectBoardList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectBoardList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = adao.admin_selectBoardTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<BoardDto> boardList = adao.admin_selectBoardList(paging);
		System.out.println("boardList : " + boardList);
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // boardList ajax일 경우
			String boardList_json = gson.toJson(boardList); 
			return boardList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}	
	
	// 경고/정지 후기 상세페이지 이동 
	public ModelAndView admin_selectReviewBoardView(Paging paging, String codeIdx, String check) {
		System.out.println("AdminService.admin_selectReviewBoardView() 호출");
		mav = new ModelAndView();
		System.out.println("bdcode : " + codeIdx);
		System.out.println("check : " + check);
		
		//글상세정보 조회 
		BoardDto board = bdao.selectBoardView(codeIdx);
		System.out.println(board);
		
		mav.addObject("board", board);
		mav.setViewName("admin/Admin_ReviewBoardView");
		
		return mav;
	}
	
	// 경고/정지 상세페이지 이동 
	public ModelAndView admin_selectBoardView(Paging paging, String codeIdx, String check) {
		System.out.println("AdminService.admin_selectBoardView() 호출");
		mav = new ModelAndView();
		System.out.println("bdcode : " + codeIdx);
		System.out.println("check : " + check);
		
		//글상세정보 조회 
		BoardDto board = bdao.selectBoardView(codeIdx);
		System.out.println(board);
		
		mav.addObject("board", board);
		mav.setViewName("admin/Admin_BoardView");
		
		return mav;
	}
	
	/* 배너 관리 */
	// 배너 관리페이지 이동
	public ModelAndView admin_selectBdfixList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectBdfixList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		if(paging.getKeyword() == null) {
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectBdfixTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		
		System.out.println(paging);
		ArrayList<BoardDto> bdfixList = adao.admin_selectBdfixList(paging);
		System.out.println("bdfixList : " + bdfixList);
		mav.addObject("paging", paging);
		mav.addObject("bdfixList", bdfixList);
		mav.setViewName("admin/Admin_BdfixList");
		return mav;
	}
	
	// 선택한 상태값에 따른 배너관리 목록 ajax
	public String admin_selectBdfixList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectBdfixList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = adao.admin_selectBdfixTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<BoardDto> bdfixList = adao.admin_selectBdfixList(paging);
		System.out.println("bdfixList : " + bdfixList);
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // boardList ajax일 경우
			String bdfixList_json = gson.toJson(bdfixList); 
			return bdfixList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}	

	// 배너 고정상태 변경 요청
	public int admin_updateBdfix_ajax(String bdcode, int bdfix) {
		System.out.println("AdminService.admin_updateBdstate_ajax() 호출");
		System.out.println("배너 고정할 bdcode : " + bdcode);
		System.out.println("배너 고정할 bdfix : " + bdfix);
		int updateResult = adao.admin_updateBdfix_ajax(bdcode, bdfix);
		return updateResult;
	}

	/* 댓글 관리 */
	// 댓글 관리페이지 이동
	public ModelAndView admin_selectReplyList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectReplyList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		if(paging.getKeyword() == null) {
			paging.setKeyword("");
		}
		int totalCount = adao.admin_selectReplyTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println(paging);
		
		ArrayList<ReplyDto> replyList = adao.admin_selectReplyList(paging);
		System.out.println("replyList : " + replyList);
		mav.addObject("paging", paging);
		mav.addObject("replyList", replyList);
		mav.setViewName("admin/Admin_ReplyList");
		return mav;
	}
	
	// 선택한 상태값에 따른 댓글 목록 ajax
	public String admin_selectReplyList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectReplyList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = adao.admin_selectReplyTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<ReplyDto> replyList = adao.admin_selectReplyList(paging);
		System.out.println("replyList : " + replyList);
		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // replyList ajax일 경우
			String replyList_json = gson.toJson(replyList); 
			return replyList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}

	// 댓글 상태 변경 요청
	public int admin_updateRpstate_ajax(String rpcode, int rpstate) {
		System.out.println("AdminService.admin_updateRpstate_ajax() 호출");
		System.out.println("상태변경할 rpcode : " + rpcode);
		System.out.println("상태변경할 rpstate : " + rpstate);
		int updateResult = adao.admin_updateRpstate_ajax(rpcode, rpstate);
		return updateResult;
	}
	
	/* 문의 관리 */
	// 문의 관리페이지 이동 요청
	public ModelAndView admin_selectQuestionList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectQuestionList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName().equals("redirect:/loadToLogin")) {
		   return mav;
		}
		
		int totalCount = adao.admin_selectContactTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println(paging);
		
		ArrayList<ContactDto> contactList = adao.admin_selectContactList(paging);
		System.out.println("contactList : " + contactList);
		mav.addObject("paging", paging);
		mav.addObject("contactList", contactList);
		
		mav.setViewName("admin/Admin_QuestionList");
		return mav;
	}

	// 문의 관리페이지 정렬 요청
	public String admin_selectQuestionList_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectQuestionList_ajax() 호출");
		System.out.println("searchVal : " + paging.getSearchVal());
		int totalCount = adao.admin_selectContactTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		
		ArrayList<ContactDto> contactList = adao.admin_selectContactList(paging);
		System.out.println("contactList : " + contactList);
		gson = new Gson();
		
		if (paging.getAjaxCheck().equals("list")) {
			String contactList_json = gson.toJson(contactList); 
			return contactList_json;
		} else {
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}

	// 문의 답변 입력 요청
	public int admin_updateQuestionAns_ajax(String ctcode, String ctans) {
		System.out.println("AdminService.admin_updateQuestionAns_ajax() 호출");
		System.out.println("ctcode : " + ctcode);
		System.out.println("ctans : " + ctans);
		int updateResult = adao.admin_updateQuestionAns_ajax(ctcode, ctans);
		return updateResult;
	}

	/* 게시글/댓글 정지 */
	// 일반게시글 정지
	public ModelAndView admin_updateBoardStop(String bdcode, Paging paging, String check, RedirectAttributes ra) {
		System.out.println("AdminService.admin_updateBoardStop() 호출");
		System.out.println("bdcode : " + bdcode);
		System.out.println("check : " + check);
		mav = new ModelAndView();
		int updateResult = adao.admin_updateBoardStop(bdcode);
		if (updateResult > 0) {
			ra.addFlashAttribute("msg", bdcode + " 글이 정지 처리되었습니다.");
			if(check == null) {
				mav.setViewName("redirect:/selectBoardList");
			} else {
				mav.setViewName("redirect:/admin_selectBoardList");
			}
		}
		return mav;
	}

	//자랑글 정지
	public int admin_updateRoomStop_ajax(String bdcode) {
		System.out.println("AdminService.admin_updateRoomStop_ajax() 호출");
		System.out.println("bdcode : " + bdcode);
		int updateResult = adao.admin_updateBoardStop(bdcode);
		return updateResult;
		// 스크립트단에서 updateResult > 0 이면 "정지처리되었습니다" 모달 띄우고, 정지버튼 d_none
		// 가능하면 자랑목록페이지 새로 받아오고, 보던 스크롤 위치로 이동하고 싶다
	}
	
	//중고거래 글 정지
	public ModelAndView admin_updateResellStop(UsedBoardDto ubDto, Paging paging, String check, RedirectAttributes ra) {
		System.out.println("AdminService.admin_updateResellStop() 호출");
		System.out.println("ubcode : " + ubDto.getUbcode());
		System.out.println("check : " + check);
		mav = new ModelAndView();
		int updateResult = adao.admin_updateResellStop(ubDto.getUbcode());
		if (updateResult > 0) {
			ra.addFlashAttribute("msg", ubDto.getUbcode() + " 글이 정지 처리되었습니다.");
			if(check == null) {
				if (ubDto.getUbsellbuy().equals("B")) {
					mav.setViewName("redirect:/selectResellPageList?sellBuy=B");
				} else {
					mav.setViewName("redirect:/selectResellPageList?sellBuy=S");
				}
			} else {
				mav.setViewName("redirect:/admin_selectResellList");
			}
		}
		return mav;
	}

	// 댓글 정지
	public int admin_updateReplyStop_ajax(String rpcode) {
		System.out.println("AdminService.admin_updateReplyStop_ajax() 호출");
		System.out.println("rpcode : " + rpcode);
		int updateResult = adao.admin_updateReplyStop(rpcode);
		return updateResult;
		// 호출한 ajax success에서
		// updateResult > 0 이면 댓글 목록 새로 출력하는 ajax 실행하기
	}

	

}
