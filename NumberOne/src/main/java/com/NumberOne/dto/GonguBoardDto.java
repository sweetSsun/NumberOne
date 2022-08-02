package com.NumberOne.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GonguBoardDto {
	//공지글(추천, 스크랩, 신고, 댓글 없음)
	private String gbcode;		//글번호
	private String gbmid;		//작성자
	private String gbtitle;   	//제목
	private String gbcontents;	//내용
	private String gbdate;		//작성일
	private String gbimg;		//사진
	private String gbitemname;	//카카오페이결제시 불러올 item_name 품목이름
	private int gbitemprice;	//카카오페이결제시 불러올 total_amount 가격
	private int gbstate;		//글상태	
	private int gbhits;			//조회수
	private int gbfix;			//고정공지
	
	// 파일 처리를 위한 필드
	private MultipartFile gbimgfile;	//공지글 작성 시 파일 저장
	private String originImg_gb;		//공지글 수정 시 수정 전의 기존 파일명

	// 글 출력시 필요한 필드
	private String gbnickname;      //작성자 닉네임
	
	//마이페이지 출력
	private String ggdate;//결제일
	private String gbitemprice2; // 천단위 ','
	
	
	
	public String getGbcode() {
		return gbcode;
	}
	public void setGbcode(String gbcode) {
		this.gbcode = gbcode;
	}
	public String getGbmid() {
		return gbmid;
	}
	public void setGbmid(String gbmid) {
		this.gbmid = gbmid;
	}
	public String getGbtitle() {
		return gbtitle;
	}
	public void setGbtitle(String gbtitle) {
		this.gbtitle = gbtitle;
	}
	public String getGbcontents() {
		return gbcontents;
	}
	public void setGbcontents(String gbcontents) {
		this.gbcontents = gbcontents;
	}
	public String getGbdate() {
		return gbdate;
	}
	public void setGbdate(String gbdate) {
		this.gbdate = gbdate;
	}
	public String getGbimg() {
		return gbimg;
	}
	public void setGbimg(String gbimg) {
		this.gbimg = gbimg;
	}
	public String getGbitemname() {
		return gbitemname;
	}
	public void setGbitemname(String gbitemname) {
		this.gbitemname = gbitemname;
	}
	public int getGbitemprice() {
		return gbitemprice;
	}
	public void setGbitemprice(int gbitemprice) {
		this.gbitemprice = gbitemprice;
	}
	public int getGbstate() {
		return gbstate;
	}
	public void setGbstate(int gbstate) {
		this.gbstate = gbstate;
	}
	public int getGbhits() {
		return gbhits;
	}
	public void setGbhits(int gbhits) {
		this.gbhits = gbhits;
	}
	public int getGbfix() {
		return gbfix;
	}
	public void setGbfix(int gbfix) {
		this.gbfix = gbfix;
	}
	public MultipartFile getGbimgfile() {
		return gbimgfile;
	}
	public void setGbimgfile(MultipartFile gbimgfile) {
		this.gbimgfile = gbimgfile;
	}
	public String getOriginImg_gb() {
		return originImg_gb;
	}
	public void setOriginImg_gb(String originImg_gb) {
		this.originImg_gb = originImg_gb;
	}
	public String getGbnickname() {
		return gbnickname;
	}
	public void setGbnickname(String gbnickname) {
		this.gbnickname = gbnickname;
	}
	public String getGgdate() {
		return ggdate;
	}
	public void setGgdate(String ggdate) {
		this.ggdate = ggdate;
	}
	public String getGbitemprice2() {
		return gbitemprice2;
	}
	public void setGbitemprice2(String gbitemprice2) {
		this.gbitemprice2 = gbitemprice2;
	}
	@Override
	public String toString() {
		return "GonguBoardDto [gbcode=" + gbcode + ", gbmid=" + gbmid + ", gbtitle=" + gbtitle + ", gbcontents="
				+ gbcontents + ", gbdate=" + gbdate + ", gbimg=" + gbimg + ", gbitemname=" + gbitemname
				+ ", gbitemprice=" + gbitemprice + ", gbstate=" + gbstate + ", gbhits=" + gbhits + ", gbfix=" + gbfix
				+ ", gbimgfile=" + gbimgfile + ", originImg_gb=" + originImg_gb + ", gbnickname=" + gbnickname
				+ ", ggdate=" + ggdate + ", gbitemprice2=" + gbitemprice2 + "]";
	}
	



}
