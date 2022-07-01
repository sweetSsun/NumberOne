package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.NumberOne.service.MemberService;

@Controller
public class ResellController {

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
	public String loadToResellWriteForm() {
		return "resell/Resell_WriteForm";
	}	
	@RequestMapping (value="/selectResellModify")
	public String selectResellModify() {
		return "resell/Resell_ModifyForm";
	}
	
	@RequestMapping (value="/selectResellBuyList")
	public String selectResellBuyList() {
		return "resell/Resell_BuyList";
	}
	
}
