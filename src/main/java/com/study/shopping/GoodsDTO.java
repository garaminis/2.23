package com.study.shopping;

import lombok.Data;

@Data
public class GoodsDTO {
	int id;
	String userid;
	int category_id;
	String title;
	String goods;
	int price;
	int stuck;
	int delivery;
	String img;
}
