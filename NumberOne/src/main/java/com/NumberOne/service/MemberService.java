package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dao.MemberDao;
import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.GonguBoardDto;
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
	
	@Autowired
	private ChatDao chdao;
	
	@Autowired
    private ChatService chsvc;

	@Autowired
	private ResellService rssvc;
	
	
	 @Autowired private HttpServletRequest request;
	 @Autowired private HttpSession session;
	 @Autowired private JavaMailSender mailSender;

	
	
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


//			}else if(loginMember.getMid().equals("admin")) {
//
//
//				session.setAttribute("loginId", loginMember.getMid());
//				session.setAttribute("loginNickname", loginMember.getMnickname());
//				mav.setViewName("redirect:/admin_loadToAdminMainPage");
			
			}else if(loginMember .getMstate() == 2){
				ra.addFlashAttribute("msg", "탈퇴 처리 된 회원입니다.");
				mav.setViewName("redirect:/loadToLogin");				
			
			}else {
				 int sumUnReadCount = chsvc.selectSumUnReadCount(loginMember.getMid());
		            //로그인 성공
		            session.setAttribute("loginId", loginMember.getMid());
		            session.setAttribute("loginProfile", loginMember.getMprofile());
		            session.setAttribute("loginRegion", loginMember.getMregion());
		            session.setAttribute("loginNickname", loginMember.getMnickname());
		            session.setAttribute("sumUnReadCount", sumUnReadCount);
		            
		            System.out.println((String) session.getAttribute("loginId"));
		             System.out.println((String) session.getAttribute("loginRegion"));
		             System.out.println((String) session.getAttribute("loginProfile"));
		             System.out.println((String) session.getAttribute("loginNickname"));

		             System.out.println(session.getAttribute("sumUnReadCount"));

			    
				ra.addFlashAttribute("msg", "로그인 되었습니다.");
				
				if(session.getAttribute("afterUrl") != null) {
					String afterUrl = (String) session.getAttribute("afterUrl");
					session.removeAttribute("afterUrl");
					mav.setViewName("redirect:/"+afterUrl);
				} else {					
					mav.setViewName("redirect:/");
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
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("loginId")!=null) {		
			session.invalidate();
			ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
			mav.setViewName("redirect:/");
		}
		else {
			ra.addFlashAttribute("msg", "로그인 상태가 아닙니다.");
			mav.setViewName("redirect:/loadToLogin");
		}
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
		  
		  //로그인 여부 확인
		  if(session.getAttribute("loginId")==null) {
			  ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			  mav.setViewName("redirect:/loadToLogin");
			  return mav;
		  }
		  
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
		 
		 //삭제할 프로필 파일명
		 String delFileName = member.getMprofile();
		 //System.out.println("삭제할 파일: "+delFile);
		 
		     
			 //이미지 파일
		      MultipartFile mfile = member.getMfile();
		      System.out.println(mfile);
		      
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
		    		  //System.out.println("변경 이미지 파일 없고, 기존 이미지 있음");
		    		  
		    		  if(delFileName.length() != 0) {
		    			  System.out.println("프로필 삭제");
		    			  member.setMprofile("");  
		    			  //System.out.println("프로필 삭제 if문 : "+member);
		    		  } else {
		    			  System.out.println("기존 프로필 유지");
		    			  member.setMprofile(loginProfile);  
		    		  }
		    		  
		    	  } else {
		    		  System.out.println("변경 이미지 파일 없고, 기존 이미지 없음");		         
		    		  member.setMprofile(mprofile);  
		    	  }
		      	
		      }
		      
		      //System.out.println("프로필 삭제 if문 밖 : "+member);
		      
		      
		      // 주소 처리 
		      member.setMaddr( member.getMpostcode()+"_"+member.getMaddress()+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr());

		      // 이메일 처리
		      member.setMemail(member.getMemailId()+"@"+member.getMemailDomain());
		      
		      
		      
	    	  int memberInfoModify = mdao.updateMyInfoMemberModify(member);
	    	  
	    	  if(memberInfoModify == 0) {
	    		  System.out.println("회원정보 수정 실패");
	    		  ra.addFlashAttribute("msg" , "회원 정보 수정을 실패하였습니다.");
	    		  mav.setViewName("member/MyInfoMemberPage");
	    		  
	    		  //메소드 종료
	    		  return mav;
	    	  }
	    	  
	    	  System.out.println("회원정보 수정 성공");
	    	  
	    	  if(member.getMprofile().length() == 0 ) {
	    		  session.setAttribute("loginProfile", null);
	    	  } else {
	    		  session.setAttribute("loginProfile", member.getMprofile());
	    	  }
	    	  
	    	  ra.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
    		  mav.setViewName("redirect:/selectMyInfoMemberView");
	    		  
    		  
    		  //파일 처리
    		  if(delFileName.length() != 0) {
    			  System.out.println("기존 프로필 파일 삭제");
    			  File delFile = new File(savePath, delFileName);
    			  if(delFile.exists()) { //해당 파일 있는지 확인 후
  					System.out.println(delFileName+"파일 삭제");
  					delFile.delete(); //삭제
  				}
    		  }
    		  
    		  
		return mav;
	}	
	
	//회원탈퇴
	public ModelAndView updateMemberWithdraw(RedirectAttributes ra) {
		
		ModelAndView mav = new ModelAndView();
		  System.out.println("MemberService.uupdateMemberWithdraw() 호출"); 
		  String loginId = (String) session.getAttribute("loginId");
		  /*
			String loginId;
			if((String) session.getAttribute("loginId")!=null) {			
				loginId = (String) session.getAttribute("loginId");
			} else {
				loginId = (String) session.getAttribute("kakaoId");			
			}*/
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
	public ModelAndView selectMyInfoCommunityView(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoCommunityView 호출");
		
		//로그인 여부 확인
		if(session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
	    String loginId = (String) session.getAttribute("loginId");
		/*
		String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}*/
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
	public ModelAndView selectMyInfoResellView(RedirectAttributes ra) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoResellView 호출");
		
		//로그인 여부 확인
		if(session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
	    String loginId = (String) session.getAttribute("loginId");
		
	    /*String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}*/
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
			
			//채팅 목록
			ArrayList<ChatRoomDto> chatRoomList = chdao.selectChatRoomList(loginId);
			System.out.println(chatRoomList);
			for (int i = 0; i < chatRoomList.size(); i++) {
				// 특정 채팅방의 안읽은 메세지 수 조회
				String cmcrcode = chatRoomList.get(i).getCrcode();
				int unReadCount = chdao.selectUnReadCount(loginId, cmcrcode);
				chatRoomList.get(i).setUnreadCount(unReadCount);

				// 특정 채팅방의 가장 최신 메세지 조회
				ChatMessageDto recentMsg = chdao.selectRecentMessage(cmcrcode);
				chatRoomList.get(i).setRecentCmcontents(recentMsg.getCmcontents());
				chatRoomList.get(i).setRecentCmdate(recentMsg.getCmdate());
				
				// 특정 채팅방의 상대방 닉네임 조회
				String mid = ""; // 로그인한 사람이 아닌 상대방의 아이디 뽑기
				if (loginId.equals(chatRoomList.get(i).getCrfrmid())) {
					mid = chatRoomList.get(i).getCrtomid();
				} else {
					mid = chatRoomList.get(i).getCrfrmid();
				}
				String cmfrmnickname = chdao.selectMnickname(mid);
				chatRoomList.get(i).setCrfrmnickname(cmfrmnickname);
			}
			System.out.println("chatRoomList : " + chatRoomList);

			
			mav.addObject("chatRoomList", chatRoomList);
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
	public ModelAndView selectMyInfoQuestionListView(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.selectMyInfoQuestionListView 호출");
		
		//로그인 여부 확인
		if(session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
		String loginId = (String) session.getAttribute("loginId");
		/*
		String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}*/
		System.out.println("로그인 된 아이디 : " + loginId);
		

		ArrayList<ContactDto> contact = mdao.selectMyInfoQuestionListView(loginId);
		System.out.println(contact);
		
		mav.addObject("contact", contact);
		mav.setViewName("member/MyInfoQuestionListPage");

		return mav;
	}

	//마이페이지 1:1 문의 작성 페이지
	public ModelAndView loadToMyInfoQuestionForm(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.loadToMyInfoQuestionForm() 호출");
		
		//로그인 여부 확인
		if(session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
	    String loginId = (String) session.getAttribute("loginId");
		/*
	    String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}*/
		System.out.println("로그인 된 아이디 : " + loginId);
		mav.setViewName("member/MyInfoQuestionForm");

		return mav;
	}

	//마이페이지 1:1 문의 작성 요청
	public ModelAndView insertMyInfoQuestionWrite(ContactDto contact, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.loadToMyInfoQuestionForm() 호출");
		
		//로그인 여부 확인
		if(session.getAttribute("loginId")==null) {
			ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/loadToLogin");
			return mav;
		}
		
	    String loginId = (String) session.getAttribute("loginId");
		/*
	    String loginId;
		if((String) session.getAttribute("loginId")!=null) {			
			loginId = (String) session.getAttribute("loginId");
		} else {
			loginId = (String) session.getAttribute("kakaoId");			
		}*/
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
		
		//문의내용 개행문자처리
		String contents = contact.getCtcontents();
		contents = contents.replace(" ", "&nbsp;");
		contents = contents.replace("\r\n", "<br>");
		contact.setCtcontents(contents);
		
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
				System.out.println("email : "+email);
				if(email.equals("undefined")) {
					// 이메일 처리
					member.setMemail(member.getMemailId()+"@"+member.getMemailDomain());
	
				}else {
						String[] email_arr = email.split("@");
						member.setMemailId(email_arr[0]);
						member.setMemailDomain(email_arr[1]);
				}
				
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
/* 현석 :  mail API 에러 때문에 주석처리 시작 */
		//비밀번호 찾기 요청
		public String selectLookforPw_ajax(String checkMid, String checkMemail) {
			System.out.println("MemberService.selectLookforPw_ajax() 호출");
			
			String pwCheckResult = mdao.selectLookforPw_ajax(checkMid, checkMemail);
			
			System.out.println(pwCheckResult);
			
			if(pwCheckResult !=null) {
				
				System.out.println("회원정보 있음");
				
				//임시 비밀번호 생성
				String subject = "[일인자]인증번호가 발급되었습니다.";
				String content = "";
				String from = "pj220810@naver.com";
				String to = checkMemail;
				String temporaryPw= "";
				
					for (int i = 0; i < 12; i++) {
						temporaryPw += (char) ((Math.random() * 26) + 97);
					}
					
					

		       // 메일 내용 
							content +="<div style=\"height: 24px;\"></div>";
							content +="<div style=\"font-family : pretendard; \">";
							content +="<div style=\"text-align: center; width: 800px; font-size: 30px; font-weight: bold; color:#36454f; \">NumberOne</div><br>";
							content +="<div style=\"background-color: #00bcd4; height: 5px; width: 800px;\"></div><br>";
							content +="<div style=\"background-color: #36454f; height: 2px; width: 800px;\"></div>";
							content +="<div style=\"height: 10px; width: 800px;\"></div>";
							content +="<div><br>";
							content +="<p style=\"height: 24px; font-size: 14px; color:#36454f; \" >&nbsp;&nbsp; 안녕하세요 " + checkMid + "님,</p>";
							content +="<p style=\"height: 24px; font-size: 14px; color:#36454f; \" >&nbsp;&nbsp; 인증번호를 보내드리오니 아래 비밀번호변경하기 버튼을 클릭하여 인증 하신 후</p>";
							content +="<p style=\"height: 24px; font-size: 14px; color:#36454f; \" >&nbsp;&nbsp; 비밀번호를 변경하시기 바랍니다.</p><br>";
							
							content +="<p style=\"height: 24px; font-size: 15px; font-weight: bold; color:#36454f; \" >&nbsp;&nbsp; 인증번호 : " +temporaryPw+ "</p>";
							content +="</div>";
							
							content +="<div style=\"width:800px; padding-left: 300px;\">";
					        content += "<button style='text-align:center; border:0px; border-radius: 4px; height:40px; width: 150px; margin:20px;";
					        content += "margin-left: 10px; background-color: #00bcd4; color: white; font-weight: bold;font-family : pretendard;'>";
					        content += "<a href=\"http://121.65.47.77:7771/controller/loadToTemporaryNum?mid="+ checkMid + "\"; style=\" color:white; text-decoration: none;\"  >비밀번호변경하기</a></button>";			        
					        content +="</div>";
					        
							content +="<div style=\"height: 10px; width: 800px;\"></div>";
							content +="<div style=\"background-color: #36454f; height: 2px; width: 800px;\"></div><br>";
							content +="<div style=\"background-color: #00bcd4; height: 5px; width: 800px;\"></div>";
							content +="</div>"; 							
					
					
		        System.out.println(content);
		       
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
 /*현석 :  mail API 에러 때문에 주석처리 끝 */
		
		
		//미니브라우저 작성글 내역
		public String selectWriteMemberInfo_ajax(String nickname) {
			System.out.println("service.selectWriteMemberInfo_ajax()호출");
			ArrayList<BoardDto> boardList = mdao.selectWriteMemberInfo_ajax(nickname);

			Gson gson = new Gson();
			String boardList_gson = gson.toJson(boardList);
			System.out.println(boardList_gson);
			
			return boardList_gson;
		}

		//미니브라우저 작성 댓글 내역
		public String selectWriteMemberInfoReply_ajax(String nickname) {
			System.out.println("service.selectWriteMemberInfoReply_ajax호출");
			ArrayList<ReplyDto> replyList = mdao.selectWriteMemberInfoReply_ajax(nickname);

			Gson gson = new Gson();
			String replyList_gson = gson.toJson(replyList);
			System.out.println(replyList_gson);
			
			return replyList_gson;
		}

		//미니브라우저 프로필 부분
		public ModelAndView selectWriteMemberInfo_member(String nickname) {
			ModelAndView mav = new ModelAndView();
			System.out.println("MemberService.selectWriteMemberInfo_member() 호출");
			System.out.println("service.nickname : " + nickname);
			
			//닉네임 회원정보
			MemberDto memberInfo = mdao.selectWriteMemberInfo_member(nickname);
			System.out.println(memberInfo);
			
			mav.addObject("memberInfo", memberInfo);
			mav.setViewName("member/WriteMemberInfoPage");
			
			return mav;
		}

		//미니브라우저 중고거래 부분
		public String selectWriteMemberInfoSellBuy_ajax(String nickname) {
			System.out.println("service.selectWriteMemberInfoSellBuy_ajax() 호출");
			
			ArrayList<UsedBoardDto> ubList = mdao.selectWriteMemberInfoSellBuy_ajax(nickname); 
			
			// 금액 천단위 ','
			for (int i = 0; i < ubList.size(); i++) {

				int price = ubList.get(i).getGdprice();

				NumberFormat numberFormat = NumberFormat.getInstance();
				
				String price2 = numberFormat.format(price);
				System.out.println("price2 : "+price2);
				
				ubList.get(i).setGdprice2(price2);
			}
			
			System.out.println("ubList : " + ubList);

			
			Gson gson = new Gson();
			String ubList_gson = gson.toJson(ubList);
			System.out.println(ubList_gson);
			
			return ubList_gson;
		}
		
		// 회원 찜목록 조회
		public String selectZzimList_ajax(String loginId) throws ParseException {
			System.out.println("service.selectZzimList_ajax() 호출");
			System.out.println("loginId : " + loginId);
			
			ArrayList<UsedBoardDto> zzList = mdao.selectZzimList_ajax(loginId);
			System.out.println("zzList : " + zzList);
			
			// 시간 출력 변경 (?시간 전)
			for (int i = 0; i < zzList.size(); i++) {
				//현재시간 - 작성시간
				String ubdatedef = rssvc.timeFuction(zzList.get(i).getUbdate());
				//ubdatedef 객체에 저장
				zzList.get(i).setUbdatedef(ubdatedef);
				//ubdate 분까지만 객체에 저장
				zzList.get(i).getUbdate().substring(0,  16);	
			}
			
			Gson gson = new Gson();
			String zzList_gson = gson.toJson(zzList);
			
			return zzList_gson;
		}
		
		 // 회원 신고 확인
	      public String checkMemberWarning_ajax(String loginId, String wmedNickname) {
	         System.out.println("service.checkMemberWarning_ajax() 호출");
	         
	         String mbwnCheck="No";
	         int mbwnCheckNum = mdao.checkMemberWarning_ajax(loginId, wmedNickname);
	         if (mbwnCheckNum == 1) {
	            mbwnCheck = "Yes";
	         }
	         return mbwnCheck;
	      }

	      // 회원 신고
	      public int insertMemberWarning_ajax(String loginId, String wmedNickname) {
	         System.out.println("service.insertMemberWarning_ajax() 호출");
	         
	         int insertResult=0;
	         
	         //잘못된 접근으로 이미 신고한 적 있는 회원을 다시 신고한 경우 오류 발생을 막기 위해 try-catch 사용
	         try {
	        	 insertResult = mdao.insertMemberWarning_ajax(loginId, wmedNickname);	    	 
			} catch (Exception e) { 
				//return 0
				System.out.println("무결성 제약 조건 위반");
			}
	         
	         return insertResult;
	      }

	  	//이메일 중복 확인 요청
	  	public String selectMemberEmail_ajax(String inputEmail) {
	  		System.out.println("MemberService.selectMemberEmail_ajax() 호출");
	  		System.out.println(inputEmail);
	  		int emailCheckResult = mdao.selectMemberEmail_ajax(inputEmail);
	  		System.out.println(emailCheckResult);
	  		if(emailCheckResult > 0) {
	  			return "NO";
	  		}else {
	  			return "OK";
	  		}
	  	}

	  	//마이페이지 _ 공구
		public ModelAndView selectMyInfoGonguView(RedirectAttributes ra) {
	
				ModelAndView mav = new ModelAndView();
				System.out.println("MemberService.selectMyInfoGonguView 호출");
				
				String loginId = (String) session.getAttribute("loginId");
				
				//로그인 여부 확인
				if(session.getAttribute("loginId")==null) {
					ra.addFlashAttribute("msg", "로그인 후 이용가능합니다.");
					mav.setViewName("redirect:/loadToLogin");
					return mav;
				}

				//참여한 공구 목록 
				ArrayList<GonguBoardDto> gonguList = mdao.selectMyInfoGonguView(loginId);
				
				// 금액 천단위 ','
				for (int i = 0; i < gonguList.size(); i++) {

					int price = gonguList.get(i).getGbitemprice();

					NumberFormat numberFormat = NumberFormat.getInstance();
					
					String price2 = numberFormat.format(price);
					System.out.println("price2 : "+price2);
					
					gonguList.get(i).setGbitemprice2(price2);
				}

				System.out.println(gonguList);

				mav.addObject("gonguList", gonguList);
	
				mav.setViewName("member/MyInfoGonguPage");

				return mav;
			}

		//임시번호 확인
		public String selectTemporaryNum_ajax(String mid , String mpw) {
			System.out.println("MemberService.selectTemporaryNum_ajax() 호출");
			String TemporaryNumResult = mdao.selectTemporaryNum_ajax(mid,mpw);
			System.out.println("임시비번 : "+ TemporaryNumResult);
			if(TemporaryNumResult != null) {
				return TemporaryNumResult;
			}else {
				return null;
			}
		}


		public ModelAndView updateTemporaryNum(RedirectAttributes ra, String mid, String mpw) {
			ModelAndView mav = new ModelAndView();
			  System.out.println("MemberService.updateTemporaryNum() 호출"); 
			
		if (mpw.equals("")) {
			mav.addObject("checkId", mid);
			mav.setViewName("member/TemporaryNumForm");
			
			return mav;
		
		}else {

	    	  int changePwResult = mdao.updateTemporaryNum(mid, mpw);
	    	  System.out.println("changePwResult : "+changePwResult);
	    	  
	    	  if(changePwResult == 0) {
	    		  System.out.println("회원정보 수정 실패");
	    		  ra.addFlashAttribute("msg" , "회원 정보 수정을 실패하였습니다.");
	    		  mav.setViewName("redirect:/loadToTemporaryNum");

	    		  return mav;

	    	  }  else {
	    	  
	    		  ra.addFlashAttribute("msg", "비밀번호가 수정 되었습니다. 로그인 해주시기 바랍니다.");
	    		  mav.setViewName("redirect:/loadToLogin");
	    		  return mav;
	    	  }	
			
			}
		}

}






















