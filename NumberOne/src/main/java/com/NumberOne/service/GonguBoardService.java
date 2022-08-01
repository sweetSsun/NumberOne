package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.BoardDao;
import com.NumberOne.dao.GonguBoardDao;
import com.NumberOne.dao.MemberDao;
import com.NumberOne.dto.GonguBoardDto;
import com.NumberOne.dto.GonguDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;
import com.google.gson.Gson;

@Service
public class GonguBoardService {

	private ModelAndView mav;
	private Gson gson;
	
	@Autowired
	private AdminService asvc;
	
	@Autowired
	private GonguBoardDao gbdao;
	@Autowired
	private BoardDao bdao;
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private HttpSession session;
	
	// 파일 저장 경로
	String gbImgSavePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\gonguUpLoad";
	
	/* 관리자 로그인 확인 (파라미터: ra/리턴: mav) loginAdminChToFail :: AdminService*/
	
	
	
	/* 관리자 페이지 */
	//공구 관리페이지 이동
	public ModelAndView admin_selectGonguList(Paging paging, RedirectAttributes ra) {
		System.out.println("GonguBoardService.admin_selectGonguList() 호출");

		mav = new ModelAndView();
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
		
		// 페이징
		if(paging.getKeyword() == null) { // dao 조건문이 keyword에 null값이 들어가면 오류가 나기 때문에 ""로 변경
			paging.setKeyword("");
		}
		
		int totalGbCount = gbdao.admin_selectGonguTotalCount(paging); // 전체 공구수 조회
		paging.setTotalCount(totalGbCount);
		paging.calc(); // 페이지 처리 계산 실행
//		System.out.println(paging);
		
		ArrayList<GonguBoardDto> gonguList = gbdao.admin_selectGonguList(paging);
//		System.out.println(gonguBoard);
		
		mav.addObject("gonguList", gonguList);
		mav.addObject("paging", paging);
		mav.setViewName("admin/Admin_GonguBoardList");
		return mav;
	
	}

	// 선택한 상태값에 따른 공구목록 ajax
	public String admin_selectGonguList_ajax(Paging paging) {
		System.out.println("GonguBoardService.admin_selectGonguList_ajax() 호출");
		ArrayList<GonguBoardDto> gonguList;		
		int totalCount = gbdao.admin_selectGonguTotalCount(paging); // 페이지 처리 위한 게시글 수 조회
		paging.setTotalCount(totalCount);
		paging.calc(); // 페이지 처리 계산 실행
		gonguList = gbdao.admin_selectGonguList(paging);

		gson = new Gson();
		if (paging.getAjaxCheck().equals("list")) { // memberList ajax일 경우
			String gonguList_json = gson.toJson(gonguList);
			return gonguList_json;
		} else { // paging ajax일 경우
			String paging_json = gson.toJson(paging);
			return paging_json;
		}
	}
	
	
	// 공구상태 변경
	public int admin_updateGbstate_ajax(String gbcode, int gbstate) {
		System.out.println("GonguBoardService.admin_updateGbstate_ajax() 호출");
//		System.out.println("상태변경할 gbcode : " + gbcode);
//		System.out.println("상태변경할 gbstate : " + gbstate);
		int updateResult = gbdao.admin_updateGbstate_ajax(gbcode, gbstate);
		return updateResult;
	}

	// 공지상태 변경_공지글 삭제 & 공구
	public ModelAndView admin_updateGbstate(String gbcode, int gbstate, RedirectAttributes ra) {
		System.out.println("GonguBoardService.admin_updateGbstate() 호출");
//		System.out.println("상태변경할 gbcode : " + gbcode);
//		System.out.println("상태변경할 gbstate : " + gbstate);
		mav = new ModelAndView();
		int updateResult = gbdao.admin_updateGbstate_ajax(gbcode, gbstate);
		if (updateResult > 0) {
			ra.addFlashAttribute("msg", gbcode+" 공구가 비활성화 처리 되었습니다.");
			mav.setViewName("redirect:/admin_selectGonguList?searchVal=all&searchType=&keyword=&page=1");
		}
		return mav;
	}

	// 고정공지 변경
	public int admin_updateGbfix_ajax(String gbcode, int gbfix) {
		System.out.println("GonguBoardService.admin_updateGbfix_ajax() 호출");
//		System.out.println("변경할 gbcode : " + gbcode);
//		System.out.println("변경할 gbfix : " + gbfix);
		int updateResult = gbdao.admin_updateGbfix_ajax(gbcode, gbfix);
		return updateResult;
	}
	
	//공구 상세페이지 이동 
	public ModelAndView admin_selectGonguBoardView(String gbcode,  Paging paging) {
		System.out.println("GonguBoardService.admin_selectGonguBoardView() 호출");
//		System.out.println("gbcode:" +  gbcode);
//		System.out.println("paging : " + paging);
		
		GonguBoardDto gonguBoard = gbdao.selectGonguBoardView(gbcode);
		
//		System.out.println(gonguBoard);
		mav = new ModelAndView();
		
		System.out.println(gonguBoard);

		mav.addObject("gonguBoard", gonguBoard);
		mav.addObject("paging", paging);

		
		mav.setViewName("admin/Admin_GonguBoardView");
		
		// 공구 참여회원목록 불러오기
		ArrayList<String> gonguList = gbdao.admin_selectGonguAttendList(gbcode);
		System.out.println("gongu : "+gonguList);
		// 공구 참여회원 수 불러오기
		int gonguCount = gbdao.admin_selectGonguAttendCount(gbcode);
		System.out.println("gongu : "+gonguCount);
		
		mav.addObject("gonguList", gonguList);
		mav.addObject("gonguCount", gonguCount);
		
		
		return mav;
	}

	//공구 작성페이지 이동
	public ModelAndView admin_loadToGonguWrite(RedirectAttributes ra) {
		System.out.println("GonguBoardService.admin_loadToGonguWrite() 호출");
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}		
		mav.setViewName("admin/Admin_GonguBoardWrite");	
		return mav;
	}

	// 작성 공지 DB에 입력
	public ModelAndView admin_insertGonguWrite(GonguBoardDto gonguboard, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("GonguBoardService.admin_insertGonguWrite() 호출");
		gonguboard.setGbmid( (String) session.getAttribute("loginId")); // 세션id set
		String gbcode;
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
		
		// 파일 등록
		MultipartFile gbimgfile = gonguboard.getGbimgfile();
		String gbimg = ""; // 파일명 저장할 변수명
		if(!gbimgfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			gbimg = uuid.toString() + "_" + gbimgfile.getOriginalFilename();
			gbimgfile.transferTo( new File(gbImgSavePath, gbimg) );
		}
		gonguboard.setGbimg(gbimg); // 생성한 파일명 set


		
		// gbcode 생성
		String maxGbcode = gbdao.admin_selectMaxGbcode();
		int gbcodeNum = Integer.parseInt(maxGbcode.substring(3)) + 1;
		System.out.println("gbcodeNum: "+gbcodeNum);
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
		gonguboard.setGbcode(gbcode); // 생성한 gbcode set		
		
		// INSERT
		System.out.println(gonguboard);
		int insertresult =  gbdao.admin_insertGonguWrite(gonguboard);
		
		if(insertresult > 0) {
			ra.addFlashAttribute("msg", gbcode+" 공구가 작성되었습니다.");
			ra.addAttribute("codeIdx", gbcode);
			mav.setViewName("redirect:/admin_selectGonguBoardView");
		} else {
			ra.addFlashAttribute("msg", gbcode+" 공구 작성에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}
		
		return mav;
	}

	//공구 수정페이지 이동
	public ModelAndView admin_selectGonguModify(String gbcode, Paging paging, RedirectAttributes ra) {
		System.out.println("GonguBoardService.admin_selectGonguModify() 호출");
		System.out.println("gbcode : " + gbcode);
		System.out.println("paging : " + paging);
		
		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
		
		GonguBoardDto gonguBoard = gbdao.selectGonguBoardView(gbcode);
		System.out.println(gonguBoard);
        
		mav.addObject("gonguBoard", gonguBoard);
		mav.addObject("paging", paging);
		
		mav.setViewName("admin/Admin_GonguBoardModifyForm");
		
		return mav;
	}
	
	// 수정 공지 DB에 입력
	public ModelAndView admin_updateGonguModify(GonguBoardDto modiGonguboard, Paging paging, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("GonguBoardService.admin_updateGonguModify() 호출");
		//System.out.println("originImg : " + modiNotice.getOriginImg());
		//System.out.println("paging : " + paging);

		mav = new ModelAndView();
		
		// 관리자 로그인 여부 체크
		mav = asvc.loginAdminChToFail(ra);
		//System.out.println(mav.getViewName().equals("redirect:/loadToLogin"));
		if(mav.getViewName() != null) {
		   return mav;
		}
				
		// 파일 등록
		MultipartFile gbimgfile = modiGonguboard.getGbimgfile();
		String gbimg = ""; // 파일명 저장할 변수명
		if(!gbimgfile.isEmpty()) { // 파일 수정
			//System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID(); // 랜덤코드 생성
			gbimg = uuid.toString() + "_" + gbimgfile.getOriginalFilename();
			gbimgfile.transferTo( new File(gbImgSavePath, gbimg) );
			modiGonguboard.setGbimg(gbimg); // 생성한 파일명 set
		} else { // 파일 수정 X
			if(modiGonguboard.getOriginImg_gb().length() > 0) { // 기존 첨부파일이 있으면
				modiGonguboard.setGbimg(modiGonguboard.getOriginImg_gb());
			} else { // 기존 첨부파일이 없으면
				modiGonguboard.setGbimg(gbimg); // 생성한 파일명 set
			}
		}
		
		// UPDATE
		//System.out.println(modiNotice);
		int updateresult =  gbdao.admin_updateGonguModify(modiGonguboard);
		
		if(updateresult > 0) {
			if(!gbimgfile.isEmpty() && modiGonguboard.getOriginImg_gb().length() > 0) { // 파일을 수정하고 기존 첨부파일이 있었으면
					File delFile = new File(gbImgSavePath, modiGonguboard.getOriginImg_gb());
					delFile.delete();
			}

			ra.addFlashAttribute("msg", modiGonguboard.getGbcode()+ " 공구가 수정되었습니다.");
			mav.setViewName("redirect:/admin_selectGonguBoardView"+paging.makeQueryPage(modiGonguboard.getGbcode(), paging.getPage()));
		} else {
			ra.addFlashAttribute("msg", "수정에 실패했습니다.");
			mav.setViewName("redirect:/loadToFail");
		}
		return mav;
	}
	
	
	
	/* 일반 페이지 */
	//공구게시판 이동 및 검색 
   public ModelAndView selectGonguBoardList(Paging paging, String gbstate) {
	   System.out.println("BoardService.selectGonguBoardList() 호출");
	   System.out.println("gbstate : "+gbstate);
	   
	   ModelAndView mav = new ModelAndView();
	   
	   //페이징 
	   if(paging.getKeyword() == null) {
		   paging.setKeyword("");
	   }
	   
	   //고정공지
	   ArrayList<NoticeDto> noticeList_fix = bdao.selectNoticeList();
   
	   int totalCount = gbdao.selectGonguTotalCount(paging);
	   paging.setTotalCount(totalCount);
	   paging.calc(); // 페이지 처리 계산 실행 
	   System.out.println(paging);
	   
	   ArrayList<GonguBoardDto> GonguList = gbdao.selectGonguBoardList(paging);
	   System.out.println(GonguList);
	   
	   mav.addObject("noticeList_fix", noticeList_fix);
	   mav.addObject("GonguList", GonguList);
	   mav.addObject("paging", paging);
	   
	   if(gbstate.equals("ing")) {
		   mav.setViewName("gongu/GonguBoardList");		   
	   } else {
		   mav.setViewName("gongu/GonguBoardListEnd");
	   }
	
	   return mav;	     
   }
	   
   //공지글상세 페이지 이동
	public ModelAndView selectGonguBoardView(String gbcode, Paging paging) {
		System.out.println("BoardService.selectGonguBoardView() 호출");
		
		ModelAndView mav = new ModelAndView();

		System.out.println("gbcode:" + gbcode);

		// 공지글 조회수 업데이트
		gbdao.updateGonguBdHits(gbcode);
		GonguBoardDto gonguBoard = gbdao.selectGonguBoardView(gbcode);
		System.out.println(gonguBoard);
		
		mav.addObject("gonguBoard", gonguBoard);
		mav.addObject("paging", paging);

		
		mav.setViewName("gongu/GonguBoardView");
			
		// 공구 회원정보 불러오기
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId == null) {
			System.out.println("비회원입니다.");
			
		} else {
			System.out.println("로그인 된 아이디 : " + loginId);
			MemberDto memberInfo = mdao.selectMyInfoMemberView(loginId);
			mav.addObject("memberInfo", memberInfo);							
		}			
	
		return mav;
	}
	   
	   
	   
	   
	   
	//공구 카카오결제정보 DB입력 :: 성공/실패는 KakaoPay (controller)에서 판단; mav를 안쓰기 때문
	public int insertGonguRegister(GonguDto gongu) {
		System.out.println("insertGonguRegister() 호출");
		int gonguRegister = gbdao.insertGonguResgister(gongu);
		return gonguRegister;
	}
	
	//공구 카카오결제정보 DB삭제
	public int deleteGonguRegister(GonguDto gongu) {
		System.out.println("deleteGonguRegister() 호출");
		int gonguDelete = gbdao.insertGonguResgister(gongu);
		return gonguDelete;
	}
		
	//공구 참여내역 DB 찾기
	public String insertCheck_ajax(String ggbcode, String ggmid) {
		System.out.println("insertCheck_ajax() 호출");
		String gonguSelect = gbdao.insertCheck_ajax(ggbcode, ggmid);
		return gonguSelect;
	}
}
