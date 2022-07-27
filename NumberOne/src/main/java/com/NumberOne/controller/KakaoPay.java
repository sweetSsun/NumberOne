package com.NumberOne.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KakaoPay {
	
	@RequestMapping(value="/kakaopay")// data 넘겨줘야함
	public @ResponseBody String kakaopayTest(String nbcode, String loginId) throws IOException {
		System.out.println("kakaopay 호출");
		System.out.println(nbcode);
		System.out.println(loginId);
		
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(nbcode, "UTF-8"));//공구번호
	    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8"));	//구매자
	    urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("1인자 자취템 공동구매", "UTF-8"));//판매이름
	    urlBuilder.append("&" + URLEncoder.encode("quantity","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //개수
	    urlBuilder.append("&" + URLEncoder.encode("total_amount","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); //총액
	    urlBuilder.append("&" + URLEncoder.encode("vat_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //부가세
	    urlBuilder.append("&" + URLEncoder.encode("tax_free_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //면세
	    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("/kakaopayApproval", "UTF-8")); //성공시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") + "=" + URLEncoder.encode("/kakaopayFail", "UTF-8")); //실패시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") + "=" + URLEncoder.encode("/kakaopayCansel", "UTF-8")); //취소시 돌아갈주소
	    //URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval", "UTF-8")); 
	    //ajax라서 주소설정없이 ok 그런데 다른 컴퓨터에서 작동할지 확인해야함
	    
	    URL url = new URL(urlBuilder.toString());
	    System.out.println(urlBuilder.toString());
	    
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Authorization", "KakaoAK d795e4053130015a11889eac7a7c468c");
	    conn.setRequestProperty("Content-type", "application/json;charset=UTF-8");
	    System.out.println("Response code: " + conn.getResponseCode());
	    BufferedReader rd;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    StringBuilder sb = new StringBuilder();
	    String line;
	    
	    while ((line = rd.readLine()) != null) {
	        sb.append(line);
	    }
	    rd.close();
	    conn.disconnect();
	    System.out.println(sb.toString());
		return sb.toString();
	    
	}
	
	// return을 못받고있음 ////////////////////////////////////////////////////////
	@RequestMapping(value="/kakaopayApproval")
	public String kakaopayApproval() {
		System.out.println("/kakaopayApproval 결제성공 : 현재이동없음. 마이페이지로 보낼것");
		return "Fail";
	}
	
	@RequestMapping(value="/kakaopayFail")
	public String kakaopayFail() {
		System.out.println("/kakaopayFail 결제실패 : 현재이동없음. 뒤로가기");
		return "redirect:/loadToFail";
	}
	
	@RequestMapping(value="/kakaopayCansel")
	public String kakaopayCansel() {
		System.out.println("/kakaopayCansel 결제취소 : 현재이동없음. 뒤로가기");
		return "redirect:/selectMyInfoCommunityView";
	}
	
	
}
