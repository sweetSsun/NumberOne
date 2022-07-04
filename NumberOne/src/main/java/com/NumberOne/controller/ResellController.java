package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.service.MemberService;

@Controller
public class ResellController {

	ModelAndView mav;

	@Autowired
	private MemberService mscv;
	
	
	@RequestMapping (value="/loadToResellMainPage")
	public String loadToResellMainPage() {
		return "resell/Resell_Main";
	}
	
	@RequestMapping (value="/selectResellView")
	public String selectResellView() {
		return "resell/Resell_View";
	}
	@RequestMapping (value="/loadToResellWriteForm")
	public ModelAndView loadToResellWriteForm(String titleCheck) {
		
		System.out.println("타이틀체크 : " + titleCheck);
					
		mav.addObject("titleCheck", titleCheck);
		mav.setViewName("Resell_WriteForm");
		return mav;
	}	
	@RequestMapping (value="/selectResellModify")
	public String selectResellModify() {
		return "resell/Resell_ModifyForm";
	}
	
	@RequestMapping (value="/selectResellBuyList")
	public String selectResellBuyList() {
		
		return "resell/Resell_BuyList";
	}
	
	@RequestMapping (value="/selectResellSellList")
	public String selectResellSellList() {
		return "resell/Resell_SellList";
	}
	
	
	
}
