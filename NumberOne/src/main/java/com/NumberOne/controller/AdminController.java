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
	public String admin_loadToAdminMainPage(RedirectAttributes ra) {
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
	
	@RequestMapping (value= "/admin_updateMstate_ajax")
	public @ResponseBody String admin_updateMstate_ajax(String mid, int mstate) {
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
	public ModelAndView admin_selectNoticeList(Paging paging, RedirectAttributes ra) {
		System.out.println("공지 관리페이지 이동 요청");
		mav = asvc.admin_selectNoticeList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectNoticeList_ajax")
	public @ResponseBody String admin_selectNoticeList_ajax(Paging paging) {
		System.out.println("공지 관리페이지 정렬 요청");
		String noticeList_json = asvc.admin_selectNoticeList_ajax(paging);
		return noticeList_json;
	}	
	
	@RequestMapping (value="admin_updateNbstate_ajax")
	public @ResponseBody int admin_updateNbstate_ajax(String nbcode, int nbstate) {
		System.out.println("공지상태 변경 요청");
		int updateResult = asvc.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}
	
	@RequestMapping (value="admin_updateNbstate")
	public ModelAndView admin_updateNbstate(String nbcode, int nbstate, RedirectAttributes ra) {
		System.out.println("공지상태 변경 요청_공지글 삭제");
		mav = asvc.admin_updateNbstate(nbcode, nbstate, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateNbfix_ajax")
	public @ResponseBody int admin_updateNbfix_ajax(String nbcode, int nbfix) {
		System.out.println("고정공지 변경 요청");
		int updateResult = asvc.admin_updateNbfix_ajax(nbcode, nbfix);
		return updateResult;
	}
	
	@RequestMapping (value="admin_selectNoticeBoardView")
	public ModelAndView admin_selectNoticeBoardView(String codeIdx, Paging paging) {
		System.out.println("공지 상세페이지 이동 요청");
		mav = asvc.admin_selectNoticeBoardView(codeIdx, paging);
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
	public ModelAndView admin_selectNoticeModify(String codeIdx, Paging paging) {
		System.out.println("공지 수정페이지 이동 요청");
		System.out.println("codeIdx : " + codeIdx);
		mav = asvc.admin_selectNoticeModify(codeIdx, paging);
		return mav;
	}
	
	@RequestMapping (value="admin_updateNoticeModify")
	public ModelAndView admin_updateNoticeModify(NoticeDto modiNotice, Paging paging, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("공지 수정 요청");
		mav = asvc.admin_updateNoticeModify(modiNotice, paging, ra);
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
	public @ResponseBody int admin_updateUbstate_ajax(String ubcode, int ubstate) {
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
	
	@RequestMapping (value="admin_selectResellView")
	public ModelAndView admin_selectResellView(Paging paging, String codeIdx) {
		System.out.println("중고거래 상세페이지 이동 요청_관리자");
		// 상세 이동 코드 생성 필요
		return null;
	}
	
	/* 커뮤니티 관리 */
	@RequestMapping (value="admin_selectBoardList")
	public ModelAndView admin_selectBoardList(Paging paging, RedirectAttributes ra) {
		System.out.println("경고/정지 관리페이지 이동 요청");
		mav = asvc.admin_selectBoardList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_updateBdstate_ajax")
	public @ResponseBody int admin_updateBdstate_ajax(String bdcode, int bdstate) {
		System.out.println("경고/정지 글상태 변경 요청");
		int updateResult = asvc.admin_updateBdstate_ajax(bdcode, bdstate);
		return updateResult;
	}
	
	@RequestMapping (value="admin_selectBoardList_ajax")
	public @ResponseBody String admin_selectBoardList_ajax(Paging paging) {
		System.out.println("경고/정지 관리페이지 정렬 요청");
		String boardList_json = asvc.admin_selectBoardList_ajax(paging);
		return boardList_json;
	}
	
	@RequestMapping (value="admin_selectBdfixList")
	public ModelAndView admin_selectBdfixList(Paging paging, RedirectAttributes ra) {
		System.out.println("배너 관리페이지 이동 요청");
		mav = asvc.admin_selectBdfixList(paging, ra);
		return mav;
	}
	
	@RequestMapping (value="admin_selectBdfixList_ajax")
	public @ResponseBody String admin_selectBdfixList_ajax(Paging paging) {
		System.out.println("배너 관리페이지 정렬 요청");
		String bdfixList_json = asvc.admin_selectBdfixList_ajax(paging);
		return bdfixList_json;
	}
	
	@RequestMapping (value="admin_updateBdfix_ajax")
	public @ResponseBody int admin_updateBdfix_ajax(String bdcode, int	bdfix) {
		System.out.println("배너 고정 변경 요청");
		int updateResult = asvc.admin_updateBdfix_ajax(bdcode, bdfix);
		return updateResult;
	}
	
	@RequestMapping (value="admin_selectBoardView")
	public ModelAndView admin_selectBoardView(Paging paging, String codeIdx) {
		System.out.println("커뮤니티 상세페이지 이동 요청_관리자");
		// 상세 이동 코드 생성 필요
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
	
	@RequestMapping (value="admin_updateRpstate_ajax")
	public @ResponseBody int admin_updateRpstate_ajax(String rpcode, int rpstate) {
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
	
	@RequestMapping (value="admin_updateQuestionAns_ajax")
	public @ResponseBody int admin_updateQuestionAns_ajax(String ctcode, String ctans) {
		System.out.println("문의 답변 입력 요청");
		int updateResult = asvc.admin_updateQuestionAns_ajax(ctcode, ctans);
		return updateResult;
	}
	
	
	/* 게시글/댓글 정지 */
	@RequestMapping (value="admin_updateBoardStop")
	public ModelAndView admin_updateBoardStop(String bdcode, RedirectAttributes ra) {
		System.out.println("커뮤니티 게시글 정지 요청");
		mav = asvc.admin_updateBoardStop(bdcode, ra);
		return mav;
		// 글목록으로 돌아가는 url 만들어서 매개변수 생기면 수정 필요
	}
	
	@RequestMapping (value="admin_updateRoomStop_ajax")
	public @ResponseBody int admin_updateRoomStop_ajax(String bdcode) {
		System.out.println("자랑 게시글 정지 요청");
		int updateResult = asvc.admin_updateRoomStop_ajax(bdcode);
		return updateResult;
		// 스크립트단에서 updateResult > 0 이면 "정지처리되었습니다" 모달 띄우고, 정지버튼 d_none
		// 가능하면 자랑목록페이지 새로 받아오고, 보던 스크롤 위치로 이동하고 싶다
	}
	
	@RequestMapping (value="admin_updateResellStop")
	public ModelAndView admin_updateResellStop(String ubcode, Paging paging, RedirectAttributes ra) {
		System.out.println("중고거래 글 정지 요청");
		mav = asvc.admin_updateResellStop(ubcode, paging, ra);
		return mav;
		// 글목록으로 돌아가는 url 만들어서 매개변수 생기면 수정 필요
	}
	
	@RequestMapping (value="admin_updateReplyStop_ajax")
	public @ResponseBody int admin_updateReplyStop_ajax(String rpcode) {
		System.out.println("댓글 정지 요청");
		int updateResult = asvc.admin_updateReplyStop_ajax(rpcode);
		return updateResult;
	}
	
	
	
}
