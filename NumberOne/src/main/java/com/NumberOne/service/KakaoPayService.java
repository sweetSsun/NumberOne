package com.NumberOne.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.NumberOne.vo.ReadyResponseVo;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {
	
	@Autowired
	private HttpSession session;

	private static final String HOST = "https://kapi.kakao.com";
	    
	private ReadyResponseVo ReadyResponseVo;
    
    public String kakaoPayReady() {
    	String loginId = (String) session.getAttribute("loginId");
    	RestTemplate restTemplate = new RestTemplate();
    	
    	
    	/* 결제준비 */
    	
    	// 서버로 요청할 Header :: header() 셋팅
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "d795e4053130015a11889eac7a7c468c"); // 카카오 디벨로퍼 Admin키
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
    	
        // 서버로 요청할 Body :: 카카오가 요구한 결제요청 request 값 
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "GG0001");
        params.add("partner_user_id", loginId);
        params.add("item_name", "1인자 자취템 공동구매");
        params.add("quantity", "1");
        params.add("total_amount", "100");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/");// 결제성공시 redirect url
        params.add("cancel_url", "http://localhost:8080/selectNoticeBoardList");			// 결제취소시 redirect url
        params.add("fail_url", "http://localhost:8080/loadToFail");// 결제실패시 redirect url
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);
		
		try {
        	ReadyResponseVo = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, ReadyResponseVo.class);
            
            log.info("" + ReadyResponseVo);
            
            return ReadyResponseVo.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "ReadyResponseVo.getNext_redirect_pc_url()";
        
       /* 
		// 외부url요청 통로 열기.
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		log.info("결재준비 응답객체: " + readyResponse);
        // 받아온 값 return
		return readyResponse;
	
	
    // 결제 승인요청 메서드
	public ApproveResponse payApprove(String tid, String pgToken) {
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		List<CartDto> carts = cartMapper.getCartByUserNo(user.getNo());
		// 주문명 만들기.
		String[] cartNames = new String[carts.size()];
		for(CartDto cart: carts) {
			for(int i=0; i< carts.size(); i++) {
				cartNames[i] = cart.getClassTitle();
			}
		}	
		String itemName = cartNames[0] + " 그외" + (carts.size()-1);
		
		String order_id = user.getNo() + itemName;
		
		// request값 담기.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", order_id); // 주문명
		parameters.add("partner_user_id", "회사명");
		parameters.add("pg_token", pgToken);
		
        // 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
        // 외부url 통신
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
        // 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스. 
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		log.info("결재승인 응답객체: " + approveResponse);
		
		return approveResponse;
        */
        
        
	}
    	
}
