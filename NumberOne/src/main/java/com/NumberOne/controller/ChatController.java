package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chsvc;
	
	@RequestMapping(value="/loadToChatPage")
	public ModelAndView chatPage() {
		System.out.println("채팅 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/ChatPage");
		return mav;
		
	}
	
	@RequestMapping(value="/chatList")
	public ModelAndView chatList() {
		System.out.println("채팅 목록 요청");
		ModelAndView mav = chsvc.chatList();		
		mav.setViewName("chat/ChatPage");
		return mav;
		
	}
	
	
	
}
