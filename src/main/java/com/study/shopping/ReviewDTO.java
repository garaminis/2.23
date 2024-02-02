package com.study.shopping;

import lombok.Data;

@Data
public class ReviewDTO {
	int id;
	int score;
	String userid;
	String created;
	String content;
}
