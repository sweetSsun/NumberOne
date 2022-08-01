package com.NumberOne.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.NumberOne.dto.GonguDto;
import com.NumberOne.service.AdminService;
import com.NumberOne.service.GonguBoardService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class KakaoPay {
	
	@Autowired
	private GonguBoardService gbsvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/kakaopayReady")// data 넘겨줘야함
	public @ResponseBody String kakaopayReady(String gbcode, String loginId, String tel, String email, String address) throws IOException {
		System.out.println("kakaopayReady 호출");
		
		// 객체 저장
		GonguDto gongu = new GonguDto();
		gongu.setGgbcode(gbcode);
		gongu.setGmid(loginId);
		gongu.setGaddr(address);
		gongu.setGemail(email);
		gongu.setGphone(tel);
		
		// 객체를 json 형태로 바꾸는 법
		Gson gson = new Gson();
		String gonguJson = gson.toJson(gongu);
		System.out.println("gonguJson : "+gonguJson);
		
	    /* 이건 객체를 단순 문자열로 바꾸는 법
		String json_gongu = gongu.toString();
	    System.out.println("GonguDto_json :: "+json_gongu);
	    */
	    
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(gongu.getGgbcode(), "UTF-8"));//공구번호
	    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8"));	//구매자
	    urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("1인자 자취템 공동구매", "UTF-8"));//판매이름
	    urlBuilder.append("&" + URLEncoder.encode("quantity","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //개수
	    urlBuilder.append("&" + URLEncoder.encode("total_amount","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); //총액
	    urlBuilder.append("&" + URLEncoder.encode("vat_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //부가세
	    urlBuilder.append("&" + URLEncoder.encode("tax_free_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); //면세
	    //urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopaySuccess", "UTF-8")); //준비성공시 승인
	    //urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval?gongu="+"aaaaa", "UTF-8")); //준비성공시 승인
	    //urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval?gbcode="+gbcode+"&loginId="+loginId+"&address="+address+"&email="+email+"&tel="+tel, "UTF-8")); //준비성공시 승인
	    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayApproval?gonguJson="+URLEncoder.encode(gonguJson, "UTF-8"), "UTF-8")); //준비성공시 승인
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
	    
	    // tid 저장은 했는데 어떻게 넘겨요? >> Session 에 담는 방법 & 전역변수에 담는 방법이 있음 (private String tid;)
	    // String tid = sb.substring(8,28); 내생각ㅎㅎ;
	    // sb 객체에서 한가지 값을 찾는 코드
	    JsonObject sbjobj = (JsonObject) JsonParser.parseString(sb.toString());
	    System.out.println("sb_JsonObject :"+sbjobj);
	    
	    System.out.println("sb_tid :"+sbjobj.get("tid").getAsString());
	    String tid = sbjobj.get("tid").getAsString();
	    session.setAttribute("tid", tid);
	    
		return sb.toString();
	    
	}
	
	
	@RequestMapping(value="/kakaopayApproval")// data 받아야함
	public String kakaopayApproval(String gonguJson, String pg_token) throws IOException {
		System.out.println("kakaopayApproval 호출");
		
		System.out.println("gonguJson : " + gonguJson);
		System.out.println("pg_token : " + pg_token);
		String tid = (String) session.getAttribute("tid");
		System.out.println("tid : " + tid);
		
		// json을 객체로 바꾸는 법
		Gson gson = new Gson();
		GonguDto gongu = gson.fromJson(gonguJson, GonguDto.class);
		System.out.println("gongu : "+gongu);
		
		/*공동구매/공구 카카오결제정보 DB입력 :: 결제 전에 입력 ------------- DB확인없이 결제하면 바로 입력하도록 함
    	asvc.insertGonguRegister(gongu);
    	
		// 결제승인 시작
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/approve"); //URL
	    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("tid","UTF-8") + "=" + URLEncoder.encode(tid, "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(gongu.getGnbcode(), "UTF-8"));//공구번호
	    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(gongu.getGmid(), "UTF-8"));	//구매자
	    urlBuilder.append("&" + URLEncoder.encode("pg_token","UTF-8") + "=" + URLEncoder.encode(pg_token, "UTF-8"));
	    
	    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopaySuccess", "UTF-8")); //성공시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayFail", "UTF-8")); //실패시 돌아갈주소
	    urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayCansel", "UTF-8")); //취소시 돌아갈주소
	    	    
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
	    
	    if(sb.toString().length()>0) {
	    	return "gongu/PaySuccess";
	    } else {
	    	asvc.deleteGonguRegister(gongu);
	    	return "gongu/PayFail";
	    }*/
	    
		//공동구매/공구 카카오결제정보 DB입력 :: 결제 전에 입력, 결제 실패하면 삭제할 것. --- DB확인과 결제성공실패 여부에 따라 결과가 바뀜
    	int gonguInsert = gbsvc.insertGonguRegister(gongu);
    	
    	if (gonguInsert>0) {
    	
    		// 결제승인 시작
			StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/approve"); //URL
		    urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
		    urlBuilder.append("&" + URLEncoder.encode("tid","UTF-8") + "=" + URLEncoder.encode(tid, "UTF-8"));
		    urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(gongu.getGgbcode(), "UTF-8"));//공구번호
		    urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(gongu.getGgmid(), "UTF-8"));	//구매자
		    urlBuilder.append("&" + URLEncoder.encode("pg_token","UTF-8") + "=" + URLEncoder.encode(pg_token, "UTF-8"));
		    
		    urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopaySuccess", "UTF-8")); //성공시 돌아갈주소
		    urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayFail", "UTF-8")); //실패시 돌아갈주소
		    urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") + "=" + URLEncoder.encode("http://localhost:8080/controller/kakaopayCansel", "UTF-8")); //취소시 돌아갈주소
		    	    
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
	    
		    //공동구매/공구 카카오결제 성공 :: 성공페이지로 이동
		    if(sb.toString().length()>0) {
		    	System.out.println("DB입력성공-결제성공");
		    	return "gongu/PaySuccess";
		    	
		    //공동구매/공구 카카오결제 실패 :: 입력된 DB 삭제 후, 실패페이지로 이동		    	
		    } else {
		    	int deleteResult = gbsvc.deleteGonguRegister(gongu);
		    	
		    	if(deleteResult>0) {
		    		System.out.println("DB입력성공-결제실패-DB삭제성공");
		    	} else {
		    		System.out.println("DB입력성공-결제실패-DB삭제실패");
		    	}
		    	return "gongu/PayFail";		    		
		    }
		   
	    //공동구매/공구 카카오결제정보 DB실패 :: 결제 전에 입력 실패
    	} else {
    		System.out.println("DB입력실패");
    		return "gongu/PayFail";
    	}
		
	    
	    
	}
	
	
	// ajax > 새 페이지에서 이동하므로 생략됨
	@RequestMapping(value="/kakaopaySuccess")
	public String kakaopaySuccess() {
		System.out.println("/kakaopayApproval 결제성공 : 현재이동없음. 마이페이지로 보낼것");
		return "gongu/PaySuccess";
	}
	
	@RequestMapping(value="/kakaopayFail")
	public String kakaopayFail() {
		System.out.println("/kakaopayFail 결제실패 : 재결제 메세지 & 새로고침");
		return "gongu/PayFail";
	}
	
	@RequestMapping(value="/kakaopayCansel")
	public String kakaopayCansel() {
		System.out.println("/kakaopayCansel 결제취소 : 취소메세지 & 새로고침");
		return "gongu/PayCancel";
	}
	
	
}
