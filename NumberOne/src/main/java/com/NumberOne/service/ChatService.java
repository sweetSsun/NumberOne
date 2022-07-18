package com.NumberOne.service;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.dto.ChatRoomDto;
import com.google.gson.Gson;

@Service
public class ChatService {

	@Autowired
	private ChatDao chdao;
	@Autowired
	private HttpSession session;

	// 중고거래 관심상품 채팅메세지 입력 요청
	public String insertResellChat(String[] gd_names, ChatMessageDto chatMessage, String gdtitle) {
		System.out.println("ChatService.insertResellChat() 호출");
		ModelAndView mav = new ModelAndView();
		int insertResult = 0;
		
		// 해당 사용자간의 채팅방이 있는지 확인 후 없으면 새롭게 생성
		ChatRoomDto chatRoom = selectChatRoom(chatMessage.getCmfrmid(), chatMessage.getCmtomid());
		if (chatRoom == null) {
			insertChatRoom(chatMessage);
			chatRoom = selectChatRoom(chatMessage.getCmfrmid(), chatMessage.getCmtomid());
		}
		chatMessage.setCmcrcode(chatRoom.getCrcode());
		System.out.println("chatRoom : " + chatRoom);
		
		
		// cmcode 생성
		int cmcode = createCmcode();
		chatMessage.setCmcode(cmcode);
		
		// 중고거래 시도시 입력할 메세지 생성
		String goodsChatMsg = null;
		goodsChatMsg = gdtitle + " 글 - ";
		if(gd_names.length==1) {
			for (String gdcheck : gd_names) {
				goodsChatMsg += gdcheck;
			}
		} else {
			for (int i = 0; i < gd_names.length; i++) {
				String gdcheck = gd_names[i];
				if (i != gd_names.length-1) {
					goodsChatMsg += gdcheck + ", "; 
				} else {
					goodsChatMsg += gdcheck; 
				}
			}			
		}
		goodsChatMsg += " 상품에 관심있어요";
		System.out.println("goodsChatMsg : " + goodsChatMsg);
		chatMessage.setCmcontents(goodsChatMsg);
		
		// 처음 중고거래 시도시의 세션은 구매자 뿐이므로 sessionCount를 1로 보내줌
		chatMessage.setSessionCount(1);
		
		
		System.out.println("chatDto : " + chatMessage);

		// 채팅 메세지 입력
		chdao.insertChatMessage(chatMessage);
		
		Gson gson = new Gson();
		String crcode = gson.toJson(chatMessage.getCmcrcode());
//		
//		// 채팅 출력_닉네임
//		String chfrmnick = chdao.selectMfrnick(chatMessage.getCmfrmid());
//		String chtomnick = chdao.selectMtonick(chatMessage.getCmtomid());
//		chatMessage.setChfrmnick(chfrmnick);
//		chatMessage.setChtomnick(chtomnick);
		
		return crcode;
	}

	// 특정 채팅방의 메세지 목록 조회
	public String selectChatRoomMessage(String crcode){
		System.out.println("ChatService.selectChatRoomMessage() 호출");
		ArrayList<ChatMessageDto> msgList = chdao.selectChatRoomMessage(crcode);
		
		// 안읽은 메세지 숫자 0으로 변경
		String mid = (String) session.getAttribute("loginId");
		chdao.updateCmread(crcode, mid);
		
		// 메세지 보낸 사람의 닉네임 조회 후 set
		for (int i = 0; i < msgList.size(); i++) {
			String cmfrmnickname = chdao.selectMnickname(msgList.get(i).getCmfrmid());
			msgList.get(i).setCmfrmnickname(cmfrmnickname);
		}
		Gson gson = new Gson();
		String msgList_json = gson.toJson(msgList);
		System.out.println("msgList_json : " + msgList_json);
		
		
		
		return msgList_json;
	}
	

	// 채팅방 조회 (보낸 메세지의 crcode)
	public ChatRoomDto selectChatRoom(String crcode) {
		System.out.println("ChatService.selectChatRoom_1() 호출");
		ChatRoomDto chatRoom = chdao.selectChatRoom_1(crcode); 
		return chatRoom;
	}

	// 채팅방 유무 확인 (신규채팅방 생성 확인용)
	public ChatRoomDto selectChatRoom(String crfrmid, String crtomid) {
		System.out.println("ChatService.selectChatRoom_2() 호출");
		ChatRoomDto chatRoom = chdao.selectChatRoom_2(crfrmid, crtomid); 
		return chatRoom;
	}

	// 새로운 채팅방 생성
	public void insertChatRoom(ChatMessageDto chatMessage) {
		System.out.println("ChatService.insertChatRoom() 호출");
		// crcode 생성
		String maxCrcode = chdao.selectMaxCrcode();
		int crcodeNum = Integer.parseInt(maxCrcode.substring(3)) + 1;
		System.out.println("crcodeNum: "+crcodeNum);
		String crcode;
		if(crcodeNum<10) {
			crcode = "CR0000"+crcodeNum;
		} else if(crcodeNum<100) {
			crcode = "CR000"+crcodeNum;
		} else if(crcodeNum<1000) {
			crcode = "CR00"+crcodeNum;
		} else if(crcodeNum<10000) {
			crcode = "CR0"+crcodeNum;
		} else {
			crcode = "CR"+crcodeNum;
		} 
		chatMessage.setCmcrcode(crcode);

		// 채팅방 생성
		int insertResult = chdao.insertChatRoom(chatMessage);
		if (insertResult > 0) {
			System.out.println("신규 채팅방 생성 완료");
		}
	}	
	
	// cmcode 생성 메소드
	public int createCmcode() {
		int cmcode = chdao.selectMaxCmcode() + 1;
		System.out.println("cmcode : "+ cmcode);
		return cmcode;
	}

	// 특정 사용자의 채팅방 목록 조회 요청
	public String selectChatRoomList(String loginId) {
		System.out.println("ChatService.selectChatRoomList() 호출");
		
		// 채팅방 목록 조회
		System.out.println(loginId);
		ArrayList<ChatRoomDto> chatRoomList = chdao.selectChatRoomList(loginId);
		
		for (int i = 0; i < chatRoomList.size(); i++) {
			// 특정 채팅방의 안읽은 메세지 수 조회
			String cmcrcode = chatRoomList.get(i).getCrcode();
			System.out.println("=====================cmcrcode : " + cmcrcode);
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

			// 채팅방의 상대방 프로필이미지 조회
			String crfrMprofile = chdao.selectCrfrMprofile(mid);
			chatRoomList.get(i).setCrfrmprofile(crfrMprofile);
		}
		
		System.out.println("chatRoomList : " + chatRoomList);
		
		Gson gson = new Gson();
		String chatRoomList_json = gson.toJson(chatRoomList);
		
		return chatRoomList_json;
	}
	
	// 읽지않은 메세지 조회 요청
	public int selectSumUnReadCount (String loginId) {
		System.out.println("ChatService.selectSumUnReadCount() 호출");

		ArrayList<ChatRoomDto> chatRoomList = chdao.selectChatRoomList(loginId);
		
		int sumUnReadCount = 0;
		for (int i = 0; i < chatRoomList.size(); i++) {
			// 특정 채팅방의 안읽은 메세지 수 조회
			String cmcrcode = chatRoomList.get(i).getCrcode();
			int unReadCount = chdao.selectUnReadCount(loginId, cmcrcode);
			System.out.println("읽지않은 메세지 수 "+ unReadCount);
			chatRoomList.get(i).setUnreadCount(unReadCount);
			sumUnReadCount += chatRoomList.get(i).getUnreadCount();
		}
		System.out.println("읽지않은 메세지 총 합 "+sumUnReadCount);
		return sumUnReadCount;
	}
	
}
