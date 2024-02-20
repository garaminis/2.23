package com.study.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	ArrayList<ReviewDTO> reviewList(int a);
	ArrayList<ReviewDTO> qnaList(int a);
	int qnaSave(String a, int a1, int b, int c, String d);
	int qnaUpdate(int a);
}
