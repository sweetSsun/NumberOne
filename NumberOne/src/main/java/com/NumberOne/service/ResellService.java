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

import com.NumberOne.dao.ResellDao;
import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.PageDto;
import com.NumberOne.dto.UsedBoardDto;
import com.google.gson.Gson;

@Service
public class ResellService {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	@Autowired
	ResellDao rdao;

	public ModelAndView insertResellWrite(GoodsDto gdDto, UsedBoardDto ubDto, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("insertResellWrite 서비스호출");

		String savePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\resell";

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
			ra.addFlashAttribute("msg", "글이 작성되었습니다.");
			if (ubDto.getUbsellbuy() == "B") {

				mav.setViewName("redirect:/selectResellBuyList?sell_buy=B");
			} else {
				mav.setViewName("redirect:/selectResellSellList?sell_buy=S");
			}
		} else {
			ra.addFlashAttribute("msg", "글 작성에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}

		return mav;

	}


//   중고거래리스트 selected 지역으로 조회
	public String selectResellRegionList_ajax(String selRegion, String sell_buy) {
		System.out.println("selectResellRegionList_ajax 서비스 호출");

		String mregion = rdao.selectRegionCode(selRegion);
		System.out.println("파라메터지역코드 : " + mregion);
		System.out.println("사구팔구확인 : " + sell_buy);
		ArrayList<UsedBoardDto> sellbuyList = rdao.selectResellRegionList_ajax(mregion, sell_buy);

		System.out.println(sellbuyList);
		Gson gson = new Gson();
		String sell_buyList = gson.toJson(sellbuyList);

		return sell_buyList;

	}

	public ModelAndView selectResellView(String ubcode, String ubsellbuy) {
		System.out.println("selectResellView 서비스 호출");
		ModelAndView mav = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		UsedBoardDto ub_resellView = rdao.selectResellView(ubcode, ubsellbuy);

		GoodsDto gd_resellView = rdao.selectResellView_goods(ubcode);

		String zzimCheck = rdao.selectZzimCheck(loginId, ubcode);

//		String[] ubDetailImg = ub_resellView.getUbdetailimg().split("__");
//		
//		ub_resellView.setUbdetailimgfile(ub_resellView.getUbdetailimg().split("__"));

		mav.addObject("zzimCheck", zzimCheck);
		mav.addObject("ub_resellView", ub_resellView);
		mav.addObject("gd_resellView", gd_resellView);
		mav.setViewName("resell/Resell_View");

		return mav;

	}


	public String zzimClick_ajax(String zzubcode, String zzmid, int zzim_num) {
		System.out.println("zzimClick_ajax 서비스 호출");
		int zzimResult = 0;
		String zzimCheck = null;
		if (zzim_num == 0) {
			zzimResult = rdao.zzimClick_ajax_delete(zzubcode, zzmid);
		} else if (zzim_num == 1) {
			zzimResult = rdao.zzimClick_ajax_insert(zzubcode, zzmid);
		}
		if (zzimResult > 0) {
			zzimCheck = rdao.selectZzimCheck(zzmid, zzubcode);
		}

		return zzimCheck;
	}

	public ModelAndView loadToResellWriteForm(String sell_buy) {
		System.out.println("loadToResellWriteForm 서비스 호출");
		ModelAndView mav = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		String mNickname = rdao.loadToResellWriteForm(loginId);

		mav.addObject("mNickname", mNickname);
		mav.addObject("sell_buy", sell_buy);
		mav.setViewName("resell/Resell_WriteForm");

		return mav;
	}

//         사구 팔구 통합
	public ModelAndView selectResellPageList(String sell_buy, String select_page, String selectRegion) {
	
		System.out.println("selectResellPageList 서비스 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("사구팔구확인 : " + sell_buy);
		int pageNum = 1;
		String mregion = null;
		if (select_page != null) {
			pageNum = Integer.parseInt(select_page);
			System.out.println(" 페이지번호 :" + pageNum);
		}

		if (selectRegion == null) {

			mregion = rdao.selectRegionCode((String) session.getAttribute("loginRegion"));
			System.out.println("관심지역 : " + mregion);
		} else {
			mregion = rdao.selectRegionCode(selectRegion);
			System.out.println("파라메터지역 : " + mregion);
		}
		int pageCount = 2;
		int pageNumCount = 2;

		// 선택된 페이지에 pageCount 숫자 만큼의 행 출력을 하기 위해서 ArrayList에 매개값으로 사용 할 변수선언
		int startRow = (pageNum - 1) * pageCount + 1; // 출력할 시작 글번호. 1페이지면 1번글. 2페이지면 5번글부터
		int endRow = pageNum * pageCount; // 출력할 마지막 글번호. 1페이지면 4번글까지, 2페이지면 8번글까지

		ArrayList<UsedBoardDto> sell_buyList = rdao.selectResellPageList(sell_buy, mregion, startRow, endRow);
		int pageTotalCount = rdao.selectPageTotalCount(mregion, sell_buy);

		int maxPage = (int) (Math.ceil((double) pageTotalCount / pageNumCount));
		int startPage = (int) ((Math.ceil((double) pageNum / pageNumCount)) - 1) * pageNumCount + 1;
		System.out.println("시작페이지 : " + startPage);
		int endPage = startPage + pageNumCount - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageDto ubpage = new PageDto();
		ubpage.setEndPage(endPage);
		ubpage.setMaxPage(maxPage);
		ubpage.setPage(pageNum);
		ubpage.setStartPage(startPage);

		System.out.println("페이지 : " + ubpage);

		System.out.println(sell_buyList);

		mav.addObject("ubpage", ubpage);
		mav.addObject("sell_buyList", sell_buyList);
		
		System.out.println("셀바이 : " +sell_buy);
		if (sell_buy.equals("S")) {
			System.out.println("조건문S");
			mav.setViewName("resell/Resell_SellList");
			
		} else if (sell_buy.equals("B")) {
			System.out.println("조건문B");
			mav.setViewName("resell/Resell_BuyList");
		}
		return mav;

	}


	public String selectSearchList_ajax(String searchVal, String sell_buy, String selectRegion, String searchOp) {
		System.out.println("selectSearchList_ajax 서비스 호출");
		
		String searchResult = rdao.selectSearchList_ajax(searchVal, sell_buy, selectRegion, searchOp);
				
		return searchResult;
	}
}