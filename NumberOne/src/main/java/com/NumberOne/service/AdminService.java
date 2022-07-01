package com.NumberOne.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.AdminDao;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.pageDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	private ModelAndView mav;
	private Gson gson;

	@Autowired
	private AdminDao adao;
	
	int viewCount = 5; // 한 페이지에 보여줄 갯수
	int pageNumCount = 5; // 한 페이지에 보여줄 페이징 갯수
	
	/* 회원 관리 */
	// 회원 관리페이지 이동
	public ModelAndView admin_selectMemberList(int page) {
		System.out.println("AdminService_admin_selectMemberList() 호출");
		mav = new ModelAndView();
		String searchVal = "all";
		
		System.out.println("요청 페이지 : " + page);
		// 페이징
		int memberTotalCount = adao.selectMemberTotalCount(searchVal); // 전체 회원수 조회
		int startRow = (page-1) * viewCount + 1;
		int endRow = page * viewCount;
		
		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(searchVal, startRow, endRow);
		System.out.println(memberList);
		
		// 페이지에서 출력할 페이지번호 생성
		pageDto paging = new pageDto();
		// 글 최대값에 따라 페이지 번호 최대값
		int maxPage = (int) (Math.ceil( (double)memberTotalCount/viewCount ) );
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
		
		mav.addObject("memberList", memberList);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_MemberList");
		return mav;
	}
	
	// 선택한 상태값에 따른 회원목록 ajax
	public String admin_selectMemberList_ajax(String searchVal, int page) {
		System.out.println("AdminService_admin_selectMemberList_ajax() 호출");
		mav = new ModelAndView();
		System.out.println("searchVal : " + searchVal);
		System.out.println("요청 페이지 : " + page);

		int startRow = (page-1) * viewCount + 1;
		int endRow = page * viewCount;
		
		ArrayList<MemberDto> memberList = adao.admin_selectMemberList(searchVal, startRow, endRow);
		System.out.println(memberList);
		
		gson = new Gson();
		String memberList_ajax = gson.toJson(memberList);
		System.out.println("memberList_ajax : " + memberList_ajax);
		return memberList_ajax;
	}
	
	// 회원목록 ajax 페이징 넘버 조회
	public String admin_selectMemberPagingNumber_ajax(String searchVal, int page) {
		System.out.println("AdminServiceadmin_admin_selectMemberPagingNumber_ajax() 호출");
		
		int memberTotalCount = adao.selectMemberTotalCount(searchVal); // 전체 회원수 조회
		// 페이지에서 출력할 페이지번호 생성
		pageDto paging = new pageDto();
		// 글 최대값에 따라 페이지 번호 최대값
		int maxPage = (int) (Math.ceil( (double)memberTotalCount/viewCount ) );
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

	// 회원상태 변경 ajax
	public String admin_updateMstate_ajax(String mid, String mstate) {
		System.out.println("AdminService_admin_updateMstate_ajax() 호출");
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
	public ModelAndView admin_selectNoticeList(String searchVal, String searchType, String keyword) {
		System.out.println("AdminService_admin_selectNoticeList() 호출");
		System.out.println("정렬 val : " + searchVal);
		System.out.println("검색 type : " + searchType);
		System.out.println("검색 keyword : " + keyword);
		mav = new ModelAndView();
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(searchVal, searchType, keyword);
		System.out.println(noticeList);
		mav.addObject("noticeList", noticeList);
		mav.addObject("searchText", keyword);
		mav.addObject("searchType", searchType);
		mav.setViewName("admin/Admin_NoticeList");
		return mav;
	}

	// 선택한 상태값에 따른 공지목록 ajax
	public String admin_selectNoticeList_ajax(String searchVal, String searchType, String keyword) {
		System.out.println("AdminService_admin_selectNoticeList_ajax() 호출");
		System.out.println("정렬 val : " + searchVal);
		System.out.println("검색 type : " + searchType);
		System.out.println("검색 keyword : " + keyword);
		ArrayList<NoticeDto> noticeList = adao.admin_selectNoticeList(searchVal, searchType, keyword);
		System.out.println(noticeList);
		gson = new Gson();
		String noticeList_json = gson.toJson(noticeList);
		return noticeList_json;
	}

	// 공지상태 변경
	public int admin_updateNbstate_ajax(String nbcode, String nbstate) {
		System.out.println("AdminService_admin_updateNbstate_ajax() 호출");
		System.out.println("상태변경할 nbcode : " + nbcode);
		System.out.println("상태변경할 nbstate : " + nbstate);
		int updateResult = adao.admin_updateNbstate_ajax(nbcode, nbstate);
		return updateResult;
	}


}
