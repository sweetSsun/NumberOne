package com.NumberOne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NumberOne.service.KakaoPayService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {

	@Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaosvc;
    
    
    @GetMapping("/kakaoPayReady")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPayReady")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaosvc.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
    
}
