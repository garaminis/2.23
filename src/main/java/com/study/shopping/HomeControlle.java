package com.study.shopping;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeControlle {
	
	@Autowired
	private GoodsDAO gdao; 
	@Autowired
	private ReviewDAO rdao;

	@GetMapping("/pushItem")
	public String home() {
		return "pushItem";
	}
	
	@PostMapping("/goodsAdd")
	@ResponseBody
	public String doGoodsAdd(HttpServletRequest req) {
		String category_id = req.getParameter("category_id");
		String title = req.getParameter("title");
		String goods = req.getParameter("goods");
		String price = req.getParameter("price");
		String stock = req.getParameter("stock");
		String delivery = req.getParameter("delivery");
		String img = req.getParameter("img");
		String content = req.getParameter("content");
		int n = gdao.goodsAdd(Integer.parseInt(category_id), title, goods, Integer.parseInt(price), Integer.parseInt(stock), img, content); //insert

	return "" + n;
	}
	
	
	@PostMapping("/list")
	@ResponseBody
	public String doList() {
		ArrayList<ReviewDTO> alReview = rdao.reviewList();
		JSONArray ja = new JSONArray();
		
		System.out.println("list");
//		for(int i = 0; i < alReview.size(); i++) {
//			System.out.println("id : " + alReview.get(i).id);
//			System.out.println("score : " + alReview.get(i).score);
//			System.out.println("userid : " + alReview.get(i).userid);
//			System.out.println("created : " + alReview.get(i).created);
//			System.out.println("content : " + alReview.get(i).content);
//		}
		
		
		for(int i = 0; i < alReview.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", alReview.get(i).id);
			jo.put("score", alReview.get(i).score);
			jo.put("userid", alReview.get(i).userid);
			jo.put("created", alReview.get(i).created);
			jo.put("content", alReview.get(i).content);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
//	@GetMapping("/login")
//	public String doLogin() {
//		return "login";
//	}
//	@GetMapping("/logout")
//	public String doLogout() {
//		return "home";
//	}
//	@GetMapping("/list")
//	public String doList() {
//		return "home";
//	}
//	@GetMapping("/pushItem")
//	public String doPush() {
//		return "home";
//	}
	
	  @GetMapping("/itemView")
	  public String itemView(@RequestParam("id") String id,Model model) {
		System.out.println(id);
		ArrayList<GoodsDTO> item = gdao.itemList(Integer.parseInt(id));
		System.out.println(item);
	    model.addAttribute("itemList", item);
	    return "/itemView";
	  }
	
}
