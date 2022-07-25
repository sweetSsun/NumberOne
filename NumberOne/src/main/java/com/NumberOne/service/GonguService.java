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
import com.NumberOne.dao.GonguDao;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;

@Service
public class GonguService {

	private ModelAndView mav;

	@Autowired
	private AdminDao adao;
	@Autowired
	private BoardDao bdao;
	@Autowired
	private GonguDao gdao;
	
	@Autowired
	private AdminService asvc;
	
	@Autowired
	private HttpSession session;

	// 파일 저장 경로
	String gbImgSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\gonguUpLoad";

	
	//공구 상세페이지 이동 
	public ModelAndView gongu_selectBoardView(String gbcode,  Paging paging) {
		System.out.println("GonguService.gongu_selectBoardView() 호출");
		System.out.println("nbcode:" +  gbcode);
		System.out.println("paging : " + paging);
		
		NoticeDto gonguBoard = bdao.selectNoticeBoardView(gbcode);
			
		System.out.println(gonguBoard);
		mav = new ModelAndView();
		mav.addObject("gonguBoard", gonguBoard);
		mav.addObject("paging", paging);
		mav.setViewName("gongu/GonguBoardView");
		
		return mav;
	}

	// 공구 작성페이지 이동
	public ModelAndView gongu_loadToBoardWrite(RedirectAttributes ra) {
		System.out.println("GonguService.gongu_loadToBoardWrite() 호출");
		mav = new ModelAndView();
		
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
		mav.setViewName("gongu/GonguBoardWrite");
		
		return mav;
	}

	//공구 작성 DB 입력
	public ModelAndView gongu_insertBoardWrite(NoticeDto notice, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("GonguService.gongu_insertBoardWrite() 호출");
		notice.setNbmid( (String) session.getAttribute("loginId")); // 세션id set
		
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
		
		// gbcode 생성
		String maxGbcode = adao.admin_selectMaxNbcode();
		int gbcodeNum = Integer.parseInt(maxGbcode.substring(3)) + 1;
		System.out.println("gbcodeNum: "+gbcodeNum);
		String gbcode;
		if(gbcodeNum<10) {
			gbcode = "GB0000"+gbcodeNum;
		} else if(gbcodeNum<100) {
			gbcode = "GB000"+gbcodeNum;
		} else if(gbcodeNum<1000) {
			gbcode = "GB00"+gbcodeNum;
		} else if(gbcodeNum<10000) {
			gbcode = "GB0"+gbcodeNum;
		} else {
			gbcode = "GB"+gbcodeNum;
		} 
		System.out.println("gbcode: "+gbcode);
		notice.setNbcode(gbcode); // 생성한 gbcode set
		
		// 파일 등록
		MultipartFile gbimgfile = notice.getNbimgfile();
		String gbimg = ""; // 파일명 저장할 변수명
		if(!gbimgfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			gbimg = uuid.toString() + "_" + gbimgfile.getOriginalFilename();
			gbimgfile.transferTo( new File(gbImgSavePath, gbimg) );
		}
		notice.setNbimg(gbimg); // 생성한 파일명 set
		
		// INSERT
		System.out.println(notice);
		int insertresult =  adao.admin_insertNoticeWrite(notice);
		
		if(insertresult > 0) {
			ra.addFlashAttribute("msg", gbcode+" 공구 작성되었습니다.");
			ra.addAttribute("codeIdx", gbcode);
			mav.setViewName("redirect:/gongu_selectBoardView");
		} else {
			ra.addFlashAttribute("msg", "공구 작성에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}

		return mav;
	}
	/*
	// 공지 수정페이지 이동
	public ModelAndView admin_selectNoticeModify(String nbcode, Paging paging, RedirectAttributes ra) {
		System.out.println("AdminService.admin_selectNoticeModify() 호출");
		System.out.println("nbcode : " + nbcode);
		System.out.println("paging : " + paging);
		
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
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
		if(mav.getViewName() != null) {
		   return mav;
		}
				
		// 파일 등록
		MultipartFile nbimgfile = modiNotice.getNbimgfile();
		String nbimg = ""; // 파일명 저장할 변수명
		if(!nbimgfile.isEmpty()) { // 파일 수정
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			nbimg = uuid.toString() + "_" + nbimgfile.getOriginalFilename();
			nbimgfile.transferTo( new File(gbImgSavePath, nbimg) );
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
					File delFile = new File(gbImgSavePath, modiNotice.getOriginImg());
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
*/
	

}




