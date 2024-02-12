package com.study.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopDAO {
	int add(String userId, String psw, String name, String birth, String zipcode, String adress, String mobile,
			String mail, String gender); // 회원가입 db insert
//	ArrayList<GoodsDTO> list(); //상품리스트 보이기
//	GoodsDTO view(int x); 
	ArrayList<BoardCategoryDTO> category(); // 게시판 category select option
	int dologin(String id, String psw); // login 하기
	int idchk(String userId); // 아이디 중복체크
	ArrayList<MemberDTO> myLoad(String userId); //회원정보로드(실패)
	int modify(String userId, String name, String birth, String zipcode, String adress, String mobile,String mail); // 회원정보수정
	int myWrite(String title, String writer, String content, int category); // 글 작성
	ArrayList<BoardDTO> boardList();
}
