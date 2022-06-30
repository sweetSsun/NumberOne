package com.NumberOne.dao;

import java.util.ArrayList;

import com.NumberOne.dto.MemberDto;

public interface AdminDao {

	ArrayList<MemberDto> selectmemberList(String searchVal);

}
