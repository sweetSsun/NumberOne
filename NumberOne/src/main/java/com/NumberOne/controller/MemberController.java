package com.NumberOne.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dto.ChatMessageDto;
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
	public ModelAndView loadToLogin(String afterUrl, RedirectAttributes ra) {
		System.out.println("로그인 페이지 요청");
		mav = new ModelAndView();
		//System.out.println("afterUrl: "+afterUrl);
		
		if(session.getAttribute("loginId")!=null) {
			//System.out.println("로그인되어있어서 메인으로");
			ra.addFlashAttribute("msg" , "이미 로그인 상태입니다.");
			mav.setViewName("redirect:/");
			
		} else {
			if(afterUrl != null) {
				session.setAttribute("afterUrl", afterUrl);						
			}
			System.out.println((String)session.getAttribute("afterUrl"));
			mav.setViewName("member/MemberLoginForm");
		}
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
		public ModelAndView selectMyInfoCommunityView(RedirectAttributes ra) {
			System.out.println("마이페이지 커뮤니티");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoCommunityView(ra);
			
			return mav;
			
		}		
		
		//마이페이지 중고거래
		
		@RequestMapping(value = "/selectMyInfoResellView")
		public ModelAndView selectMyInfoResellView(RedirectAttributes ra) {
			System.out.println("마이페이지 중고거래");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoResellView(ra);
			
			return mav;
	
		}
		
		
		//마이페이지 1:1 문의 내역 / 상세
		
		@RequestMapping(value = "/selectMyInfoQuestionListView")
		public ModelAndView selectMyInfoQuestionListView(RedirectAttributes ra) {
			System.out.println("마이페이지 1:1 문의 목록 / 상세");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoQuestionListView(ra);
			
			return mav;
	
		}	
		
		//마이페이지 1:1 문의 작성페이지 이동 
		@RequestMapping(value = "/loadToMyInfoQuestionForm")
		public ModelAndView loadToMyInfoQuestionForm(RedirectAttributes ra) {
			System.out.println("마이페이지 1:1 문의 작성페이지 이동");
			mav = new ModelAndView();
			mav = msvc.loadToMyInfoQuestionForm(ra);
			
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
		// (삭제 예정) 작성자 상세페이지 _ Board
		/*@RequestMapping(value = "/selectWriteMemberInfo_ajax")
		public @ResponseBody String selectWriteMemberInfo_ajax (String nickname) {
			System.out.println("작성자 상세페이지 _ selectWriteMemberInfo");
			System.out.println("controller.nickname : " + nickname);
			String boardList_ajax = msvc.selectWriteMemberInfo_ajax(nickname);
			return boardList_ajax;
			
		}*/

		
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
		
		
		/* 현석 :  mail API 에러 때문에 주석처리 시작
		//비밀번호 찾기 - 회원 정보 확인
		@RequestMapping(value = "/selectLookforPw_ajax")
		public @ResponseBody String selectLookforPw_ajax(String checkMid , String checkMemail, MemberDto member) {
			System.out.println("비밀번호 찾기 요청");
			System.out.println("입력한 아이디 : " + checkMid);
			System.out.println("입력한 메일 : " + checkMemail);
			String pwCheckResult = msvc.selectLookforPw_ajax(checkMid , checkMemail);
			
			return pwCheckResult;  
		}	
현석 :  mail API 에러 때문에 주석처리 끝	*/
		

		//마이페이지 미니브라우저 & 프로필가져오기
		@RequestMapping(value="/loadToWriteMemberBoard")
		public ModelAndView loadToWriteMemberBoard(String nickname) {
			System.out.println("미니브라우저 마이페이지 Board 페이지 요청");
			mav = new ModelAndView();
			System.out.println("미니브라우저 닉네임 : "+nickname);
			mav = msvc.selectWriteMemberInfo_member(nickname);
			mav.setViewName("member/WriteMemberInfoPage");
			
			return mav;
		}
		
		
		//미니브라우저 작성자 상세페이지 _ Board
		@RequestMapping(value = "/selectWriteMemberInfo_ajax")
		public @ResponseBody String selectWriteMemberInfo_ajax (String nickname) {
			System.out.println("작성자 상세페이지 _ selectWriteMemberInfo");
			System.out.println("controller.nickname : " + nickname);
			String boardList_gson = msvc.selectWriteMemberInfo_ajax(nickname);
			return boardList_gson;
			
		}
		//미니브라우저 작성자 상세페이지 _ Reply
		@RequestMapping(value = "/selectWriteMemberInfoReply_ajax")
		public @ResponseBody String selectWriteMemberInfoReply_ajax (String nickname) {
			System.out.println("작성자 상세페이지 _ selectWriteMemberInfoReply_ajax");
			System.out.println("controller.nickname : " + nickname);
			String replyList_gson = msvc.selectWriteMemberInfoReply_ajax(nickname);
			return replyList_gson;
			
		}	
		
		//미니브라우저 작성자 상세페이지 _ SellBuy
		@RequestMapping(value = "/selectWriteMemberInfoSellBuy_ajax")
		public @ResponseBody String selectWriteMemberInfoSellBuy_ajax (String nickname) {
			System.out.println("작성자 상세페이지 _ selectWriteMemberInfoReply_ajax");
			System.out.println("controller.nickname : " + nickname);
			String ubList_gson = msvc.selectWriteMemberInfoSellBuy_ajax(nickname);
			return ubList_gson;
			
		}

		// 찜목록 조회
		@RequestMapping(value = "/selectZzimList_ajax")
		public @ResponseBody String selectZzimList_ajax(String loginId) throws ParseException {
			System.out.println("찜목록 조회 요청");
			String zzimList_gson = msvc.selectZzimList_ajax(loginId);
			return zzimList_gson;
		}

	      // 회원 신고 확인 요청
	      @RequestMapping(value="/checkMemberWarning_ajax")
	      public @ResponseBody String checkMemberWarning_ajax(String loginId, String wmedNickname) {
	         System.out.println("회원 신고 확인 요청");
	         String mbwnCheck = msvc.checkMemberWarning_ajax(loginId, wmedNickname);
	         return mbwnCheck;
	      }
	      
	      // 회원 신고
	      @RequestMapping(value="/insertMemberWarning_ajax")
	      public @ResponseBody int insertMemberWarning_ajax(String loginId, String wmedNickname) {
	         System.out.println("회원 신고 요청");
	         int insertResult = msvc.insertMemberWarning_ajax(loginId, wmedNickname);
	         return insertResult;
	      }

	  	//이메일 중복 확인 요청
	  	@RequestMapping(value = "/selectMemberEmail_ajax")
	  	public @ResponseBody String selectMemberEmail_ajax(String inputEmail) {
	  		System.out.println("이메일 중복 확인 요청");
	  		System.out.println("입력한 이메일 : " + inputEmail);
	  		String emailCheckResult = msvc.selectMemberEmail_ajax(inputEmail);
	  		return emailCheckResult;  
	  	}
	  	
		
		//마이페이지 공구
		
		@RequestMapping(value = "/selectMyInfoGonguView")
		public ModelAndView selectMyInfoGonguView(RedirectAttributes ra) {
			System.out.println("마이페이지 공구");
			mav = new ModelAndView();
			mav = msvc.selectMyInfoGonguView(ra);
			
			return mav;
	
		}
		
	  	
	  	
		

}













