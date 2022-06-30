package com.NumberOne.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dao.ChatDao;
import com.NumberOne.dto.ChatDto;

@Service
public class ChatService {

	@Autowired
	private ChatDao chdao;
	
	private ChatDto ch;
	
	
	// 채팅 목록 설정
	public ModelAndView chatList() {
		System.out.println("ChatService.chatList() 호출");
		ArrayList<ChatDto> chatList = chdao.selectChatList();
		System.out.println("입력 전 chatList.size() : "+chatList.size());
		ModelAndView mav = new ModelAndView();

		// 채팅 번호 생성 (select)
		int maxChcode = chdao.selectMaxChcode();
			System.out.println("채팅번호 : "+maxChcode);
			maxChcode++;
			
			
		// 채팅 입력
		int insertChat = chdao.insertChat(ch);
		System.out.println("입력 후 chatList.size() : "+chatList.size());

		mav.setViewName("redirect:/chatPage");
		return mav;
	}	
	
	
	
	
	
}
