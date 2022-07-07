package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.service.AdminService;

@Controller
public class AdminController {
	
	private ModelAndView mav;
	
	@Autowired
	private AdminService asvc;
	
	@RequestMapping (value="/admin_loadToAdminMainPage")
	public String admin_loadToAdminMainPage() {
		System.out.println("관리자 메인페이지 이동 요청");
		return "admin/Admin_Main";
	}
	
	/* 회원 관리 */
	@RequestMapping (value="/admin_selectMemberList")
	public ModelAndView admin_selectMemberList(Paging paging, RedirectAttributes ra) {
		System.out.println("회원 관리페이지 이동 요청");
		mav = asvc.admin_selectMemberList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="/admin_selectMemberList_ajax")
	public @ResponseBody String admin_selectMemberList_ajax(Paging paging) {
		System.out.println("회원 관리페이지 정렬 요청");
		String memberList_json = asvc.admin_selectMemberList_ajax(paging);
		return memberList_json;
	}
	
	@RequestMapping (value="/admin_selectMemberPagingNumber_ajax")
	public @ResponseBody String admin_selectMemberPagingNumber_ajax(Paging paging) {
		System.out.println("회원 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectMemberPagingNumber_ajax(paging);
		return paging_json;
	}
	
	@RequestMapping (value= "/admin_updateMstate_ajax")
	public @ResponseBody String admin_updateMstate_ajax(String mid, String mstate) {
		System.out.println("회원상태 변경 요청");
		String memberInfo_json = asvc.admin_updateMstate_ajax(mid, mstate);
		return memberInfo_json;
	}
	
	@RequestMapping (value="/admin_selectMemberInfo_ajax")
	public @ResponseBody String admin_selectMemberInfo_ajax(String mid) {
		System.out.println("회원 상세정보 조회 요청");
		String memberInfo_json = asvc.admin_selectMemberInfo_ajax(mid);
		return memberInfo_json;
	}
	
	/* 공지 관리 */
	@RequestMapping (value="admin_selectNoticeList")
	public ModelAndView admin_selectNoticeList(String searchVal, String searchType, String keyword, int page, RedirectAttributes ra) {
		System.out.println("공지 관리페이지 이동 요청");
		mav = asvc.admin_selectNoticeList(searchVal, searchType, keyword, page, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectNoticeList_ajax")
	public @ResponseBody String admin_selectNoticeList_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("공지 관리페이지 정렬 요청");
		String noticeList_json = asvc.admin_selectNoticeList_ajax(searchVal, searchType, keyword, page);
		return noticeList_json;
	}	
	
	@RequestMapping (value="/admin_selectNoticePagingNumber_ajax")
	public @ResponseBody String admin_selectNoticePagingNumber_ajax(String searchVal, String searchType, String keyword, int page) {
		System.out.println("공지 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectNoticePagingNumber_ajax(searchVal, searchType, keyword, page);
		return paging_json;
	}
	
	@RequestMapping (value="admin_updateNbstate_ajax")
	public @ResponseBody int admin_updateNbstate_ajax(String nbcode, String nbstate) {
		System.out.println("공지상태 변경 요청");
		int updateResult = asvc.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}
	
	@RequestMapping (value="admin_updateNbstate")
	public ModelAndView admin_updateNbstate(String nbcode, String nbstate, RedirectAttributes ra) {
		System.out.println("공지상태 변경 요청_공지글 삭제");
		mav = asvc.admin_updateNbstate(nbcode, nbstate, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectNoticeBoardView")
	public ModelAndView admin_selectNoticeBoardView(String nbcode) {
		System.out.println("공지 상세페이지 이동 요청");
		mav = asvc.admin_selectNoticeBoardView(nbcode);
		return mav;
	}
	
	@RequestMapping (value="admin_loadToNoticeWrite")
	public ModelAndView admin_loadToNoticeWrite(RedirectAttributes ra) {
		System.out.println("공지 작성페이지 이동 요청");
		mav = asvc.admin_loadToNoticeWrite(ra);
		return mav;
	}
	
	@RequestMapping (value="admin_insertNoticeWrite")
	public ModelAndView admin_insertNoticeWrite(NoticeDto notice, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("작성한 공지 입력 요청");
		mav = asvc.admin_insertNoticeWrite(notice, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectNoticeModify")
	public ModelAndView admin_selectNoticeModify(String nbcode) {
		System.out.println("공지 수정페이지 이동 요청");
		mav = asvc.admin_selectNoticeModify(nbcode);
		return mav;
	}
	
	@RequestMapping (value="admin_updateNoticeModify")
	public ModelAndView admin_updateNoticeModify(NoticeDto modiNotice, String originImg, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("공지 수정 요청");
		mav = asvc.admin_updateNoticeModify(modiNotice, originImg, ra);
		return mav;
	}
	
	/* 중고거래 관리 */
	@RequestMapping (value="admin_selectResellList")
	public ModelAndView admin_selectResellList(Paging paging, RedirectAttributes ra) {
		System.out.println("중고거래 관리페이지 이동 요청");
		mav = asvc.admin_selectResellList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateUbstate_ajax")
	public @ResponseBody int admin_updateUbstate_ajax(String ubcode, String ubstate) {
		System.out.println("중고거래 글상태 변경 요청");
		int updateResult = asvc.admin_updateUbstate_ajax(ubcode, ubstate);
		return updateResult;
	}	
	
	@RequestMapping (value="admin_selectResellList_ajax")
	public @ResponseBody String admin_selectResellList_ajax(Paging paging) {
		System.out.println("중고거래 관리페이지 정렬 요청");
		String usedBoardList_json = asvc.admin_selectResellList_ajax(paging);
		return usedBoardList_json;
	}
	
	@RequestMapping (value="admin_selectResellPagingNumber_ajax")
	public @ResponseBody String admin_selectResellPagingNumber_ajax(Paging paging) {
		System.out.println("커뮤니티 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectResellPagingNumber_ajax(paging);
		return paging_json;
	}
	
	
	
	/* 커뮤니티 관리 */
	@RequestMapping (value="admin_selectBoardList")
	public ModelAndView admin_selectBoardList(Paging paging, RedirectAttributes ra) {
		System.out.println("커뮤니티 관리페이지 이동 요청");
		mav = asvc.admin_selectBoardList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateBdstate_ajax")
	public @ResponseBody int admin_updateBdstate_ajax(String bdcode, String bdstate) {
		System.out.println("커뮤니티 글상태 변경 요청");
		int updateResult = asvc.admin_updateBdstate_ajax(bdcode, bdstate);
		return updateResult;
	}
	
	@RequestMapping (value="admin_selectBoardList_ajax")
	public @ResponseBody String admin_selectBoardList_ajax(Paging paging) {
		System.out.println("커뮤니티 관리페이지 정렬 요청");
		String boardList_json = asvc.admin_selectBoardList_ajax(paging);
		return boardList_json;
	}
	
	@RequestMapping (value="admin_selectBoardPagingNumber_ajax")
	public @ResponseBody String admin_selectBoardPagingNumber_ajax(Paging paging) {
		System.out.println("커뮤니티 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectBoardPagingNumber_ajax(paging);
		return paging_json;
	}
	
	@RequestMapping (value="admin_selectBoardView")
	public ModelAndView admin_selectBoardView(Paging paging, String bdcode) {
		System.out.println("커뮤니티 상세페이지 이동 요청_관리자");
		
		return null;
	}
	
	/* 댓글 관리 */
	@RequestMapping (value="admin_selectReplyList")
	public ModelAndView admin_selectReplyList(Paging paging, RedirectAttributes ra) {
		System.out.println("댓글 관리페이지 이동 요청");
		ModelAndView mav = asvc.admin_selectReplyList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectReplyList_ajax")
	public @ResponseBody String admin_selectReplyList_ajax(Paging paging) {
		System.out.println("댓글 관리페이지 정렬 요청");
		String replyList_json = asvc.admin_selectReplyList_ajax(paging);
		return replyList_json;
	}
	
	@RequestMapping (value="admin_selectReplyPagingNumber_ajax")
	public @ResponseBody String admin_selectReplyPagingNumber_ajax(Paging paging) {
		System.out.println("댓글 관리페이지 페이징넘버 조회 요청");
		String paging_json = asvc.admin_selectReplyPagingNumber_ajax(paging);
		return paging_json;
	}
	
	@RequestMapping (value="admin_updateRpstate_ajax")
	public @ResponseBody int admin_updateRpstate_ajax(String rpcode, String rpstate) {
		System.out.println("댓글상태 변경 요청");
		int updateResult = asvc.admin_updateRpstate_ajax(rpcode, rpstate);
		return updateResult;
	}
	
	/* 문의 관리 */
	@RequestMapping (value="admin_selectQuestionList")
	public ModelAndView admin_selectQuestionList(Paging paging, RedirectAttributes ra) {
		System.out.println("문의 관리페이지 이동 요청");
		mav = asvc.admin_selectQuestionList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectQuestionList_ajax")
	public @ResponseBody String admin_selectQuestionList_ajax(Paging paging) {
		System.out.println("문의 관리페이지 정렬 요청");
		String selectResult_json = asvc.admin_selectQuestionList_ajax(paging);
		return selectResult_json;
	}
}
