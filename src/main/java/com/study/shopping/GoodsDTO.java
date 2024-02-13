package com.study.shopping;

import lombok.Data;

@Data
public class GoodsDTO {
	int id;
	String userid;
	int category_id;
	int category;
	String title;
	String goods;
	int price;
	int stock;
	int delivery;
	String img1;
	String content;
}
