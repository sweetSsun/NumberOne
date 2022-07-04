package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String selectResellView() {
		return "resell/Resell_View";
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
	public String selectResellBuyList() {
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellBuyList();
		
		return null;
	}
	
	@RequestMapping (value="/selectResellSellList")
	public String selectResellSellList() {
	ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellSellList();
		
		return null;
	}
	@RequestMapping (value="/insertResellWrite")
	public ModelAndView insertResellWrite(GoodsDto gdDto, UsedBoardDto ubDto, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		System.out.println(gdDto);
		System.out.println(ubDto);

		ModelAndView mav = new ModelAndView();
		mav = rsvc.insertResellWrite(gdDto, ubDto, ra);
				
		return mav;
	}
	
	
	
	
	
	
	
}
