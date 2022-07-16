package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.MemberDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.dto.ScrapDto;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.dto.ZzimDto;
import com.google.gson.Gson;

@Service
public class MemberService {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberDao mdao;
	
	/*	현석 :  mail API 에러 때문에 주석처리 시작 
	@Autowired
	private JavaMailSender mailSender;
	 현석 :  mail API 에러 때문에 주석처리 끝 */ 
	
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
	      
	      
	      String message = member.getMmessage();
	      if(message.length()==0) {
	    	  member.setMmessage("안녕하세요!");
	      }

	      System.out.println(member);
	      
	      
	      
	      int joinResult = mdao.insertRegisterWrite(member);
	      
	      if(joinResult != 0) {
				System.out.println("회원가입 가능");
				ra.addFlashAttribute("msg", "회원가입 되었습니다.");
				mav.setViewName("redirect:/loadToLogin");
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
	//닉네임 중복 확인 요청
	public String selectMemberNickname_ajax(String inputNickname) {
		System.out.println("MemberService.selectMemberNickname_ajax() 호출");
		String nicknameCheckResult = mdao.selectMemberNickname_ajax(inputNickname);
		System.out.println(nicknameCheckResult);
		if(nicknameCheckResult == null) {
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


			}else if(loginMember.getMid().equals("admin")) {


				session.setAttribute("loginId", loginMember.getMid());
				session.setAttribute("loginNickname", loginMember.getMnickname());
				mav.setViewName("redirect:/admin_loadToAdminMainPage");
			
			}else if(loginMember .getMstate() == 2){
				ra.addFlashAttribute("msg", "탈퇴 처리 된 회원입니다.");
				mav.setViewName("redirect:/loadToLogin");				
			
			}else {

				//로그인 성공
				session.setAttribute("loginId", loginMember.getMid());
				session.setAttribute("loginProfile", loginMember.getMprofile());
				session.setAttribute("loginRegion", loginMember.getMregion());
				session.setAttribute("loginNickname", loginMember.getMnickname());
				
				System.out.println((String) session.getAttribute("loginId"));
			    System.out.println((String) session.getAttribute("loginRegion"));
			    System.out.println((String) session.getAttribute("loginProfile"));
			    System.out.println((String) session.getAttribute("loginNickname"));
			    
				ra.addFlashAttribute("msg", "로그인 되었습니다.");
				
				String afterUrl = (String) session.getAttribute("afterUrl");
				//System.out.println(afterUrl);
				session.removeAttribute("afterUrl");
				
				if(afterUrl.equals("noUrl")) {
					//afterUrl 없는 경우는 메인으로 이동
					mav.setViewName("redirect:/");				
				} else {					
					//afterUrl 있는 경우는 해당페이지로 이동
					mav.setViewName("redirect:/"+afterUrl);
				}
	
			}
			
		} else {
			//로그인 실패
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다.");
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

	//마이페이지 회원정보
	public ModelAndView selectMyInfoMemberView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoMemberView 호출");

		String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}
		
		System.out.println("로그인 된 아이디 : " + loginId);
		
		MemberDto memberInfo = mdao.selectMyInfoMemberView(loginId);
		
		//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
		String maddr = memberInfo.getMaddr();
		System.out.println(maddr);
		
		if( maddr != null) {
			String[] maddr_arr = maddr.split("_");
			System.out.println(maddr_arr.length);

			 if( maddr_arr.length == 4 ) { 
				memberInfo.setMpostcode(maddr_arr[0]);
				memberInfo.setMaddress(maddr_arr[1]);
				memberInfo.setMdetailAddr(maddr_arr[2]);
				memberInfo.setMextraAddr(maddr_arr[3]);
			 } else if (maddr_arr.length == 3){
				 memberInfo.setMpostcode(maddr_arr[0]);
					memberInfo.setMaddress(maddr_arr[1]);
					memberInfo.setMdetailAddr(maddr_arr[2]);
					//memberInfo.setMextraAddr(maddr_arr[3]); 
			 } else if (maddr_arr.length == 2) {
					memberInfo.setMpostcode(maddr_arr[0]);
					memberInfo.setMaddress(maddr_arr[1]);
			 }
		}
		System.out.println(memberInfo.getMpostcode());
		System.out.println(memberInfo.getMaddress());
		System.out.println(memberInfo.getMdetailAddr());
		System.out.println(memberInfo.getMextraAddr());
		
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("member/MyInfoMemberPage");
		
		return mav;
	}

	//회원정보 수정 페이지
	public ModelAndView loadToMyInfoModifyForm() {
		  
		  ModelAndView mav = new ModelAndView();
		  System.out.println("MemberService.loadToMyInfoModifyForm() 호출"); 
		  String loginId = (String) session.getAttribute("loginId");
			/*String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}*/
		  
		  
		  System.out.println("로그인 된 아이디 : " + loginId);
			
			MemberDto memberInfo = mdao.selectMyInfoMemberView(loginId);
			
			//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
			String maddr = memberInfo.getMaddr();
			
			if( maddr != null) {
				String[] maddr_arr = maddr.split("_");
				System.out.println(maddr_arr.length);

				 if( maddr_arr.length == 4 ) { 
					memberInfo.setMpostcode(maddr_arr[0]);
					memberInfo.setMaddress(maddr_arr[1]);
					memberInfo.setMdetailAddr(maddr_arr[2]);
					memberInfo.setMextraAddr(maddr_arr[3]);
				 } else if (maddr_arr.length == 3){
					 memberInfo.setMpostcode(maddr_arr[0]);
						memberInfo.setMaddress(maddr_arr[1]);
						memberInfo.setMdetailAddr(maddr_arr[2]);
						//memberInfo.setMextraAddr(maddr_arr[3]); 
				 } else if (maddr_arr.length == 2){
						memberInfo.setMpostcode(maddr_arr[0]);
						memberInfo.setMaddress(maddr_arr[1]);
				 }
			}
			
			//이메일 분리
			String email = memberInfo.getMemail();
			String[] email_arr = email.split("@");
			memberInfo.setMemailId(email_arr[0]);
			memberInfo.setMemailDomain(email_arr[1]);
			
			
			System.out.println(memberInfo);
			
			
			mav.addObject("memberInfo", memberInfo);	  
		  
		  
		  mav.setViewName("member/MyInfoMemberModifyForm"); 
		  return mav; 
		  
		  }


	//회원정보 수정 요청  
	public ModelAndView updateMyInfoMemberModify(RedirectAttributes ra, MemberDto member) throws IllegalStateException, IOException {
		  
		ModelAndView mav = new ModelAndView();
		  System.out.println("MemberService.updateMyInfoMemberModify() 호출"); 
		  String loginId = (String) session.getAttribute("loginId");
			/*String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}*/
		  String loginProfile = (String) session.getAttribute("loginProfile");
		  System.out.println("로그인 된 아이디 : " + loginId);
		  System.out.println("로그인 된 프로필 : " + loginProfile);
		 
		 member.setMid(loginId);

		     
			 //이미지 파일
		      MultipartFile mfile = member.getMfile();
		      
		      //이미지의 파일명
		      String mprofile = "";

		      //이미지 파일 처리	      
		      if(!mfile.isEmpty()) {
		         System.out.println("변경 이미지 파일 있음");		         
		         UUID uuid = UUID.randomUUID();
		         mprofile = uuid.toString()+"_"+mfile.getOriginalFilename();

		         mfile.transferTo(  new File(savePath, mprofile)   );
		         member.setMprofile(mprofile);
		         System.out.println("변경프로필 : " + mprofile);
		      }else {
		    	  if(loginProfile !=null) {
		    		  System.out.println("변경 이미지 파일 없고, 기존 이미지 있음");		         
		    		  member.setMprofile(loginProfile);  
		    	  } else {
		    		  System.out.println("변경 이미지 파일 없고, 기존 이미지 없음");		         
		    		  member.setMprofile(mprofile);  
		    	  }
		      	
		      }
		         System.out.println(member);
		      
		      
		      // 주소 처리 
		      member.setMaddr( member.getMpostcode()+"_"+member.getMaddress()+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr());

		      // 이메일 처리
		      member.setMemail(member.getMemailId()+"@"+member.getMemailDomain());
		      
		      
		      

		      int memberInfoModify = mdao.updateMyInfoMemberModify(member);

		      if(memberInfoModify != 0) {

					System.out.println("회원정보가 수정 성공");
					session.setAttribute("loginProfile", member.getMprofile());
					ra.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
					mav.setViewName("redirect:/selectMyInfoMemberView");
				}else {
					System.out.println("회원정보가 수정 실패");
					ra.addFlashAttribute("msg" , "회원 정보 수정을 실패하였습니다.");
					mav.setViewName("member/MyInfoMemberPage");
				}

			return mav;
	}	
	
	//회원탈퇴
	public ModelAndView updateMemberWithdraw(RedirectAttributes ra) {
		
		ModelAndView mav = new ModelAndView();
		  System.out.println("MemberService.uupdateMemberWithdraw() 호출"); 
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		  System.out.println("로그인 된 아이디 : " + loginId);
		
		  int updateMemberWithdraw = mdao.updateMemberWithdraw(loginId);
		  
		  //로그아웃 시킴
			session.invalidate();
			
		  System.out.println("탈퇴 성공");
			ra.addFlashAttribute("msg" , "회원 탈퇴 하였습니다.");
			mav.setViewName("redirect:/");		  
		  
		  
		  return mav;
	}
	
	
	
	

	//마이페이지 커뮤니티
	public ModelAndView selectMyInfoCommunityView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoCommunityView 호출");
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		System.out.println("로그인 된 아이디 : " + loginId);
		
		//작성글
		ArrayList<BoardDto> board = mdao.selectMyInfoMemberView_Boards(loginId);
		System.out.println(board);

		//댓글작성한 글
		ArrayList<ReplyDto> reply = mdao.selectMyInfoMemberView_Reply(loginId);
		System.out.println(reply);

		//스크랩 글 목록
		ArrayList<ScrapDto> scrap = mdao.selectMyInfoMemberView_scrap(loginId);
		System.out.println(scrap);

		mav.addObject("board", board);
		mav.addObject("reply", reply);
		mav.addObject("scrap", scrap);
		mav.setViewName("member/MyInfoCommunityPage");
		return mav;
	}

	//마이페이지 중고거래
	public ModelAndView selectMyInfoResellView() {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoResellView 호출");
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		System.out.println("로그인 된 아이디 : " + loginId);
		
		//팔구
		ArrayList<UsedBoardDto> sellBoard = mdao.selectMyInfoResellView_Sell(loginId);
		System.out.println(sellBoard);		
		
		//사구
		ArrayList<UsedBoardDto> buyBoard = mdao.selectMyInfoResellView_Buy(loginId);
		System.out.println(buyBoard);	
		
		//찜목록
		ArrayList<ZzimDto> zzimBoard = mdao.selectMyInfoResellView_Zzim(loginId);
		System.out.println(zzimBoard);	
		
		
		mav.addObject("sellBoard", sellBoard);
		mav.addObject("buyBoard", buyBoard);
		mav.addObject("zzimBoard", zzimBoard);
		
		if(sellBoard.size() > buyBoard.size()) {			
			mav.addObject("sellbuySize", sellBoard.size());
		} else {
			mav.addObject("sellbuySize", buyBoard.size());
		}
		
		
		mav.setViewName("member/MyInfoResellPage");
		return mav;
	}


	//마이페이지 1:1 문의 내역 / 상세
	public ModelAndView selectMyInfoQuestionListView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoQuestionListView 호출");
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		System.out.println("로그인 된 아이디 : " + loginId);
		
		ArrayList<ContactDto> contact = mdao.selectMyInfoQuestionListView(loginId);
		System.out.println(contact);
		
		mav.addObject("contact", contact);
		mav.setViewName("member/MyInfoQuestionListPage");
		return mav;
	}

	//마이페이지 1:1 문의 작성 페이지
	public ModelAndView loadToMyInfoQuestionForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.loadToMyInfoQuestionForm() 호출");
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		System.out.println("로그인 된 아이디 : " + loginId);
		
		
		
		mav.setViewName("member/MyInfoQuestionForm");
		return mav;
	}

	//마이페이지 1:1 문의 작성 요청
	public ModelAndView insertMyInfoQuestionWrite(ContactDto contact, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.loadToMyInfoQuestionForm() 호출");
		  //String loginId = (String) session.getAttribute("loginId");
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}
		System.out.println("로그인 된 아이디 : " + loginId);
		
		//글번호 생성(CT00001) 
		String ctcode = mdao.selectMaxCtcode();
		System.out.println("maxCtcode: "+ctcode);
		int ctcodeNum = Integer.parseInt(ctcode.substring(2))+1;
		System.out.println("ctcodeNum: "+ctcodeNum);
		if(ctcodeNum<10) {
			ctcode = "CT0000"+ctcodeNum;
		} else if(ctcodeNum<100) {
			ctcode = "CT000"+ctcodeNum;
		} else if(ctcodeNum<1000) {
			ctcode = "CT00"+ctcodeNum;
		} else if(ctcodeNum<10000) {
			ctcode = "CT0"+ctcodeNum;
		} else if(ctcodeNum<100000) {
			ctcode = "CT"+ctcodeNum;
		}
		
		contact.setCtcode(ctcode);
		System.out.println(ctcode);
		
		//로그인된 아이디 작성자에 저장
		contact.setCtmid(loginId);
		
		System.out.println(contact);

	      int contactResult = mdao.insertMyInfoQuestionWrite(contact);

	      if(contactResult != 0) {

				System.out.println("문의 작성 성공");
				ra.addFlashAttribute("msg", "문의글이 등록 되었습니다.");
				mav.setViewName("redirect:/selectMyInfoQuestionListView");
			}else {
				System.out.println("문의 작성 실패");
				ra.addFlashAttribute("msg" , "문의글 작성에 실패하였습니다.");
				mav.setViewName("redirect:/");
			}

		return mav;
	}


	//회원정보 상세페이지 (미니브라우저)
	/*public ModelAndView selectWriteMemberInfo(String nickname) {
			ModelAndView mav = new ModelAndView();
			System.out.println("MemberService.selectWriteMemberInfo() 호출");
			  //String loginId = (String) session.getAttribute("loginId");
				String loginId;
				if((String) session.getAttribute("loginId")!=null) {			
					loginId = (String) session.getAttribute("loginId");
				} else {
					loginId = (String) session.getAttribute("kakaoId");			
				}
			System.out.println("로그인 된 아이디 : " + loginId);
			
			
			System.out.println("service.nickname : " + nickname);
			//닉네임 회원정보
			MemberDto memberInfo = mdao.selectWriteMemberInfo_member(nickname);
			System.out.println(memberInfo);
			
			
			//닉네임 별 작성 글 제목 출력
			ArrayList<BoardDto> Board = mdao.selectWriteMemberInfo_Board(nickname);
			System.out.println(Board);
			
			//닉네임 별  작성 댓글 내용 출력
			ArrayList<ReplyDto> Reply = mdao.selectWriteMemberInfo_Reply(nickname);
			System.out.println(Reply);			
			
			
			
			mav.addObject("memberInfo", memberInfo);
			mav.addObject("Board",Board);
			mav.addObject("Reply",Reply);
			
			mav.setViewName("member/WriteMemberInfoPage_Board");
			
			return mav;



	}*/

	//카카오 로그인
		public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
			System.out.println("MemberService.memberKakaoLogin() 호출");
			ModelAndView mav = new ModelAndView();
			
			String kakaomid= "@_"+member.getMid();
			
			MemberDto kakaoMember = mdao.selectMemberKakao(kakaomid);
			System.out.println(kakaoMember);
			if( kakaoMember != null ) {
				System.out.println(kakaoMember .getMstate());
				if(kakaoMember .getMstate() == 0) {
					ra.addFlashAttribute("msg", "이용 정지 된 계정 입니다.");
					mav.setViewName("redirect:/loadToLogin");


				}else if(kakaoMember.getMstate() == 2) {
					ra.addFlashAttribute("msg", "탈퇴 처리 된 회원입니다.");
					mav.setViewName("redirect:/loadToLogin");	
				
				}else {
					//로그인 처리
					session.setAttribute("loginId", kakaoMember.getMid());
					session.setAttribute("kakaoId", kakaoMember.getMid());
					session.setAttribute("loginProfile", member.getMprofile());
					session.setAttribute("loginRegion", kakaoMember.getMregion());
					session.setAttribute("loginNickname", kakaoMember.getMnickname());
				
					Enumeration<String> attributes = request.getSession().getAttributeNames();
					while (attributes.hasMoreElements()) {
						System.out.println("카카오 로그인 중");
				    	String attribute = (String) attributes.nextElement();
				    	System.err.println(attribute+" : "+request.getSession().getAttribute(attribute));
					}
				
					//session.setAttribute("kakaoId",kakaoMember.getMid());
					ra.addFlashAttribute("msg", "카카오 계정으로 로그인 되었습니다.");
					mav.setViewName("redirect:/");
				}
			} else {
				//회원가입 처리
				System.out.println("회원가입 확인!!!!");
				member.setMid("@_"+member.getMid());
				member.setMpw("12121212");
				//이메일 분리
				String email = member.getMemail();
				String[] email_arr = email.split("@");
				member.setMemailId(email_arr[0]);
				member.setMemailDomain(email_arr[1]);
				
				System.out.println("카카오확인 :"+member);
				mav.addObject("memberInfo", member);	  
				mav.setViewName("member/kakaoMemberRegisterForm"); 
				  
			}
		
			return mav;
		}

		//카카오 회원가입 필수 입력 
		public ModelAndView insertKakaoRegister(RedirectAttributes ra, MemberDto member)  throws IllegalStateException, IOException {
		      
			System.out.println("service.updateKakaoRegister()호출");
			mav = new ModelAndView();
			
		      // 주소 처리 
		      member.setMaddr( member.getMpostcode()+"_"+member.getMaddress()+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr());

		      // 이메일 처리
		      member.setMemail(member.getMemailId()+"@"+member.getMemailDomain());

		      System.out.println(member);

		      int joinResult = mdao.insertKakaoRegister(member);
		      
		      if(joinResult != 0) {
					System.out.println("회원가입 가능");
					ra.addFlashAttribute("msg", "회원가입 되었습니다. 로그인을 해주세요.");
					mav.setViewName("redirect:/loadToLogin");
				}else {
					System.out.println("회원가입 실패");
					ra.addFlashAttribute("msg" , "회원가입에 실패하였습니다.");
					mav.setViewName("redirect:/loadToRegister");
				}
		      

		      return mav;

		      
		   }
/* 현석 :  mail API 에러 때문에 주석처리 시작
		//비밀번호 찾기 요청
		public String selectLookforPw_ajax(String checkMid, String checkMemail) {
			System.out.println("MemberService.selectLookforPw_ajax() 호출");
			
			String pwCheckResult = mdao.selectLookforPw_ajax(checkMid, checkMemail);
			
			System.out.println(pwCheckResult);
			
			if(pwCheckResult !=null) {
				
				System.out.println("회원정보 있음");
				
				//임시 비밀번호 생성
				String subject = "임시비밀번호가 발급되었습니다.";
				String content = "";
				String from = "pj220810@naver.com";
				String to = checkMemail;
				String temporaryPw= "";
				
					for (int i = 0; i < 12; i++) {
						temporaryPw += (char) ((Math.random() * 26) + 97);
					}
					
					

		       // 메일 내용
				content += "<style>a{text-decoration: none;}</style>";
		        content += "<div style='margin: 50px;'>";
		        content += "<div style='height: 30px; width:800px; padding: 15px; font-size: 20px; font-family : pretendard; border-bottom : 1px solid gray; '>";
		        content += "<span style='color:gray;'>임시비밀번호가 발급되었습니다!</span></div>";		       
		        content += "<div style='width:800px; border-radius: 4px; padding: 20px 20px 20px 10px;'>";
		        content += "<div style='color:#747474; font-size: 14px; padding: 10px; font-family : pretendard;'>안녕하세요,&nbsp;<span style='font-weight: bold;'>"+ checkMid + " 님 </span></div>";
		        content += "<div style='color:#747474; font-size: 14px; padding: 10px; font-family : pretendard;'>회원님의 임시 비밀번호를 보내드립니다.</div>";
		        content += "<div style='color:#747474; font-size: 14px; padding: 10px; font-family : pretendard;'>임시 비밀번호 : <span style='font-weight: bold;'>" +temporaryPw+ "</span></div>";
		        content += "</div>";
		        content += "<div style='color:#747474; font-size: 13px; padding: 10px;font-family : pretendard;'>";
		        content += "임시비밀번호로 로그인 후 반드시 <span style='color: #00bcd4; font-weight: bold;font-family : pretendard;'>마이페이지 회원정보 > 수정</span> 에서 비밀번호를 재설정하여 주시기 바랍니다.</div>";
		        content += "<br>";
		        content += "<button style='text-align:center; border:0px; border-radius: 4px; height:50px; width: 250px; margin:20px;";
		        content += "margin-left: 10px; background-color: #00bcd4; color: white; font-weight: bold;font-family : pretendard;'>";
		        content += "<a href=\"http://localhost:8080/controller12/loadToLogin\">일인자사이트로 바로가기</a></button>";
		        content += "</div>";
								
				try {
					//Helper객체 생성
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
					
					//메일 내용 채우기	
					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true);

					//메일 전송
					mailSender.send(mail);
					pwCheckResult = "2";
					
					//임시비번으로 변경
					mdao.updatePw(checkMid, checkMemail, temporaryPw);

					
				} catch (Exception e) {
					 e.printStackTrace();
				}
				
				
				
				return pwCheckResult;
			
		}else {
				
			return pwCheckResult;
				
		}
			
			
		
	}
 현석 :  mail API 에러 때문에 주석처리 끝 */
		
		
		//미니브라우저 작성글 내역
		public String selectWriteMemberInfo_ajax(String nickname) {
			System.out.println("service.selectWriteMemberInfo_ajax()호출");
			ArrayList<BoardDto> boardList = mdao.selectWriteMemberInfo_ajax(nickname);

			Gson gson = new Gson();
			String boardList_gson = gson.toJson(boardList);
			System.out.println(boardList_gson);
			
			return boardList_gson;
		}



}






















