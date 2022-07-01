package com.NumberOne.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {

	//일반게시글, 자취방 자랑	

	private String bdcode; 			//글번호
	private String bdrgcode;		//지역코드(말머리)
	private String bdcategory;		//카테고리	
	private String bdmid;			//작성자
	private String bdtitle;			//제목
	private String bdcontents;		//내용
	private String bddate;			//작성일
	private String bdimg;			//대표사진
	private String bddetailimg;		//상세사진
	private int bdstate;			//글상태
	private int bdhits;				//조회수
	
	private String bdrecommend;        	//추천수-자취방 자랑, 일반게시글 (recommend 테이블 조인)
	private String bdwarning;			//신고수-자취방 자랑, 일반게시글 (warning 테이블 조인)
	private String bdreply;				//댓글수-자취방 자랑, 일반게시글 (reply 테이블 조인)
	private String bdscrap;            	//스크랩수-자취방 자랑 (필요없으면 삭제)
	
	//파일 처리를 위한 필드
	private MultipartFile bdimgfile;			//프로필 파일
	private MultipartFile[] bddetailimgfile;	//프로필 파일
	
	//검색할 때 필요한 필드
	private String bdnickname;      //작성자 닉네임
	
	public String getBdcode() {
		return bdcode;
	}

	public void setBdcode(String bdcode) {
		this.bdcode = bdcode;
	}

	public String getBdrgcode() {
		return bdrgcode;
	}

	public void setBdrgcode(String bdrgcode) {
		this.bdrgcode = bdrgcode;
	}

	public String getBdcategory() {
		return bdcategory;
	}

	public void setBdcategory(String bdcategory) {
		this.bdcategory = bdcategory;
	}

	public String getBdmid() {
		return bdmid;
	}

	public void setBdmid(String bdmid) {
		this.bdmid = bdmid;
	}

	public String getBdtitle() {
		return bdtitle;
	}

	public void setBdtitle(String bdtitle) {
		this.bdtitle = bdtitle;
	}

	public String getBdcontents() {
		return bdcontents;
	}

	public void setBdcontents(String bdcontents) {
		this.bdcontents = bdcontents;
	}

	public String getBddate() {
		return bddate;
	}

	public void setBddate(String bddate) {
		this.bddate = bddate;
	}

	public String getBdimg() {
		return bdimg;
	}

	public void setBdimg(String bdimg) {
		this.bdimg = bdimg;
	}

	public String getBddetailimg() {
		return bddetailimg;
	}

	public void setBddetailimg(String bddetailimg) {
		this.bddetailimg = bddetailimg;
	}

	public int getBdstate() {
		return bdstate;
	}

	public void setBdstate(int bdstate) {
		this.bdstate = bdstate;
	}

	public int getBdhits() {
		return bdhits;
	}

	public void setBdhits(int bdhits) {
		this.bdhits = bdhits;
	}

	public String getBdrecommend() {
		return bdrecommend;
	}

	public void setBdrecommend(String bdrecommend) {
		this.bdrecommend = bdrecommend;
	}

	public String getBdwarning() {
		return bdwarning;
	}

	public void setBdwarning(String bdwarning) {
		this.bdwarning = bdwarning;
	}

	public String getBdreply() {
		return bdreply;
	}

	public void setBdreply(String bdreply) {
		this.bdreply = bdreply;
	}

	public String getBdscrap() {
		return bdscrap;
	}

	public void setBdscrap(String bdscrap) {
		this.bdscrap = bdscrap;
	}

	public MultipartFile getBdimgfile() {
		return bdimgfile;
	}

	public void setBdimgfile(MultipartFile bdimgfile) {
		this.bdimgfile = bdimgfile;
	}

	public MultipartFile[] getBddetailimgfile() {
		return bddetailimgfile;
	}

	public void setBddetailimgfile(MultipartFile[] bddetailimgfile) {
		this.bddetailimgfile = bddetailimgfile;
	}

	public String getBdnickname() {
		return bdnickname;
	}

	public void setBdnickname(String bdnickname) {
		this.bdnickname = bdnickname;
	}

	@Override
	public String toString() {
		return "BoardDto [bdcode=" + bdcode + ", bdrgcode=" + bdrgcode + ", bdcategory=" + bdcategory + ", bdmid="
				+ bdmid + ", bdtitle=" + bdtitle + ", bdcontents=" + bdcontents + ", bddate=" + bddate + ", bdimg="
				+ bdimg + ", bddetailimg=" + bddetailimg + ", bdstate=" + bdstate + ", bdhits=" + bdhits
				+ ", bdrecommend=" + bdrecommend + ", bdwarning=" + bdwarning + ", bdreply=" + bdreply + ", bdscrap="
				+ bdscrap + ", bdimgfile=" + bdimgfile + ", bddetailimgfile=" + Arrays.toString(bddetailimgfile)
				+ ", bdnickname=" + bdnickname + "]";
	}

}
