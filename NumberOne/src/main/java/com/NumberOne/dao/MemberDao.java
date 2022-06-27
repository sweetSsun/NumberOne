package com.NumberOne.dao;

import org.apache.ibatis.annotations.Select;

public interface MemberDao {

	@Select("SELECT MID FROM MEMBERS WHERE MID='ADMIN'")
	String test1();

}
