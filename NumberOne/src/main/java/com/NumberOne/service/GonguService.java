package com.NumberOne.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.NumberOne.dao.AdminDao;
import com.NumberOne.dao.BoardDao;
import com.NumberOne.dto.NoticeDto;
import com.NumberOne.dto.Paging;

@Service
public class GonguService {

	private ModelAndView mav;

	@Autowired
	private AdminDao adao;
	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private AdminService asvc;
	
	@Autowired
	private HttpSession session;

	
	
	

}




