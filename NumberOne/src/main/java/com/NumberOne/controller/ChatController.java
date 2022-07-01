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
	
	@RequestMapping(value="/loadToChat")
	public ModelAndView loadToChat() {
		System.out.println("채팅 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/Chat");
		return mav;
		
	}
	
	
	
	@RequestMapping(value="/insertChat")
	public void insertChat() {
		System.out.println("채팅 DB 입력");
		chsvc.insertChat();
		
	}
	
	
	
}
