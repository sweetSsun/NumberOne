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
	
	// 페이징 관련 필드
	int viewCount = 20; // 한 페이지에 보여줄 갯수
	int pageNumCount = 5; // 한 페이지에 보여줄 페이징 갯수
	
	/* 회원 관리 */
	// 회원 관리페이지 이동
	public ModelAndView admin_selectMemberList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectMemberList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
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
//	public ModelAndView admin_selectMemberList(int page, RedirectAttributes ra) {
//		System.out.println("AdminService.admin_selectMemberList() 호출");
//		mav = new ModelAndView();
//		// 관리자 로그인 여부 체크
//		String loginId = (String)session.getAttribute("loginId");
//		if (loginId == null) {
//			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
//			mav.setViewName("redirect:/loadToLogin");	
//			return mav;
//		}
//		
//		String searchVal = "all";
//		// 페이징
//		System.out.println("요청 페이지 : " + page);
//		int memberTotalCount = adao.admin_selectMemberTotalCount(searchVal); // 전체 회원수 조회
//		int startRow = (page-1) * viewCount + 1;
//		int endRow = page * viewCount;
//		
//		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(searchVal, startRow, endRow);
//		System.out.println(memberList);
//		
//		// 페이지에서 출력할 페이지번호 생성
//		PageDto paging = new PageDto();
//		// 글 최대값에 따라 페이지 번호 최대값
//		int maxPage = (int) (Math.ceil( (double)memberTotalCount/viewCount ) );
//		// 출력될 페이지 번호 시작값
//		int startPage = (int) ( (Math.ceil( (double)page/pageNumCount )) -1 ) * pageNumCount + 1;
//		// 출력될 페이지 번호 마지막값
//		int endPage = startPage + pageNumCount - 1; 			
//		if(endPage > maxPage) { 	
//			endPage = maxPage;
//		}			
//		paging.setPage(page);
//		paging.setMaxPage(maxPage);
//		paging.setStartPage(startPage);
//		paging.setEndPage(endPage);
//		
//		mav.addObject("memberList", memberList);
//		mav.addObject("paging", paging);
//		mav.setViewName("admin/Admin_MemberList");
//		return mav;
//	}
	
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
		String memberList_json = gson.toJson(memberList);
		System.out.println("memberList_json : " + memberList_json);
		return memberList_json;
	}
	// 선택한 상태값에 따른 회원목록 ajax
//	public String admin_selectMemberList_ajax(String searchVal, int page) {
//		System.out.println("AdminService.admin_selectMemberList_ajax() 호출");
//		mav = new ModelAndView();
//		System.out.println("searchVal : " + searchVal);
//		System.out.println("요청 페이지 : " + page);
//
//		int startRow = (page-1) * viewCount + 1;
//		int endRow = page * viewCount;
//		
//		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(searchVal, startRow, endRow);
//		System.out.println(memberList);
//		
//		gson = new Gson();
//		String memberList_ajax = gson.toJson(memberList);
//		System.out.println("memberList_ajax : " + memberList_ajax);
//		return memberList_ajax;
//	}
	
	// 회원목록 ajax 페이징 넘버 조회
	public String admin_selectMemberPagingNumber_ajax(Paging paging) {
		System.out.println("AdminServiceadmin.admin_selectMemberPagingNumber_ajax() 호출");
		
		int totalCount = adao.admin_selectMemberTotalCount(paging); // 전체 회원수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		
		gson = new Gson();
		String paging_json = gson.toJson(paging);
		System.out.println(paging_json);
		return paging_json;
	}
	// 회원목록 ajax 페이징 넘버 조회
//	public String admin_selectMemberPagingNumber_ajax(String searchVal, int page) {
//		System.out.println("AdminServiceadmin.admin_selectMemberPagingNumber_ajax() 호출");
//		
//		int memberTotalCount = adao.admin_selectMemberTotalCount(searchVal); // 전체 회원수 조회
//		// 페이지에서 출력할 페이지번호 생성
//		PageDto paging = new PageDto();
//		// 글 최대값에 따라 페이지 번호 최대값
//		int maxPage = (int) (Math.ceil( (double)memberTotalCount/viewCount ) );
//		// 출력될 페이지 번호 시작값
//		int startPage = (int) ( (Math.ceil( (double)page/pageNumCount )) -1 ) * pageNumCount + 1;
//		// 출력될 페이지 번호 마지막값
//		int endPage = startPage + pageNumCount - 1; 			
//		if(endPage > maxPage) { 	
//			endPage = maxPage;
//		}			
//		paging.setPage(page);
//		paging.setMaxPage(maxPage);
//		paging.setStartPage(startPage);
//		paging.setEndPage(endPage);
//		
//		gson = new Gson();
//		String paging_json = gson.toJson(paging);
//		System.out.println(paging_json);
//		return paging_json;
//	}

	// 회원상태 변경 ajax
	public String admin_updateMstate_ajax(String mid, String mstate) {
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
		String maadr_replace = memberInfo.getMaddr().replace("_", " ");
		memberInfo.setMaddr(maadr_replace);
		gson = new Gson();
		String memberInfo_json = gson.toJson(memberInfo);
		return memberInfo_json;
	}
	
	/* 공지 관리*/
	// 공지 관리페이지 이동
	public ModelAndView admin_selectNoticeList(String searchVal, String searchType, String keyword, int page, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectNoticeList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
			return mav;
		}
		
		System.out.println("정렬 val : " + searchVal);
		System.out.println("검색 type : " + searchType);
		System.out.println("검색 keyword : " + keyword);
		
		// 페이징
		if (page < 0) {
			page = 1;
		}
		System.out.println("이동요청 페이지 : " + page);
		int noticeTotalCount = adao.admin_selectNoticeTotalCount(searchVal, searchType, keyword); // 전체 공지수 조회
		System.out.println("공지총갯수 : " + noticeTotalCount);
		int startRow = (page-1) * viewCount + 1;
		int endRow = page * viewCount;
		
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(searchVal, searchType, keyword, startRow, endRow);
		System.out.println(noticeList);
		
		// 페이지에서 출력할 페이지번호 생성
		PageDto paging = new PageDto();
		// 글 최대값에 따라 페이지 번호 최대값
		int maxPage = (int) (Math.ceil( (double)noticeTotalCount/viewCount ) );
		// 출력될 페이지 번호 시작값
		int startPage = (int) ( (Math.ceil( (double)page/pageNumCount )) -1 ) * pageNumCount + 1;
		// 출력될 페이지 번호 마지막값
		int endPage = startPage + pageNumCount - 1; 			
		if(endPage > maxPage) { 	
			endPage = maxPage;
		}			
		paging.setPage(page);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);

		mav.addObject("paging", paging);
		mav.addObject("noticeList", noticeList);
		mav.addObject("searchVal", searchVal);
		mav.addObject("searchText", keyword);
		mav.addObject("searchType", searchType);
		mav.setViewName("admin/Admin_NoticeList");
		return mav;
	}

	// 선택한 상태값에 따른 공지목록 ajax
	public String admin_selectNoticeList_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("AdminService.admin_selectNoticeList_ajax() 호출");
		System.out.println("정렬 val : " + searchVal);
		System.out.println("검색 type : " + searchType);
		System.out.println("검색 keyword : " + keyword);
		System.out.println("요청 페이지 : " + page);

		int startRow = (page-1) * viewCount + 1;
		int endRow = page * viewCount;
		
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(searchVal, searchType, keyword, startRow, endRow);
		System.out.println(noticeList);
		System.out.println("noticeList.size() : " + noticeList.size());
		gson = new Gson();
		String noticeList_json = gson.toJson(noticeList);
		return noticeList_json;
	}
	
	// 공지목록 ajax 페이징 넘버 조회
	public String admin_selectNoticePagingNumber_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("AdminService.admin_selectNoticePagingNumber_ajax() 호출");
		
		int noticeTotalCount = adao.admin_selectNoticeTotalCount(searchVal, searchType, keyword); // 전체 회원수 조회
		
		// 페이지에서 출력할 페이지번호 생성
		PageDto paging = new PageDto();
		// 글 최대값에 따라 페이지 번호 최대값
		int maxPage = (int) (Math.ceil( (double)noticeTotalCount/viewCount ) );
		// 출력될 페이지 번호 시작값
		int startPage = (int) ( (Math.ceil( (double)page/pageNumCount )) -1 ) * pageNumCount + 1;
		// 출력될 페이지 번호 마지막값
		int endPage = startPage + pageNumCount - 1; 			
		if(endPage > maxPage) { 	
			endPage = maxPage;
		}			
		paging.setPage(page);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		gson = new Gson();
		String paging_json = gson.toJson(paging);
		System.out.println(paging_json);
		return paging_json;
	}

	// 공지상태 변경
	public int admin_updateNbstate_ajax(String nbcode, String nbstate) {
		System.out.println("AdminService.admin_updateNbstate_ajax() 호출");
		System.out.println("상태변경할 nbcode : " + nbcode);
		System.out.println("상태변경할 nbstate : " + nbstate);
		int updateResult = adao.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}

	// 공지상태 변경_공지글 삭제
	public ModelAndView admin_updateNbstate(String nbcode, String nbstate, RedirectAttributes ra) {
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
	
	//공지 상세페이지 이동 
	public ModelAndView admin_selectNoticeBoardView(String nbcode) {
		System.out.println("AdminService.admin_selectNoticeBoardView() 호출");
		System.out.println("nbcode:" +  nbcode);
		
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		System.out.println(noticeBoard);
		mav = new ModelAndView();
		mav.addObject("noticeBoard", noticeBoard);
		mav.setViewName("admin/Admin_NoticeBoardView");
		
		return mav;
	}

	// 공지 작성페이지 이동
	public ModelAndView admin_loadToNoticeWrite(RedirectAttributes ra) {
		System.out.println("AdminService.admin_loadToNoticeWrite() 호출");
		
		// 닉네임 찾기
		String mid = (String) session.getAttribute("loginId");
		mav = new ModelAndView();
			
		if(mid == null) {
			System.out.println("비로그인 상태!");
			ra.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
			//로그인 폼으로 돌아가기
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		} else {
			String mnickname = bdao.selectRoomWriterMnickname(mid);
			mav.addObject("mnickname", mnickname);
			mav.setViewName("admin/Admin_NoticeWriteForm");
		}
		return mav;
	}

	// 작성 공지 DB에 입력
	public ModelAndView admin_insertNoticeWrite(NoticeDto notice, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.admin_insertNoticeWrite() 호출");
		notice.setNbmid( (String) session.getAttribute("loginId")); // 세션id set
		
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
		
		mav = new ModelAndView();
		if(insertresult > 0) {
			ra.addFlashAttribute("msg", nbcode+" 공지가 작성되었습니다.");
			mav.setViewName("redirect:/admin_selectNoticeBoardView?nbcode="+nbcode);
		} else {
			ra.addFlashAttribute("msg", "공지 작성에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}
		return mav;
	}

	// 공지 수정페이지 이동
	public ModelAndView admin_selectNoticeModify(String nbcode) {
		System.out.println("AdminService.admin_selectNoticeModify() 호출");
		System.out.println("nbcode : " + nbcode);
		mav = new ModelAndView();
		
		String mnickname = bdao.selectRoomWriterMnickname( (String)session.getAttribute("loginId") );
		mav.addObject("mnickname", mnickname);
		
		NoticeDto noticeBoard = bdao.selectNoticeBoardView(nbcode);
		System.out.println(noticeBoard);
		mav.addObject("noticeBoard", noticeBoard);
		mav.setViewName("admin/Admin_NoticeModifyForm");
		
		return mav;
	}
	
	// 작성 공지 DB에 입력
	public ModelAndView admin_updateNoticeModify(NoticeDto modiNotice, String originImg, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.admin_updateNoticeModify() 호출");
		System.out.println("originImg : " + originImg);
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
			if(originImg.length() > 0) { // 기존 첨부파일이 있으면
				modiNotice.setNbimg(originImg);
			} else { // 기존 첨부파일이 없으면
				modiNotice.setNbimg(nbimg); // 생성한 파일명 set
			}
		}
		
		// UPDATE
		System.out.println(modiNotice);
		int updateresult =  adao.admin_updateNoticeModify(modiNotice);
		
		mav = new ModelAndView();
		if(updateresult > 0) {
			if(!nbimgfile.isEmpty() && originImg.length() > 0) { // 파일을 수정하고 기존 첨부파일이 있었으면
					File delFile = new File(nbImgSavePath, originImg);
					delFile.delete();
			}
			ra.addFlashAttribute("msg", modiNotice.getNbcode()+ " 공지가 수정되었습니다.");
			mav.setViewName("redirect:/admin_selectNoticeBoardView?nbcode="+modiNotice.getNbcode());
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
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
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
		String usedBoardList_json = gson.toJson(usedBoardList); 
		return usedBoardList_json;
	}	
	
	// 중고거래 목록 ajax 페이징 넘버 조회
	public String admin_selectResellPagingNumber_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectResellPagingNumber_ajax() 호출");
	
		int totalCount = adao.admin_selectResellTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		gson = new Gson();
		String paging_json = gson.toJson(paging);
		return paging_json;
	}

	// 중고거래 글상태 변경 요청
	public int admin_updateUbstate_ajax(String ubcode, String ubstate) {
		System.out.println("AdminService.admin_updateUbstate_ajax() 호출");
		System.out.println("상태변경할 ubcode : " + ubcode);
		System.out.println("상태변경할 ubstate : " + ubstate);
		int updateResult = adao.admin_updateUbstate_ajax(ubcode, ubstate);
		return updateResult;
	}
	
	
	/* 커뮤니티 관리 */
	// 커뮤니티 관리페이지 이동
	public ModelAndView admin_selectBoardList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectBoardList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
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

	// 커뮤니티 글 상태 변경 요청
	public int admin_updateBdstate_ajax(String bdcode, String bdstate) {
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
		String boardList_json = gson.toJson(boardList); 
		return boardList_json;
	}	

	// 커뮤니티 목록 ajax 페이징 넘버 조회
	public String admin_selectBoardPagingNumber_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectBoardPagingNumber_ajax() 호출");
	
		int totalCount = adao.admin_selectBoardTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		gson = new Gson();
		String paging_json = gson.toJson(paging);
		return paging_json;
	}

	/* 댓글 관리 */
	// 댓글 관리페이지 이동
	public ModelAndView admin_selectReplyList(Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectReplyList() 호출");
		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
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
		String replyList_json = gson.toJson(replyList); 
		return replyList_json;
	}
	
	// 댓글 목록 ajax 페이징 넘버 조회
	public String admin_selectReplyPagingNumber_ajax(Paging paging) {
		System.out.println("AdminService.admin_selectReplyPagingNumber_ajax() 호출");
		
		int totalCount = adao.admin_selectReplyTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		System.out.println("paging : " + paging);
		gson = new Gson();
		String paging_json = gson.toJson(paging);
		return paging_json;
	}

	// 댓글 상태 변경 요청
	public int admin_updateRpstate_ajax(String rpcode, String rpstate) {
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
		String loginId = (String)session.getAttribute("loginId");
		if (loginId == null) {
			ra.addFlashAttribute("msg", "관리자로 로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loadToLogin");	
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
	

}
