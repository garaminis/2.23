package com.study.shopping;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsDAO {
	int goodsAdd(int Category_id, String title, String goods, int price, int stock, int delivery,
				String img);
}
