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
	private int gbstate;		//글상태	
	private int gbhits;			//조회수
	private int gbfix;			//고정공지
	
	// 파일 처리를 위한 필드
	private MultipartFile gbimgfile;	//공지글 작성 시 파일 저장
	private String originImg_gb;		//공지글 수정 시 수정 전의 기존 파일명

	// 글 출력시 필요한 필드
	private String gbnickname;      //작성자 닉네임
	
	private String gb_contents;		//DB입력 전 view 내용 :: 아래 부분과 합쳐서 보내기 위함
	private String gb_item_name;	//카카오페이결제시 불러올 item_name 품목이름
	private String gb_total_amount;	//카카오페이결제시 불러올 total_amount 가격

	
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

	public String getGb_contents() {
		return gb_contents;
	}

	public void setGb_contents(String gb_contents) {
		this.gb_contents = gb_contents;
	}
	
	public String getGb_item_name() {
		return gb_item_name;
	}

	public void setGb_item_name(String gb_item_name) {
		this.gb_item_name = gb_item_name;
	}

	public String getGb_total_amount() {
		return gb_total_amount;
	}

	public void setGb_total_amount(String gb_total_amount) {
		this.gb_total_amount = gb_total_amount;
	}
	
	
	@Override
	public String toString() {
		return "GonguBoardDto [gbcode=" + gbcode + ", gbmid=" + gbmid + ", gbtitle=" + gbtitle + ", gbcontents="
				+ gbcontents + ", gbdate=" + gbdate + ", gbimg=" + gbimg + ", gbstate=" + gbstate + ", gbhits=" + gbhits
				+ ", gbfix=" + gbfix + ", gbimgfile=" + gbimgfile + ", originImg_gb=" + originImg_gb + ", gbnickname="
				+ gbnickname + ", gb_contents=" + gb_contents + ", gb_item_name=" + gb_item_name + ", gb_total_amount=" + gb_total_amount + "]";
	}

	

}
