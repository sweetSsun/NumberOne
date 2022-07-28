package com.NumberOne.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.NumberOne.dto.GonguDto;
import com.NumberOne.service.AdminService;

@Controller
public class KakaoPay {
	
	@Autowired
	private AdminService asvc;
	
	
	@RequestMapping(value="/kakaopayReady")// data 넘겨줘야함
	public @ResponseBody String kakaopayReady(String nbcode, String loginId, String tel, String email, String address) throws IOException {
		System.out.println("kakaopayReady 호출");

		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(nbcode, "UTF-8"));//공구번호
	    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8"));	//구매자
	    urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("1인자 자취템 공동구매", "UTF-8"));//판매이름
	    urlBuilder.append("&" + URLEncoder.encode("quantity","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //개수
	    urlBuilder.append("&" + URLEncoder.encode("total_amount","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); //총액
	    urlBuilder.append("&" + URLEncoder.encode("vat_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //부가세
	    urlBuilder.append("&" + URLEncoder.encode("tax_free_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //면세
	    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval?testVal1="+"1234", "UTF-8")); //성공시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayFail", "UTF-8")); //실패시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayCansel", "UTF-8")); //취소시 돌아갈주소
	    //URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval", "UTF-8"));  URLEncoder.encode("/kakaopayApproval", "UTF-8")
	    //ajax라서 주소설정없이 ok 그런데 다른 컴퓨터에서 작동하지 않을 수있음. 자꾸 응답을 못받아서 원래방식대로 go
	    
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
	    
	    GonguDto gonguList = new GonguDto();
	    gonguList.setGnbcode(nbcode);
	    gonguList.setGmid(loginId);
	    gonguList.setGaddr(address);
	    gonguList.setGemail(email);
	    gonguList.setGphone(tel);
	    System.out.println(gonguList);
	    
	    
	    //공동구매/공구 카카오결제정보 DB입력 :: 결제가 완료되어야 넣도록
	    
	    //asvc.insertGonguRegister(gonguList);
	    
		return sb.toString();
	    
	}
	
	/*
	@RequestMapping(value="/kakaopayApproval")// data 넘겨줘야함
	public @ResponseBody String kakaopayApproval(GonguDto gonguList, String pg_token) throws IOException {
		System.out.println("kakaopayApproval 호출");
		
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); //URL
	    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("tid","UTF-8") + "=" + URLEncoder.encode("T1234567890123456789", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(nbcode, "UTF-8"));//공구번호
	    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8"));	//구매자
	    urlBuilder.append("&" + URLEncoder.encode("pg_token","UTF-8") + "=" + URLEncoder.encode("xxxxxxxxxxxxxxxxxxxx", "UTF-8"));
	    
	    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval", "UTF-8")); //성공시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayFail", "UTF-8")); //실패시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/loadToFail", "UTF-8")); //취소시 돌아갈주소
	    //URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval", "UTF-8"));  URLEncoder.encode("/kakaopayApproval", "UTF-8")
	    	    
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
	    
	    System.out.println(gonguList);
	    
	    //공동구매/공구 카카오결제정보 DB입력 :: 결제가 완료되어야 넣도록
	    
	    //asvc.insertGonguRegister(gonguList);
	    
		return sb.toString();
	    
	}
	*/
	
	
	
	@RequestMapping(value="/kakaopayApproval")
	public String kakaopayApproval(String gonguList, String pg_token) {
		System.out.println("/kakaopayApproval 결제성공 : 현재이동없음. 마이페이지로 보낼것");
		System.out.println(gonguList);
		System.out.println(pg_token);
		//asvc.insertGonguRegister(gonguList); gonguList를 json에서 객체화
		return "gongu/PaySuccess";
	}
	
	@RequestMapping(value="/kakaopayFail")
	public String kakaopayFail() {
		System.out.println("/kakaopayFail 결제실패 : 재결제 메세지 & 새로고침");
		return "gongu/PayError";
	}
	
	@RequestMapping(value="/kakaopayCansel")
	public String kakaopayCansel() {
		System.out.println("/kakaopayCansel 결제취소 : 취소메세지 & 새로고침");
		return "gongu/PayCancel";
	}
	
	
}
