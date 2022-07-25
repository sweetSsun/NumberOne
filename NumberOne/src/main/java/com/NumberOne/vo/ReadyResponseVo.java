package com.NumberOne.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ReadyResponseVo {

	private String tid;
	private String next_redirect_pc_url;	
	private String partner_order_id;
	private Date created_at;
	
}
