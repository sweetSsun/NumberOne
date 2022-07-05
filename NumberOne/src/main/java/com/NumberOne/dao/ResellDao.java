package com.NumberOne.dao;

import java.util.ArrayList;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.UsedBoardDto;

public interface ResellDao {



	String selectMaxNumber_ub();
	

	
	String selectMaxNumber_gd();



	int insertResellWrite_gd(GoodsDto gdDto);



	int insertResellWrite_ub(UsedBoardDto ubDto);



	ArrayList<UsedBoardDto> selectResellBuyList(String mregion);



	ArrayList<UsedBoardDto> selectResellSellList(String mregion);

	
	
}
