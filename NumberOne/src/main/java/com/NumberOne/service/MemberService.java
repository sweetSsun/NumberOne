package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.MemberDao;
import com.NumberOne.dto.MemberDto;

@Service
public class MemberService {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberDao mdao;
	
	
	 @Autowired private HttpServletRequest request;
	 @Autowired private HttpSession session;
	 
	
	
	
	//프로필 이미지 저장 경로 설정
	private String savePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\mprofileUpLoad";
	
	//회원가입
	public ModelAndView insertRegisterWrite(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
	    System.out.println("MemberService 회원가입 호출");  
		ModelAndView mav = new ModelAndView();   
		System.out.println("MemberService.memberRegister()");
		
	      //이미지 파일
	      MultipartFile mfile = member.getMfile();
	      
	      //이미지의 파일명
	      String mprofile = "";
	      
	      //이미지 파일 처리	      
	      if(!mfile.isEmpty()) {
	         System.out.println("이미지파일확인");
	         UUID uuid = UUID.randomUUID();
	         
	         //파일명 생성
	         mprofile = uuid.toString()+"_"+mfile.getOriginalFilename();
	         //이미지 파일 저장
	         mfile.transferTo(  new File(savePath, mprofile)   );
	      } 
	         
	         System.out.println("mprofile : " + mprofile);
	         member.setMprofile(mprofile);
	         
	         System.out.println(member);
	      
	      
	      // 주소 처리 
	      member.setMaddr( member.getMpostcode()+"_"+member.getMaddress()+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr());

	      // 이메일 처리
	      member.setMemail(member.getMemailId()+"@"+member.getMemailDomain());
	      
	      int joinResult = mdao.insertRegisterWrite(member);
	      
	      if(joinResult != 0) {
				System.out.println("회원가입 가능");
				ra.addFlashAttribute("msg", "회원가입 되었습니다.");
				mav.setViewName("main");
			}else {
				System.out.println("회원가입 실패");
				ra.addFlashAttribute("msg" , "회원가입에 실패하였습니다.");
				mav.setViewName("redirect:/loadToRegister");
			}
	      

	      return mav;
	      
	   }


	//아이디 중복 확인 요청 
	public String selectMemberId_ajax(String inputId) {
		System.out.println("MemberService.selectMemberId_ajax() 호출");
		String idCheckResult = mdao.selectMemberId_ajax(inputId);
		System.out.println(idCheckResult);
		if(idCheckResult == null) {
			return "OK";
		}else {
			return "NO";
		}
	}

	//로그인 요청
	public ModelAndView selectMemberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("MemberService.memberLogin() 호출");
		System.out.println("입력한 아이디 : " + mid);
		System.out.println("입력한 비밀번호 : " + mpw);
		
		ModelAndView mav = new ModelAndView();
		
		MemberDto loginMember = mdao.selectMemberLogin(mid, mpw);
		System.out.println(loginMember);
		
		if( loginMember != null) {
			if(loginMember .getMstate() == 0) {
				ra.addFlashAttribute("msg", "이용 정지 된 계정 입니다.");
				mav.setViewName("redirect:/loadToLogin");
			} else if(loginMember.getMid().equals("admin")) {
				mav.setViewName("redirect:/admin_loadToAdminMainPage");
			} else {
				//로그인 성공
				session.setAttribute("loginId", loginMember.getMid());
				session.setAttribute("loginProfile", loginMember.getMprofile());
				mav.setViewName("redirect:/");				
			}
			
		} else {
			//로그인 실패
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다!.");
			mav.setViewName("redirect:/loadToLogin");
		}
		
		return mav;
	}


	//로그아웃
	public ModelAndView selectMemberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		session.invalidate();
		ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	
	//아이디 찾기 요청
	public String selectLookforId_ajax(String checkMname, String checkMemail) {
		System.out.println("MemberService.selectLookforId_ajax() 호출");
		
		String idCheckResult = mdao.selectLookforId_ajax(checkMname, checkMemail);
		
		System.out.println(idCheckResult);
		
		if(idCheckResult != null) {
			// id 끝에 세자리 *** 
			int idlength = idCheckResult.length();
			idCheckResult = idCheckResult.substring(0, idlength-3);
			idCheckResult = idCheckResult+"***";
			return idCheckResult;
		}else {
			return null;
		}
		
	}

	//회원정보 보기
	public ModelAndView selectMyInfoMemberView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoMemberView 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인 된 아이디 : " + loginId);
		
		MemberDto memberInfo = mdao.selectMyInfoMemberView(loginId);
		
		//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
		String maddr = memberInfo.getMaddr();
		
		if( maddr != null) {
			String[] maddr_arr = maddr.split("_");
			System.out.println(maddr_arr.length);
			if( maddr_arr.length >= 4 ) {
				memberInfo.setMpostcode(maddr_arr[0]);
				memberInfo.setMaddress(maddr_arr[1]);
				memberInfo.setMdetailAddr(maddr_arr[2]);
				memberInfo.setMextraAddr(maddr_arr[3]);
			}
		}
		
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("member/MyInfoMemberPage");
		
		return mav;
	}


		
	}

























