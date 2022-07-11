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
import com.NumberOne.dto.ZzimDto;
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
	public ModelAndView selectResellView(UsedBoardDto ubDto, String modifyCheck) {
		System.out.println("selectResellView 호출");
		System.out.println("ubDto : "+ubDto);
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellView(ubDto, modifyCheck);
		
		return mav;
	}
		
	
	@RequestMapping (value="/loadToResellWriteForm")
	public ModelAndView loadToResellWriteForm(String sell_buy) {
		System.out.println("loadToResellWriteForm 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("타이틀체크 : " + sell_buy);
		
		mav = rsvc.loadToResellWriteForm(sell_buy);
				
		
		return mav;
	}	
	
	@RequestMapping (value="/loadToResellModifyForm")
	public ModelAndView loadToResellModifyForm(UsedBoardDto ubDto, String modifyCheck) {
		System.out.println("loadToResellModifyForm 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.selectResellView(ubDto, modifyCheck);
		
		return mav;
		
	}
	
	@RequestMapping (value="/updateResellDelete")
	public ModelAndView updateResellDelete(UsedBoardDto ubDto, RedirectAttributes ra) {
		System.out.println("updateResellDelete 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = rsvc.updateResellDelete(ubDto, ra);
		
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
	
	@RequestMapping(value="/selectResellRegionList_ajax")
	public @ResponseBody String selectResellRegionList_ajax(Paging paging) {
		
		System.out.println("selectResellRegionList_ajax 요청");
		System.out.println("파라메터확인 : "+ paging);
		String sell_buyList = rsvc.selectResellRegionList_ajax(paging);
				
		return sell_buyList;
		
	}


	
	@RequestMapping(value="/zzimClick_ajax")
	public @ResponseBody String zzimClick_ajax(ZzimDto zzim) {
		System.out.println("zzimClick_ajax 요청");
		System.out.println("파라메터확인 : "+ zzim.getZzubcode());
		System.out.println("파라메터확인 : "+ zzim.getZzmid());
		System.out.println("파라메터확인 : "+ zzim.getZzim_Check());
		
		String zzimCheck = rsvc.zzimClick_ajax(zzim);
				System.out.println("ajax-zzimCheck : " + zzimCheck);
		return zzimCheck;
	}
	
	
	@RequestMapping (value="/selectResellPageList")
	public ModelAndView selectResellPageList(Paging paging) {
		System.out.println("selectResellPageList 호출");
	
		ModelAndView mav = new ModelAndView();
		mav = rsvc.selectResellPageList(paging);
				
		return mav;
	}
	
	 /* 게시글 신고  */
	 //게시글 신고 유무 확인
	 @RequestMapping ( value = "/checkResellWarning_ajax")
	 @ResponseBody
	 public String checkResellWarning_ajax(String loginId, String ubcode ) {
		 System.out.println("게시글 신고 유무 확인 요청_ajax");
		 
		 String wnCheck = rsvc.checkResellWarning_ajax(loginId, ubcode);
		 
		 return wnCheck;
	 }
	 
	 //게시글 신고 
	 @RequestMapping ( value = "/insertResellWarning_ajax")
	 @ResponseBody
	 public int insertResellWarning_ajax(String loginId, String ubcode) {
		 System.out.println("게시글 신고 요청_ajax");
		 
		 int insertResult = rsvc.insertResellWarning_ajax(loginId, ubcode);
		 
		 return insertResult;
	 }
	 //게시글 신고 취소 (신고 중복 클릭 시 )
	 @RequestMapping ( value = "/deleteResellWarning_ajax")
	 @ResponseBody 
	 public int deleteResellWarning_ajax(String loginId, String ubcode ) {
		 System.out.println("게시글 신고 취소 요청_ajax");
		 
		 int deleteResult = rsvc.deleteResellWarning_ajax(loginId, ubcode);
		 
		 return deleteResult;		 
	 }
	 
	 

	
}
