package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.service.MemberService;
import com.NumberOne.service.ResellService;

@Controller
public class ResellController {

	@Autowired
	private ResellService rsvc;
	
	@RequestMapping (value="/loadToResellMainPage")
	public String loadToResellMainPage() {
		return "resell/Resell_Main";
	}
	
	@RequestMapping (value="/selectResellView")
	public ModelAndView selectResellView(String ubcode, String ubsellbuy) {
		System.out.println("selectResellView 호출");
		System.out.println("ubcode : "+ubcode);
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellView(ubcode, ubsellbuy);
		
		return mav;
	}
		
	
	@RequestMapping (value="/loadToResellWriteForm")
	public ModelAndView loadToResellWriteForm(String sell_buy) {
		ModelAndView mav = new ModelAndView();
		System.out.println("타이틀체크 : " + sell_buy);
		
		mav = rsvc.loadToResellWriteForm(sell_buy);
				
		
		return mav;
	}	
	@RequestMapping (value="/selectResellModify")
	public String selectResellModify() {
		return "resell/Resell_ModifyForm";
	}
	

	@RequestMapping (value="/insertResellWrite")
	public ModelAndView insertResellWrite(GoodsDto gdDto, UsedBoardDto ubDto, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("insertResellWrite 호출");
		System.out.println(gdDto);
		System.out.println(ubDto);

		ModelAndView mav = new ModelAndView();
		mav = rsvc.insertResellWrite(gdDto, ubDto, ra);
				
		return mav;
	}
	
	@RequestMapping(value="/selectResellRegionList_ajax")
	public @ResponseBody String selectResellRegionList_ajax(String selRegion, String sell_buy) {
		System.out.println("selectResellRegionList_ajax 요청");
		System.out.println("파라메터확인 : "+ selRegion);
		String sell_buyList = rsvc.selectResellRegionList_ajax(selRegion, sell_buy);
		
		return sell_buyList;
		
	}
	

	@RequestMapping(value="/zzimClick_ajax")
	public @ResponseBody String zzimClick_ajax(String zzubcode, String zzmid, int zzim_num) {
		System.out.println("zzimClick_ajax 요청");
		System.out.println("파라메터확인 : "+ zzubcode);
		System.out.println("파라메터확인 : "+ zzmid);
		System.out.println("파라메터확인 : "+ zzim_num);
		
		String zzimCheck = rsvc.zzimClick_ajax(zzubcode, zzmid, zzim_num);
				
		return zzimCheck;
	}
	
	
	@RequestMapping (value="/selectResellPageList")
	public ModelAndView selectResellPageList(String sell_buy, String select_page, String selectRegion) {
		System.out.println("selectResellPageList 호출");
	

		ModelAndView mav = new ModelAndView();
		mav = rsvc.selectResellPageList(sell_buy, select_page, selectRegion);
				
		return mav;
	}
	
	@RequestMapping(value="/selectSearchList_ajax")
	public @ResponseBody String selectSearchList_ajax(String searchVal, String sell_buy, String selectRegion, String searchOp) {
		System.out.println("selectSearchList_ajax 요청");
		System.out.println("파라메터확인 searchVal : "+ searchVal);
		System.out.println("파라메터확인 sell_buy : "+ sell_buy);
		System.out.println("파라메터확인 selectRegion : "+ selectRegion);
		System.out.println("파라메터확인 searchOp : "+ searchOp);
		
		String searchResult = rsvc.selectSearchList_ajax(searchVal, sell_buy, selectRegion, searchOp);
				
		return searchResult;
	}
	
	
}
