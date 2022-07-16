package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dto.ChatMessageDto;
import com.NumberOne.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chsvc;
	private ModelAndView mav;
	
	@RequestMapping(value="/loadToChat")
	public ModelAndView loadToChat(String crcode) {
		System.out.println("채팅 페이지 요청");
		mav = new ModelAndView();
		mav.setViewName("chat/Chat");
		return mav;
	}
	
	@RequestMapping(value = "/insertResellChat")
	public @ResponseBody String insertResellChat(String[] gd_names, ChatMessageDto chatMessage, String gdtitle) {
		System.out.println("중고거래 관심상품 채팅메세지 입력 요청");
		mav = new ModelAndView();
		
		for (String gd : gd_names) {
			System.out.println(gd);
		}
		System.out.println(chatMessage);
		System.out.println(gdtitle);
		
		String crcode = chsvc.insertResellChat(gd_names, chatMessage, gdtitle);

		return crcode;
		// 채팅방 번호를 return해줌.
		// ajax로 insertResellChat을 호출하고, 리턴받은 crcode를 loadToChat 맵핑주소로 보내준다 (새창으로 띄우기 "blank_")
	}
	
	@RequestMapping(value = "/selectChatRoomMessage")
	public @ResponseBody String selectChatRoomMessage(String crcode) {
		System.out.println("특정 채팅방의 메세지 목록 조회 요청");
		String msgList_json = chsvc.selectChatRoomMessage(crcode);
		//response.setContentType("application/json; charset=utf-8");
		
		return msgList_json;
	}

	@RequestMapping(value = "/selectChatRoomList")
	public @ResponseBody String selectChatRoomList(String loginId) {
		System.out.println("특정 사용자의 채팅방 목록 조회 요청");
		String chatRoomList_json = chsvc.selectChatRoomList(loginId);
			
		return chatRoomList_json;
	}
	
}
