package com.study.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsDAO {
	int goodsAdd(int Category_id, String title, String goods, int price, int stock, String img, String content);
	ArrayList<GoodsDTO> itemList(int id, int start, int end);
	ArrayList<GoodsDTO> itemInfo(int id);
}
