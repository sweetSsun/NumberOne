package com.NumberOne.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.service.MemberService;

@Controller
public class MemberController {
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	@Autowired 
	private HttpSession session;
	
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
	
	//닉네임 중복 확인 요청
	@RequestMapping(value = "/selectMemberNickname_ajax")
	public @ResponseBody String selectMemberNickname_ajax(String inputNickname) {
		System.out.println("닉네임 중복 확인 요청");
		System.out.println("입력한 닉네임 : " + inputNickname);
		String nicknameCheckResult = msvc.selectMemberNickname_ajax(inputNickname);
		return nicknameCheckResult;  
	}	
	
	
	
	//로그인 페이지 이동
	@RequestMapping(value="/loadToLogin")
	public ModelAndView loadToLogin(String afterUrl) {
		System.out.println("로그인 페이지 요청");
		mav = new ModelAndView();
		System.out.println("afterUrl: "+afterUrl);
		if(afterUrl != null) {
			session.setAttribute("afterUrl", afterUrl);						
		} else {
			session.setAttribute("afterUrl", "noUrl");			
		}
		System.out.println((String)session.getAttribute("afterUrl"));
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
			String idCheckResult = msvc.selectLookforId_ajax(checkMname , checkMemail);
			
			return idCheckResult;  
		}	
		
		//비밀번호 찾기 페이지 이동
		@RequestMapping(value="/loadToLookforPw")
		public ModelAndView loadToLookforPw() {
			System.out.println("비밀번호 찾기 페이지 요청");
			mav = new ModelAndView();
			mav.setViewName("member/LookforPwForm");
			//mav.setViewName("LookforPwForm");
			return mav;
		}		
		  
		//비밀번호 찾기 기능 필요함...
		
		//회원정보 보기
		@RequestMapping(value = "/selectMyInfoMemberView")
		public ModelAndView selectMyInfoMemberView() {
			System.out.println("마이페이지 회원정보 이동 요청");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoMemberView();
			
			return mav;
			
		}
		
		//회원정보 수정페이지 이동
		
		@RequestMapping(value = "/loadToMyInfoModifyForm")
		public ModelAndView loadToMyInfoModifyForm() {
			System.out.println("마이페이지 회원정보수정페이지 이동 요청");
			mav = new ModelAndView();
			mav = msvc.loadToMyInfoModifyForm();
			

			
			mav.setViewName("member/MyInfoMemberModifyForm");
			return mav;
			
		}		

		//회원정보 수정 요청

		@RequestMapping(value="/updateMyInfoMemberModify")
		public ModelAndView updateMyInfoMemberModify(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
			System.out.println("마이페이지 회원정보수정 요청");
			mav = new ModelAndView();
			mav = msvc.updateMyInfoMemberModify(ra, member);
			
			return mav;
		}
		
		//회원탈퇴
		@RequestMapping(value="/updateMemberWithdraw")
		public ModelAndView updateMemberWithdraw(RedirectAttributes ra) throws IllegalStateException, IOException {
			System.out.println("마이페이지 회원정보수정 요청");
			mav = new ModelAndView();
			mav = msvc.updateMemberWithdraw(ra);
			
			return mav;
		}		
		
		
		
		//마이페이지 커뮤니티 
		@RequestMapping(value = "/selectMyInfoCommunityView")
		public ModelAndView selectMyInfoCommunityView() {
			System.out.println("마이페이지 커뮤니티");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoCommunityView();
			
			return mav;
			
		}		
		
		//마이페이지 중고거래
		
		@RequestMapping(value = "/selectMyInfoResellView")
		public ModelAndView selectMyInfoResellView() {
			System.out.println("마이페이지 중고거래");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoResellView();
			
			return mav;
	
		}
		
		
		//마이페이지 1:1 문의 내역 / 상세
		
		@RequestMapping(value = "/selectMyInfoQuestionListView")
		public ModelAndView selectMyInfoQuestionListView() {
			System.out.println("마이페이지 1:1 문의 목록 / 상세");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoQuestionListView();
			
			return mav;
	
		}	
		
		//마이페이지 1:1 문의 작성페이지 이동 
		@RequestMapping(value = "/loadToMyInfoQuestionForm")
		public ModelAndView loadToMyInfoQuestionForm() {
			System.out.println("마이페이지 1:1 문의 작성페이지 이동");
			mav = new ModelAndView();
			mav = msvc.loadToMyInfoQuestionForm();
			
			return mav;
	
		}	

		//마이페이지 1:1 문의 작성 요청
		@RequestMapping(value = "/insertMyInfoQuestionWrite")
		public ModelAndView insertMyInfoQuestionWrite(ContactDto contact, RedirectAttributes ra) throws IllegalStateException, IOException {
			System.out.println("마이페이지 1:1 문의 작성요청");
			mav = new ModelAndView();
			mav = msvc.insertMyInfoQuestionWrite(contact,ra);
			
			return mav;
	
		}		
		//작성자 상세페이지 _ Board
		@RequestMapping(value = "/selectWriteMemberInfo")
		public ModelAndView selectWriteMemberInfo(String nickname) {
			System.out.println("작성자 상세페이지 _ Board");
			mav = new ModelAndView();
			System.out.println("controller.nickname : " + nickname);
			mav = msvc.selectWriteMemberInfo(nickname);
			return mav;
			
		}
		
		//카카오아이디 중복 확인
		@RequestMapping(value = "/memberKakaoLogin")
		public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
			System.out.println("카카오로 로그인 요청");
			//System.out.println(member);
			ModelAndView mav = msvc.memberKakaoLogin(member, ra);
			
			return mav;
			
		}
		
		//카카오 회원가입
		@RequestMapping(value="/insertKakaoRegister")
		public ModelAndView insertKakaoRegister(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
			System.out.println("카카오 가입");
			System.out.println(member);
			mav = new ModelAndView();
			mav = msvc.insertKakaoRegister(ra, member);
			
			return mav;
		}
		
		
		
		//비밀번호 찾기 - 회원 정보 확인
		@RequestMapping(value = "/selectLookforPw_ajax")
		public @ResponseBody String selectLookforPw_ajax(String checkMid , String checkMemail, MemberDto member) {
			System.out.println("비밀번호 찾기 요청");
			System.out.println("입력한 아이디 : " + checkMid);
			System.out.println("입력한 메일 : " + checkMemail);
			String pwCheckResult = msvc.selectLookforPw_ajax(checkMid , checkMemail);
			
			return pwCheckResult;  
		}	
	
		
}













