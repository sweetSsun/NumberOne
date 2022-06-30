package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
	 
	
	
	
	//저장경로 설정
	private String savePath = "C:\\NumberOne\\NumberOne\\src\\main\\webapp\\resources\\img\\mprofileUpLoad";

	//연결test
	public String test1() {
		String Test1 = mdao.test1();
		System.out.println("Test1 : " + Test1);
		return Test1;
	}
	
	
	//회원가입
	public ModelAndView memberRegister(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
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
	      
	      int joinResult = mdao.insertMemberRegister(member);
	      
	      if(joinResult != 0) {
				System.out.println("회원가입 가능");
				ra.addFlashAttribute("msg", "회원가입 되었습니다.");
				mav.setViewName("Main");
			}else {
				System.out.println("회원가입 실패");
				ra.addFlashAttribute("msg" , "회원가입에 실패하였습니다.");
				mav.setViewName("redirect:/loadToRegister");
			}
	      

	      return mav;
	      
	   }


	//아이디 중복 확인 요청 
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck() 호출");
		String idCheckResult = mdao.selectCheckMid(inputId);
		System.out.println(idCheckResult);
		if(idCheckResult == null) {
			return "OK";
		}else {
			return "NO";
		}
	}

	//로그인 요청
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
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
			}else {
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}






















