package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.controller.HomeController;
import com.NumberOne.dao.ResellDao;
import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.dto.ZzimDto;
import com.google.gson.Gson;

@Service
public class ResellService {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	@Autowired
	ResellDao rdao;

	public static String savePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\resell";

	
	public ModelAndView selectResellMainPage(Paging paging) throws Exception {
		System.out.println("selectResellMainPage 서비스 호출");
		ModelAndView mav = new ModelAndView();

		String checkMethod = "Main";
		
		  //회원의 관심지역 출력용 
		  if((String) session.getAttribute("loginRegion") != null) {
		 paging.setSearchVal(rdao.selectRegionCode((String)
		 session.getAttribute("loginRegion"))); }
		
		System.out.println("지역정보 : " + paging.getSearchVal());
		if (paging.getSearchVal() == null || paging.getSearchVal() == "") {

			paging.setSearchVal("all");

		}

		paging.setSellBuy("S");
//		팔구리스트
		ArrayList<UsedBoardDto> SellList = rdao.selectResellPageList(paging, checkMethod);

		//timeFuction에 리스트 넘기면 시간 ubdatedef에는 변경된 시간, ubdate에는 분까지 잘린 시간이 저장되어 리턴
		SellList = timeFuction(SellList);
		
		//zzimCheck에 리스트 넘기면 로그인 id가 zzim 기록이 있는 경우 zzimcheck에 mid 저장
		SellList = zzimCheck(SellList);
		
		//System.out.println("팔구DTO : " + paging);

//		사구리스트
		paging.setSellBuy("B");
		ArrayList<UsedBoardDto> BuyList = rdao.selectResellPageList(paging, checkMethod);
		
		//timeFuction에 리스트 넘기면 시간 ubdatedef에는 변경된 시간, ubdate에는 분 까지 잘린 시간이 저장되어 리턴
		BuyList = timeFuction(BuyList);

		//zzimCheck에 리스트 넘기면 로그인 id가 zzim 기록이 있는 경우 zzimcheck에 mid 저장
		BuyList = zzimCheck(BuyList);
		
		//System.out.println("사구DTO : " + paging);

		mav.addObject("SellList", SellList);
		mav.addObject("BuyList", BuyList);
		
		System.out.println("팔구목록 : " +SellList);
		System.out.println("사구목록 : " + BuyList);
		
		mav.setViewName("resell/Resell_Main");

		return mav;

	}



	public ModelAndView insertResellWrite(GoodsDto gdDto, UsedBoardDto ubDto, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("insertResellWrite 서비스호출");

		String ubmid = (String) session.getAttribute("loginId");

		String ub_char = "UB";
		String ubCode = null;
		String ub_codeNumber = rdao.selectMaxNumber_ub();

//		중고거래게시판 글번호 생성	
		if (ub_codeNumber == null) {
			ubCode = "UB00001";
		} else {
			ub_codeNumber = ub_codeNumber.substring(2);
			int udCode_int = Integer.parseInt(ub_codeNumber) + 1;

			if (udCode_int < 10) {
				ubCode = ub_char + "0000" + udCode_int;
			} else if (udCode_int < 100) {
				ubCode = ub_char + "000" + udCode_int;
			} else if (udCode_int < 1000) {
				ubCode = ub_char + "00" + udCode_int;
			} else if (udCode_int < 10000) {
				ubCode = ub_char + "0" + udCode_int;
			} else if (udCode_int < 100000) {
				ubCode = ub_char + udCode_int;
			}
		}

		ubDto.setUbcode(ubCode);
		ubDto.setUbmid(ubmid);

		gdDto.setGdubcode(ubCode);

		// CV로 SAVEPATH 선언되어있음

		MultipartFile ubMainFile = ubDto.getUbmainimgfile();
		// 대표이미지의 파일명
		String ubmainimg = "";
		// 대표이미지 파일 처리
		if (!ubMainFile.isEmpty()) {
			System.out.println("대표 이미지 있음");
			UUID uuid = UUID.randomUUID();

			System.out.println(savePath);

			// 파일명 생성
			ubmainimg = "M" + uuid.toString() + "_" + ubMainFile.getOriginalFilename();
			// 대표 이미지 파일 저장
			ubMainFile.transferTo(new File(savePath, ubmainimg));

			// room에 setBdimg
			System.out.println("ubmainimg : " + ubmainimg);
		}

		ubDto.setUbmainimg(ubmainimg);

		// 상세이미지 파일
		MultipartFile[] ubdetailimgfile = ubDto.getUbdetailimgfile();

		// 상세이미지의 파일명(최대 5개)
		String uddetailimg = "";

		// 상세이미지 파일 처리
		// System.out.println("상세이미지개수: "+bddetailimgfile.length);
		// 상세 이미지를 선택 안해도 배열의 크키가 1로 나옴
		// 0번 인덱스의 filename이 있는지로 확인해야 함
		System.out.println("ubdetailimgfile[0].length: " + ubdetailimgfile[0].getOriginalFilename().length());

		if (ubdetailimgfile[0].getOriginalFilename().length() > 0) {

			for (int i = 0; i < ubdetailimgfile.length; i++) {
				UUID uuid = UUID.randomUUID();
				// 파일명 생성
				String uddetailimgname = uuid.toString() + ubdetailimgfile[i].getOriginalFilename();
				// 상세 이미지 파일 저장
				ubdetailimgfile[i].transferTo(new File(savePath, uddetailimgname));
				uddetailimg += "___" + uddetailimgname;
			}

			System.out.println("uddetailimg : " + uddetailimg);
		}

		ubDto.setUbdetailimg(uddetailimg);

		int insertResult_ub = rdao.insertResellWrite_ub(ubDto);

		System.out.println("게시글 등록 : " + insertResult_ub);

		String gd_char = "GD";
		String gdCode = null;
		int insertResult_gd = 0;

		for (int i = 0; i < gdDto.getGd_names().length; i++) {

			if (gdDto.getGd_names()[i] == null) {
				break;
			}
			String gd_codeNumber = rdao.selectMaxNumber_gd();
			System.out.println("맥스코드넘버 : " + gd_codeNumber);

			if (gd_codeNumber == null) {
				gdCode = "GD00001";
			} else {
				gd_codeNumber = gd_codeNumber.substring(2);

				int gdCode_int = Integer.parseInt(gd_codeNumber) + 1;

				System.out.println("서브스트링한숫자 : " + gdCode_int);

				if (gdCode_int < 10) {
					gdCode = gd_char + "0000" + gdCode_int;
				} else if (gdCode_int < 100) {
					gdCode = gd_char + "000" + gdCode_int;
				} else if (gdCode_int < 1000) {
					gdCode = gd_char + "00" + gdCode_int;
				} else if (gdCode_int < 10000) {
					gdCode = gd_char + "0" + gdCode_int;
				} else if (gdCode_int < 100000) {
					gdCode = gd_char + gdCode_int;
				}
			}
			gdDto.setGdcode(gdCode);

			System.out.println("물품리스트 : " + gdDto.getGd_names()[i]);

			gdDto.setGdname(gdDto.getGd_names()[i]);
			gdDto.setGdprice(gdDto.getGd_price()[i]);

			System.out.println(gdDto);
			insertResult_gd = rdao.insertResellWrite_gd(gdDto);

		}

		if (insertResult_ub > 0 && insertResult_gd > 0) {
			System.out.println("insert성공");
			System.out.println(ubDto.getUbsellbuy());
			ra.addFlashAttribute("msg", "글이 작성되었습니다.");
			if (ubDto.getUbsellbuy().equals("B")) {

				mav.setViewName("redirect:/selectResellPageList?sellBuy=B&searchVal=전국");

			} else {

				mav.setViewName("redirect:/selectResellPageList?sellBuy=S&searchVal=전국");

			}
		} else {
			ra.addFlashAttribute("msg", "글 작성에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}

		return mav;

	}

//  사구 팔구 통합
	public ModelAndView selectResellPageList(Paging paging) throws Exception {

		System.out.println("selectResellPageList 서비스 호출");
		ModelAndView mav = new ModelAndView();

		String checkMethod = "NO";
		
		 if((String) session.getAttribute("loginRegion") != null &&
				 paging.getSearchType()==null) {
				 paging.setSearchVal(rdao.selectRegionCode((String)
				 session.getAttribute("loginRegion"))); }
		 
		// 메인페이지에는 지역선택이 없어서 paging 클래스의 기본생성자의 searchVal 필드값이 all 이므로 all 일떄 검색해서 온걸로 지정
		//메인페이지에 지역카테고리 넣으면 필요없음.
		 
		 else if (paging.getSearchVal().equals("all")) {
			checkMethod = "write";				
			System.out.println("검색타입(searchType) : " + paging.getSearchType());
			System.out.println("검색어(keyword) : " + paging.getKeyword());
		}
	
		System.out.println(paging);

		// 로그인되어있으면 회원의 관심지역을 지역필드에 저장
		
		
		 
		paging.setPerPageNum(12);
		
		int totalCaount = rdao.selectPageTotalCount(paging);
		paging.setTotalCount(totalCaount);
		paging.calc();

		ArrayList<UsedBoardDto> sell_buyList = rdao.selectResellPageList(paging, checkMethod);
		

		//timeFuction에 리스트 넘기면 시간 ubdatedef에는 변경된 시간, ubdate에는 분 까지 잘린 시간이 저장되어 리턴
		sell_buyList = timeFuction(sell_buyList);
		
		/*

		for (int i = 0; i < sell_buyList.size(); i++) {
			//현재시간 - 작성시간
			String ubdatedef = timeFuction(sell_buyList.get(i).getUbdate());
			//ubdatedef 객체에 저장
			sell_buyList.get(i).setUbdatedef(ubdatedef);
			//ubdate 분까지만 객체에 저장
			sell_buyList.get(i).getUbdate().substring(0,  16);	
		}
		*/
		
		System.out.println(sell_buyList);
		System.out.println(paging);
		mav.addObject("sell_buyList", sell_buyList);
		mav.addObject("paging", paging);
		mav.addObject("checkSearch", checkMethod);
		
		if (paging.getSellBuy().equals("S")) {
			System.out.println("조건문S");
			mav.setViewName("resell/Resell_SellList");

		} else if (paging.getSellBuy().equals("B")) {
			System.out.println("조건문B");
			mav.setViewName("resell/Resell_BuyList");
		}
		return mav;

	}

	
//   중고거래리스트 selected 지역으로 조회
	public String selectResellRegionList_ajax(Paging paging) {
		System.out.println("selectResellRegionList_ajax 서비스 호출");

		System.out.println("검색타입(searchType) : " + paging.getSearchType());
		System.out.println("검색어(keyword) : " + paging.getKeyword());
		String mregion = "all";
		
		if (!paging.getSearchVal().equals("all")) {
		mregion = rdao.selectRegionCode(paging.getSearchVal());  
		
		}
		String checkMethod = "NO";
		
		paging.setPerPageNum(12);		
	
		
		System.out.println("파라메터지역코드 : " + mregion);
		paging.setSearchVal(mregion);

		/*
		 * if(paging.getSearchType()!=null) { checkMethod = "search"; }
		 */
		System.out.println("checkMethod : " + checkMethod);

		int totalCount = rdao.selectPageTotalCount(paging);

		paging.setTotalCount(totalCount);
		paging.calc();

		System.out.println(paging);

		ArrayList<UsedBoardDto> sellbuyList = rdao.selectResellRegionList_ajax(paging);

		System.out.println(sellbuyList);
		Gson gson = new Gson();

		String sell_buyList = gson.toJson(sellbuyList);
		String pageNumber = gson.toJson(paging);

		if (paging.getAjaxCheck().equals("REGION")) {
			return sell_buyList;
		} else {
			return pageNumber;
		}

	}

	public ModelAndView selectResellView(UsedBoardDto ubDto, String modifyCheck) {
		System.out.println("selectResellView 서비스 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("서비스에서확인 : " + ubDto);
		String zzim_Check;
		if((String) session.getAttribute("loginId")!=null) {
			String loginId = (String) session.getAttribute("loginId");
			
			String zzimCheck = rdao.selectZzimCheck(loginId, ubDto.getUbcode());// 회원의 글 찜 여부 확인	

			if (zzimCheck != null) {
				zzim_Check = "CHECK";
			} else {
				zzim_Check = "UNCHECK";
			}
			mav.addObject("zzim_Check", zzim_Check);
			System.out.println("찜체크 : " + zzim_Check); // 찜한 글인지 확인
		}
	
	

		UsedBoardDto ub_resellView = rdao.selectResellView(ubDto);

		System.out.println(ub_resellView);
		System.out.println(ub_resellView.getUbmid());

		ArrayList<GoodsDto> gd_resellView = rdao.selectResellView_goods(ubDto);
		
		ArrayList<UsedBoardDto> memberSellList = rdao.selectResellView_List(ub_resellView.getUbmid(),
				ubDto.getUbcode());
		
		
		String[] ubDetailImg;

		if (ub_resellView.getUbdetailimg() != null) {
			ubDetailImg = ub_resellView.getUbdetailimg().split("___");

			for (String dimg : ubDetailImg) {
				System.out.println("디테일이미지들 : " + dimg);

			}
			mav.addObject("detailLength", ubDetailImg.length);
			ub_resellView.setUbdetailimg_list(ubDetailImg);

		}

	
		System.out.println("글 정보 : " + ub_resellView); // 글 정보
		System.out.println("상품목록 : " + gd_resellView); // 글의 상품목록
		System.out.println("판매자의 다른상품 : " + memberSellList); // 작성자의 다른 판매글목록

		
		mav.addObject("gd_resellView", gd_resellView);
		mav.addObject("ub_resellView", ub_resellView);
		mav.addObject("memberSellList", memberSellList);

		if (modifyCheck.equals("LIST")) {
			mav.setViewName("resell/Resell_View");
		}

		else {
			mav.setViewName("resell/Resell_ModifyForm");
		}

		return mav;

	}

	public String zzimClick_ajax(ZzimDto zzim) {
		System.out.println("zzimClick_ajax 서비스 호출");
		int zzimResult = 0;
		String zzimCheck = null;
		if (zzim.getZzim_Check().equals("CHECK")) {
			zzimResult = rdao.zzimClick_ajax_delete(zzim);
			System.out.println("딜리트결과 : " + zzimResult);
			if (zzimResult > 0) {
				zzimCheck = "UNCHECK";
			}
		} else if (zzim.getZzim_Check().equals("UNCHECK")) {
			zzimResult = rdao.zzimClick_ajax_insert(zzim);
			System.out.println("인서트결과 : " + zzimResult);
			if (zzimResult > 0) {
				zzimCheck = "CHECK";
			}
		}

		return zzimCheck;
	}

	public ModelAndView loadToResellWriteForm(String sell_buy, RedirectAttributes ra) {
		System.out.println("loadToResellWriteForm 서비스 호출");
		ModelAndView mav = new ModelAndView();

		if((String) session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다");
			mav.setViewName("redirect:loadToFail");
			return mav;
		}
		
		
		String loginId = (String) session.getAttribute("loginId");

		String mNickname = rdao.loadToResellWriteForm(loginId);

		mav.addObject("mNickname", mNickname);
		mav.addObject("sell_buy", sell_buy);
		mav.setViewName("resell/Resell_WriteForm");

		return mav;
	}

	public String checkResellWarning_ajax(String loginId, String ubcode) {
		System.out.println("checkResellWarning_ajax() 호출");

		String wnCheck = "";
		String warning = rdao.checkResellWarning_ajax(loginId, ubcode);
		if (warning != null) {
			// 이미 신고한 게시물
			wnCheck = "Yes";
		}
		return wnCheck;
	}

	public int insertResellWarning_ajax(String loginId, String ubcode) {
		System.out.println("insertResellWarning_ajax 호출");
		System.out.println("로그인아이디:" + loginId);
		int insertResult = rdao.insertResellWarning_ajax(loginId, ubcode);

		return insertResult;
	}

	public int deleteResellWarning_ajax(String loginId, String ubcode) {
		System.out.println("deleteResellWarning_ajax() 호출");

		int insertResult = rdao.deleteResellWarning_ajax(loginId, ubcode);

		return insertResult;
	}

	public ModelAndView updateResellDelete(UsedBoardDto ubDto, RedirectAttributes ra) {
		System.out.println("updateResellDelete() 호출");
		ModelAndView mav = new ModelAndView();

		int gd_deleteResult = rdao.updateResellDelete_gd(ubDto); // 상품목록삭제

		int ub_deleteResult = rdao.updateResellDelete_ub(ubDto); // 글삭제

		if (gd_deleteResult > 0 && ub_deleteResult > 0) {
			System.out.println("delete성공");
			ra.addFlashAttribute("msg", "글이 삭제되었습니다.");

			if (ubDto.getUbsellbuy().equals("B")) {

				mav.setViewName("redirect:/selectResellPageList?sellBuy=B");

			} else {

				mav.setViewName("redirect:/selectResellPageList?sellBuy=S");

			}
		} else {
			ra.addFlashAttribute("msg", "글 작성에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}

		return mav;

	}

	public String updateResellState_GoodsAjax(GoodsDto gdDto) {
		System.out.println("updateResellState_GoodsAjax() 호출");

		int stateResult = rdao.updateResellState_GoodsAjax(gdDto);
		String result = null;
		if (stateResult > 0) {

			if (gdDto.getGdstate() == 0) {
				result = "SOLD";

			} else {

				result = "ING";
			}
		}

		return result;
	}

	public String updateResellState_usedBoardAjax(UsedBoardDto ubDto) {
		System.out.println("updateResellState_usedBoardAjax() 호출");
		String result = null;

		int usedBoardState = rdao.updateResellState_usedBoardAjax(ubDto);

		if (usedBoardState > 0) {
			if (ubDto.getUbstate() == 9) {
				result = "SOLD";
			} else {
				result = "ING";
			}

		}
		return result;
	}

	public ModelAndView updateResellModify(GoodsDto gdDto, UsedBoardDto ubDto, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("updateResellModify() 호출");
		System.out.println(savePath);
		ModelAndView mav = new ModelAndView();

		// CV로 SAVEPATH 선언되어있음
		ArrayList<String> deleteFile = new ArrayList<>();
		MultipartFile ubMainFile = ubDto.getUbmainimgfile();

		// 대표이미지의 파일명담을 변수 공백으로 초기화

		// 대표이미지 있는지 확인 (비어있지않으면)
		if (!ubMainFile.isEmpty()) {
			String ubmainimg = "";
			// 기존 대표 이미지명 deleteFile에 저장
			deleteFile.add(ubDto.getUbmainimg());

			System.out.println("대표 이미지 있음");

			UUID uuid = UUID.randomUUID();

			System.out.println(savePath);

			// 파일명 생성
			ubmainimg = "M" + uuid.toString() + "_" + ubMainFile.getOriginalFilename();

			// 대표 이미지 실제파일 저장 (지정한경로:savePath에 ubmainimg에 담긴 이름으로 메모리(파일?)를 만들고, 실제파일인담긴
			// ubMainFile을 저장한다.)
			ubMainFile.transferTo(new File(savePath, ubmainimg));

			ubDto.setUbmainimg(ubmainimg);
			System.out.println("메인이미지" + ubmainimg);
		}

		// 상세 이미지 del_ 이 붙으면 삭제하는 파일 아니면 유지
		String[] currentDetailImg = ubDto.getUbdetailimg().split("___");

		String ubdetailimg = "";

		for (int i = 0; i < currentDetailImg.length; i++) {
			System.out.println(i + "번 상세 이미지명: " + currentDetailImg[i].length());
			if (currentDetailImg[i].length() != 0) {

				if (!currentDetailImg[i].substring(0, 4).equals("del_")) {
					System.out.println(i + "번 상세 유지: " + currentDetailImg[i]);
					// 유지파일
					ubdetailimg += "___" + currentDetailImg[i];
					System.out.println("ubdetailimg: " + ubdetailimg);
				} else {
					// 삭제파일
					deleteFile.add(currentDetailImg[i].substring(4));
					System.out.println("ubdetailimg: " + ubdetailimg);
				}
			}
		}
		// System.out.println("bddetailimg: "+bddetailimg);
		System.out.println("deleteFile.size(): " + deleteFile.size());

		// 상세이미지 파일 담을 인스턴스배열 생성
		MultipartFile[] ubdetailimgfile = ubDto.getUbdetailimgfile();

		// 상세이미지의 파일명을 담을 변수 공백(빈값)으로 초기화

		// 상세이미지 파일 처리
		// System.out.println("상세이미지개수: "+bddetailimgfile.length);
		// 상세 이미지를 선택 안해도 배열의 크키가 1로 나옴 (파일이 있는지 없는지 이걸로 확인 어려움)

		// 대신 0번 인덱스의 filename이 있는지로 확인해야 함
		System.out.println("ubdetailimgfile[0].length: " + ubdetailimgfile[0].getOriginalFilename().length());

		if (ubdetailimgfile[0].getOriginalFilename().length() > 0) {
			// 0번 인덱스의 실제 파일이름의 길이가 0보다 크면)

			for (int i = 0; i < ubdetailimgfile.length; i++) {
				UUID uuid = UUID.randomUUID();
				// 파일명 랜덤 생성
				String uddetailimgname = uuid.toString() + ubdetailimgfile[i].getOriginalFilename();
				// 상세 이미지 파일 저장
				ubdetailimgfile[i].transferTo(new File(savePath, uddetailimgname));
				ubdetailimg += "___" + uddetailimgname; // 이미지가 여러개를 한열에 담고, 이미지끼리 구분할 수 있도록 구분할 수 있는 특수문자사용해서 변수에 담는다.
			}

			System.out.println("uddetailimg : " + ubdetailimg);
		}

		ubDto.setUbdetailimg(ubdetailimg);

		int gdStateUPdateResult = 0;

		// 상품 코드, 상품상태 배열의 길이만큼 반복
		for (int i = 0; i < gdDto.getGd_code().length; i++) {

			gdDto.setGdcode(gdDto.getGd_code()[i]);
			gdDto.setGdstate(gdDto.getGd_state()[i]);
			gdDto.setGdprice(gdDto.getGd_price()[i]);
			gdDto.setGdname(gdDto.getGd_names()[i]);

			gdStateUPdateResult = rdao.updateResellModify_gd(gdDto);

		}

		System.out.println("상품 업데이트결과 : " + gdStateUPdateResult);

		int ubStateUpdateResult = rdao.updateResellModify_ub(ubDto);

		System.out.println("글번호 : " + ubDto.getUbcode());
		System.out.println(ubDto);
		System.out.println("글 업데이트결과 : " + ubStateUpdateResult); // 글 업데이트 계속 실패 (7월14일) 해결

		// 상세페이지 이동을 위한 파라메터들
		String ubcode = ubDto.getUbcode();
		String ubmid = ubDto.getUbmid();
		String ubsellbuy = ubDto.getUbsellbuy();
		String modifyCheck = "LIST";

		if (ubStateUpdateResult > 0 && gdStateUPdateResult > 0) {
			System.out.println("수정성공");

			ra.addFlashAttribute("msg", "글이 수정되었습니다.");

			mav.setViewName("redirect:/selectResellView?ubcode=" + ubcode + "&ubmid=" + ubmid + "&ubsellbuy="
					+ ubsellbuy + "&modifyCheck=" + modifyCheck);

			// 기존 파일 삭제
			File delFile;
			for (int i = 0; i < deleteFile.size(); i++) {
				System.out.println(deleteFile.get(i));
				delFile = new File(savePath, deleteFile.get(i));
				if (delFile.exists()) { // 해당 파일 있는지 확인 후
					System.out.println(deleteFile.get(i) + "파일 삭제");
					delFile.delete(); // 삭제
				}

			}
		} else {
			System.out.println("수정실패");
			ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	//시간 형식 변경 : 매개변수가 시간인 경우(시간 형식을 변경해서 리턴)
	public String timeFuction(String ubdate) throws ParseException {
		//System.out.println("ResellService.timeFuction(ubdate) 호출");
		//System.out.println(ubdate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date time = sdf.parse(ubdate);
		//System.out.println(time);
		long timeMin = time.getTime(); 
		//System.out.println(timeMin);
		
		Date now = new Date();
		//System.out.println(now);
		long nowMin = now.getTime();
		//System.out.println(nowMin);
				
		long betweenTime = (nowMin - timeMin)/60000;
		//System.out.println(betweenTime);

		
        if (betweenTime < 1) return "방금전";
        if (betweenTime < 60) {
            return betweenTime+"분전";
        }

        long betweenTimeHour = betweenTime / 60;
        if (betweenTimeHour < 24) {
            return betweenTimeHour+"시간전";
        }
		
        long betweenTimeDay = betweenTime / 60 / 24;
        if (betweenTimeDay < 31) {
            return betweenTimeDay+"일전";
        }
        
        return ubdate.substring(0, 16);
	}
	
	//시간 형식 변경 : 매개변수가 리스트인 경우(리스트의 시간을 모두 바꿔서 리스트 반환)
	private ArrayList<UsedBoardDto> timeFuction(ArrayList<UsedBoardDto> resellList) throws Exception {
		System.out.println("ResellService.timeFuction(resellList) 호출");
		
		for (int i = 0; i < resellList.size(); i++) {
			//현재시간 - 작성시간
			String ubdatedef = timeFuction(resellList.get(i).getUbdate());
			//ubdatedef 객체에 저장
			resellList.get(i).setUbdatedef(ubdatedef);
			//ubdate 분까지만 객체에 저장
			resellList.get(i).getUbdate().substring(0,  16);	
		}
		
		return resellList;
	}

	//찜 체크 : 매개변수가 리스트인 경우(리스트의 찜기록 추가해서 리스트 반환)
	private ArrayList<UsedBoardDto> zzimCheck(ArrayList<UsedBoardDto> resellList) {
		System.out.println("ResellService.zzimCheck(resellList) 호출");
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId == null) {
			//비로그인이면 메소드 종료
			return resellList;
		}
		
		for (int i = 0; i < resellList.size(); i++) {
			//loginId가 해당글을 찜 했을 경우 loginId 리턴
			String zzimcheck = rdao.selectZzimCheck(loginId, resellList.get(i).getUbcode());
			
			System.out.println(resellList.get(i).getUbcode()+": "+zzimcheck);
			
			//zzimcheck에 저장
			resellList.get(i).setZzimcheck(zzimcheck);
		}
		
		return resellList;
	}
	

}
