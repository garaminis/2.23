package com.study.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	ArrayList<ReviewDTO> reviewList(int a); //select
	ArrayList<ReviewDTO> qnaList(int a);
//	BoardDTO view(int x); //param1, param2, param3
	int qnaSave(String a, int a1, int b, int c, String d);
	int qnaUpdate(int a);
//	int remove(int x);
//	int modify(int mId, String mTitle, String mContent, String mWriter);
}
