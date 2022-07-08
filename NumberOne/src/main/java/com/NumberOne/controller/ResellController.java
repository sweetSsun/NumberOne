package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.service.ResellService;

@Controller
public class ResellController {

	@Autowired
	private ResellService rsvc;
	
	@RequestMapping (value="/selectResellMainPage")
	public ModelAndView selectResellMainPage(Paging paging) {
		System.out.println("selectResellMainPage 호출");
		ModelAndView mav = new ModelAndView();
		
		mav=rsvc.selectResellMainPage(paging);
		
		return mav;
		
		
	}
	
	@RequestMapping (value="/selectResellView")
	public ModelAndView selectResellView(UsedBoardDto ubDto) {
		System.out.println("selectResellView 호출");
		System.out.println("ubDto : "+ubDto);
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellView(ubDto);
		
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
	public @ResponseBody String selectResellRegionList_ajax(Paging paging) {
		
		System.out.println("selectResellRegionList_ajax 요청");
		System.out.println("파라메터확인 : "+ paging);
		String sell_buyList = rsvc.selectResellRegionList_ajax(paging);
		
		
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
	public ModelAndView selectResellPageList(Paging paging) {
		System.out.println("selectResellPageList 호출");
	
		ModelAndView mav = new ModelAndView();
		mav = rsvc.selectResellPageList(paging);
				
		return mav;
	}

	
}
