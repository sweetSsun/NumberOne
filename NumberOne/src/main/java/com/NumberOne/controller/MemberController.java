package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.view.RedirectView;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.NumberOne.dto.MemberDto;
import com.NumberOne.service.MemberService;

@Controller
public class MemberController {
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	
	//회원가입 페이지 이동
	@RequestMapping(value="/loadToRegister")
	public ModelAndView loadToRegister() {
		System.out.println("회원가입페이지 페이지 요청");
		mav = new ModelAndView();
		mav.setViewName("member/MemberRegisterForm");
		return mav;
	}	
	
	//회원가입 요청 
	@RequestMapping(value="/insertRegisterWrite")
	public ModelAndView insertRegisterWrite(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		System.out.println(member);
	
		mav = msvc.insertRegisterWrite(ra, member);
		
		return mav;
	}
	
	//아이디 중복 확인 요청
	@RequestMapping(value = "/selectMemberId_ajax")
	public @ResponseBody String selectMemberId_ajax(String inputId) {
		System.out.println("아이디 중복 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		String idCheckResult = msvc.selectMemberId_ajax(inputId);
		return idCheckResult;  
	}
	
	
	//로그인 페이지 이동
	@RequestMapping(value="/loadToLogin")
	public ModelAndView loadToLogin() {
		System.out.println("로그인 페이지 요청");
		mav = new ModelAndView();
		mav.setViewName("member/MemberLoginForm");
		return mav;
	}	
	
	//로그인 요청
	  @RequestMapping("/selectMemberLogin")
	  public ModelAndView selectMemberLogin(String mid , String mpw, RedirectAttributes ra) {
		  System.out.println("로그인 요청");
		  mav = msvc.selectMemberLogin(mid ,mpw, ra);
		  
		  return mav;
	  }
	  
	  //로그아웃
		@RequestMapping(value = "/selectMemberLogout")
		public ModelAndView selectMemberLogout(RedirectAttributes ra) {
			System.out.println("로그아웃 요청");
			
			mav = msvc.selectMemberLogout(ra);
			return mav;
		}  
		
		//아이디 찾기 페이지 이동
		@RequestMapping(value="/loadToLookforId")
		public ModelAndView loadToLookforId() {
			System.out.println("아이디 찾기 페이지 요청");
			mav = new ModelAndView();
			mav.setViewName("member/LookforIdForm");
			return mav;
		}		

		
		//아이디 찾기 요청
		@RequestMapping(value = "/selectLookforId_ajax")
		public @ResponseBody String selectLookforId_ajax(String checkMname , String checkMemail) {
			System.out.println("아이디 찾기 요청");
			System.out.println("입력한 이름 : " + checkMname);
			System.out.println("입력한 메일 : " + checkMemail);
			String idCheckResult = msvc.selectMemberId_ajax(checkMname , checkMemail);
			
			return idCheckResult;  
		}	
		
		//비밀번호 찾기 페이지 이동
		@RequestMapping(value="/loadToLookforPw")
		public ModelAndView loadToLookforPw() {
			System.out.println("비밀번호 찾기 페이지 요청");
			mav = new ModelAndView();
			mav.setViewName("member/LookforPwForm");
			return mav;
		}		
		  
}















