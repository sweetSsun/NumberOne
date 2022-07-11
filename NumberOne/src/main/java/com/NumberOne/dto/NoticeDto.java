package com.NumberOne.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeDto {
	//공지글(추천, 스크랩, 신고, 댓글 없음)
	private String nbcode;		//글번호
	private String nbmid;		//작성자
	private String nbtitle;   	//제목
	private String nbcontents;	//내용
	private String nbdate;		//작성일
	private String nbimg;		//사진	
	private int nbstate;		//글상태	
	private int nbhits;			//조회수
	private int nbfix;			//고정공지
	
	// 파일 처리를 위한 필드
	private MultipartFile nbimgfile;//공지글 작성 시 파일 저장
	private String originImg;		//공지글 수정 시 수정 전의 기존 파일명

	// 글 출력시 필요한 필드
	private String nbnickname;      //작성자 닉네임

	public String getNbcode() {
		return nbcode;
	}

	public void setNbcode(String nbcode) {
		this.nbcode = nbcode;
	}

	public String getNbmid() {
		return nbmid;
	}

	public void setNbmid(String nbmid) {
		this.nbmid = nbmid;
	}

	public String getNbtitle() {
		return nbtitle;
	}

	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}

	public String getNbcontents() {
		return nbcontents;
	}

	public void setNbcontents(String nbcontents) {
		this.nbcontents = nbcontents;
	}

	public String getNbdate() {
		return nbdate;
	}

	public void setNbdate(String nbdate) {
		this.nbdate = nbdate;
	}

	public String getNbimg() {
		return nbimg;
	}

	public void setNbimg(String nbimg) {
		this.nbimg = nbimg;
	}

	public int getNbstate() {
		return nbstate;
	}

	public void setNbstate(int nbstate) {
		this.nbstate = nbstate;
	}

	public int getNbhits() {
		return nbhits;
	}

	public void setNbhits(int nbhits) {
		this.nbhits = nbhits;
	}

	public MultipartFile getNbimgfile() {
		return nbimgfile;
	}

	public void setNbimgfile(MultipartFile nbimgfile) {
		this.nbimgfile = nbimgfile;
	}

	public String getOriginImg() {
		return originImg;
	}

	public void setOriginImg(String originImg) {
		this.originImg = originImg;
	}

	public String getNbnickname() {
		return nbnickname;
	}

	public void setNbnickname(String nbnickname) {
		this.nbnickname = nbnickname;
	}

	@Override
	public String toString() {
		return "NoticeDto [nbcode=" + nbcode + ", nbmid=" + nbmid + ", nbtitle=" + nbtitle + ", nbcontents="
				+ nbcontents + ", nbdate=" + nbdate + ", nbimg=" + nbimg + ", nbstate=" + nbstate + ", nbhits=" + nbhits
				+ ", nbfix=" + nbfix + ", nbimgfile=" + nbimgfile + ", originImg=" + originImg + ", nbnickname="
				+ nbnickname + "]";
	}

}
