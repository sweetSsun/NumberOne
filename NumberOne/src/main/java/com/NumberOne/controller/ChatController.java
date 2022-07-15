package com.NumberOne.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
		
//		for (String gd : gd_names) {
//			System.out.println(gd);
//		}
//		System.out.println(chat);
//		System.out.println(gdtitle);
		String crcode = chsvc.insertResellChat(gd_names, chatMessage, gdtitle);

		return crcode;
		// 채팅방 번호를 return해줌.
		// ajax로 insertResellChat을 호출하고, 리턴받은 crcode를 loadToChat 맵핑주소로 보내준다 (새창으로 띄우기 "blank_")
	}
	
	@RequestMapping(value = "/selectAllRoomMessage")
	public @ResponseBody String selectAllRoomMessage(String crcode, HttpServletResponse response) {
		String msgList_json = chsvc.selectAllRoomMessage(crcode);
		response.setContentType("application/json; charset=utf-8");
		
		return msgList_json;
	}
	/*
	    @RequestMapping(value="{roomId}.do")
    public void messageList(@PathVariable String roomId, String userEmail, Model model, HttpServletResponse response) throws JsonIOException, IOException {
        
        List<ChatMessage> mList = cService.messageList(roomId);
        response.setContentType("application/json; charset=utf-8");
 
        // 안읽은 메세지의 숫자 0으로 바뀌기
        ChatMessage message = new ChatMessage();
        message.setEmail(userEmail);
        message.setRoomId(roomId);
        cService.updateCount(message);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    
	 */
	
}
