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
		mav.addObject("sell_buy", sell_buy);
		mav.setViewName("resell/Resell_WriteForm");
		
		return mav;
	}	
	@RequestMapping (value="/selectResellModify")
	public String selectResellModify() {
		return "resell/Resell_ModifyForm";
	}
	
	@RequestMapping (value="/selectResellBuyList")
	public ModelAndView selectResellBuyList() {
		System.out.println("selectResellBuyList 요청");
		ModelAndView mav = new ModelAndView();	
		
		mav = rsvc.selectResellBuyList();
	
		return mav;
	}
	
	@RequestMapping (value="/selectResellSellList")
	public ModelAndView selectResellSellList() {
		System.out.println("selectResellSellList 요청");
	ModelAndView mav = new ModelAndView();		
		mav = rsvc.selectResellSellList();
		
		return mav;
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
	
	@RequestMapping(value="/selectRegion_sellList_ajax")
	public @ResponseBody String selectRegion_sellList_ajax(String selectRegion) {
		System.out.println("selectRegion_sellList_ajax 요청");
		System.out.println("파라메터확인 : "+ selectRegion);
		String sellList_json = rsvc.selectRegion_sellList_ajax(selectRegion);
		
		return sellList_json;
		
	}
	@RequestMapping(value="/selectRegion_buyList_ajax")
	public @ResponseBody String selectRegion_buyList_ajax(String selectRegion) {
		System.out.println("selectRegion_buyList_ajax 요청");
		System.out.println("파라메터확인 : "+ selectRegion);
		String buyList_json = rsvc.selectRegion_buyList_ajax(selectRegion);
				
		return buyList_json;
	}
	
	@RequestMapping (value="/selectPage_sellList")
	public ModelAndView selectPage_sellList(String select_page, String selectRegion) {
		System.out.println("selectPage_sellList 호출");
	

		ModelAndView mav = new ModelAndView();
		mav = rsvc.selectPage_sellList(select_page, selectRegion);
				
		return mav;
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
	
	
}
