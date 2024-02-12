package com.study.shopping;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {
	@Autowired
	private ShopDAO sdao;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	@GetMapping("/community")
	public String community() {
		return "community";
	}
	
	@GetMapping("/mypage")
	public String my_page() {
		return "mypage";
	}
	@GetMapping("/myUpdate")
	public String myUpdate() {
		return "myUpdate";
	}
	
	@PostMapping("/myLoad")
	@ResponseBody
	public String update(HttpServletRequest req) {
		String id = req.getParameter("user_id");
		ArrayList<MemberDTO> data = sdao.myLoad(id);
		
		JSONArray ja = new JSONArray();
		for(int i=0; i < data.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("name",data.get(i).name);
			jo.put("birth",data.get(i).birth);
			jo.put("zipcode",data.get(i).zipcode);
			jo.put("adress",data.get(i).adress);
			jo.put("mobile",data.get(i).mobile);
			jo.put("mail",data.get(i).mail);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	@GetMapping("/customer")
	public String customer() {
		return "customer";
	}
	@GetMapping("/notice") // 게시판리스트(페이지아직)
	public String doList(Model model) {
		ArrayList<BoardDTO> boards= sdao.boardList();
		model.addAttribute("boardlist",boards);
		return "notice";
	}
	@GetMapping("/write")
	public String write() {
		return "write";
	}
//	@GetMapping("/boardList")
//	public String doList(Model model) {
//		ArrayList<board0DTO> boards= sdao.boardList();
//		System.out.println(boards);
//		model.addAttribute("boardlist",boards);
//		System.out.println(boards);
////		ArrayList<GoodsDTO> goods=sdao.list();
////		model.addAttribute("goods",goods);
//		return "notice";
//	}
//	@GetMapping("/product")
//	public String doProduct(@RequestParam("id") int id, Model model) {
//		GoodsDTO gooddto= sdao.view(id);
//		model.addAttribute("goods",gooddto);
//		return "product";
//	}

	@PostMapping("/doSignup") //회원가입
	@ResponseBody
	public String goSignup(HttpServletRequest req) {
		String userId=req.getParameter("userId");
		String psw=req.getParameter("psw");
		String name=req.getParameter("name");
		String mobile=req.getParameter("mobile");
		String mail=req.getParameter("mail");
		String birth=req.getParameter("birth");
		String adress=req.getParameter("adress");
		String zipcode=req.getParameter("zipcode");
		String gender=req.getParameter("gender");
		
		int n=sdao.add(userId,psw,name,mobile,mail,birth,adress,zipcode,gender);
		return ""+n;
	}
	@PostMapping("/dologin") //로그인
	@ResponseBody
	public String doLogin (HttpServletRequest req) {
		String id=req.getParameter("loginId");
		String psw=req.getParameter("passwd");
		int n = sdao.dologin(id,psw);
		if(n==1) {
			HttpSession sess= req.getSession(); //세션 객체를 얻고 sess변수에 저장
			sess.setAttribute("id",id);
		}
		return""+n;
	}
	@PostMapping("/logout") //로그아웃
	@ResponseBody
	public String dologout(HttpServletRequest req) {
		HttpSession sess= req.getSession(); 
		sess.invalidate();
		return "1" ;
	}
	@PostMapping("/idcheck") //아이디 중복체크
	@ResponseBody
	public String doIdcheck(HttpServletRequest req) {
		String userId=req.getParameter("userId");
		int n= sdao.idchk(userId);
		return ""+n;
	}
	@PostMapping("/myModify") //회원정보수정
	@ResponseBody
	public String doMymodify(HttpServletRequest req) {
		String userId=req.getParameter("user_id");
		String name=req.getParameter("name");
		String birth=req.getParameter("birth");
		String zipcode=req.getParameter("zip_code");
		String adress=req.getParameter("adress");
		String mobile=req.getParameter("mobile");
		String mail=req.getParameter("mail");
		
		int n= sdao.modify(userId, name, birth, zipcode, adress, mobile, mail);
		System.out.println(n);
		return ""+n;
		
	}
	@GetMapping("/catagoryboard") //카테고리 select option에 로딩
	@ResponseBody
	public String doCategory() {
		ArrayList<BoardCategoryDTO> categorys = sdao.category();
		
		JSONArray ja=new JSONArray();
		for(int i=0; i<categorys.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",categorys.get(i).id);
			jo.put("name", categorys.get(i).name);
			ja.add(jo);
		}
		return ja.toJSONString();
	}	
	@PostMapping("/doWrite") // 글 작성
	@ResponseBody
	public String doWrite(HttpServletRequest req) {
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String text=req.getParameter("text");
		int category=Integer.parseInt(req.getParameter("category"));
		
		int n=sdao.myWrite(title,writer,text,category);
		return ""+n;
	}
	
//	@PostMapping("/myLoad")
//	@ResponseBody
//	public String  doMyLoad (HttpServletRequest req) {
//		String userId=req.getParameter("userid");
//		member0DTO myMy=sdao.myLoad(userId);
//		System.out.println(myMy);
//		JSONArray ja=new JSONArray();
//		JSONObject jo = new JSONObject();
//		
//		return ja.toJSONString();
//	}	
	
//	@PostMapping("/write")
//	@ResponseBody
//	public String goWrite(HttpServletRequest req) {
//		
//	}

}
