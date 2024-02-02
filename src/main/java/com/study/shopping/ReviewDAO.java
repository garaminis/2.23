package com.study.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	ArrayList<ReviewDTO> reviewList(); //select
//	BoardDTO view(int x); //param1, param2, param3
//	int save(String sTitle, String sContent, String sWriter);
//	int remove(int x);
//	int modify(int mId, String mTitle, String mContent, String mWriter);
}
