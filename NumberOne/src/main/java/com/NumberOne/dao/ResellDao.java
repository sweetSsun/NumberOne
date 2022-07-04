package com.NumberOne.dao;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.UsedBoardDto;

public interface ResellDao {



	String selectMaxNumber_ub();
	

	
	String selectMaxNumber_gd();



	int insertResellWrite_gd(GoodsDto gdDto);



	int insertResellWrite_ub(UsedBoardDto ubDto);

	
	
}
