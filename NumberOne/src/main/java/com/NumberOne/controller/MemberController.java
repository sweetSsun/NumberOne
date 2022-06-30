package com.NumberOne.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	@RequestMapping(value="/memberRegister")
	public ModelAndView memberRegister(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		System.out.println(member);
	
		mav = msvc.memberRegister(ra, member);
		
		return mav;
	}
	
	//아이디 중복 확인 요청
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("아이디 중복 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		String idCheckResult = msvc.memberIdCheck(inputId);
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
	  @RequestMapping("/memberLogin")
	  public ModelAndView memberLogin(String mid , String mpw, RedirectAttributes ra) {
		  System.out.println("로그인 요청");
		  mav = msvc.memberLogin(mid ,mpw, ra);
		  
		  return mav;
	  }
	  
}















