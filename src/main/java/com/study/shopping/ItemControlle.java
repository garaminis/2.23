package com.study.shopping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemControlle {
	
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
		System.out.println(n);
	return "" + n;
	}
	
	@GetMapping("/itemView")
	public String itemView(@RequestParam("id") String id,Model model) {
		System.out.println(id);
		int pageStart = 0;
		int pageEnd = 16;
		ArrayList<GoodsDTO> item = gdao.itemList(Integer.parseInt(id), pageStart, pageEnd);
		System.out.println(item);
	    model.addAttribute("itemList", item);
	    return "/itemView";
	}
	  
	@GetMapping("/goods")
	public String goodsView(@RequestParam("id") String id,Model model) {
	    System.out.println(id);
	    ArrayList<GoodsDTO> item = gdao.itemInfo(Integer.parseInt(id));
		System.out.println(item);
		   model.addAttribute("itemInfo", item);
		   return "/goods";
	}
	
	@GetMapping("/announ")
	public String getAnnoun() {
		return "announ";
	}
	
	@GetMapping("/tkorder")
	public String getTKOrder(HttpServletRequest req,Model model) {
		//goods.jps에서 받은 이미지 상품제목 갯수 가격받아오기
		String img = req.getParameter("img");
		model.addAttribute("img",img);
		String goodsName = req.getParameter("goodsName");
		model.addAttribute("goodsName",goodsName);
		String goodsSend = req.getParameter("goodsSend");
		model.addAttribute("goodsSend",goodsSend);
		int result = Integer.parseInt(req.getParameter("result"));
		model.addAttribute("result",result);
		int goodsPrice = result*Integer.parseInt(req.getParameter("goodsPrice").trim());
		model.addAttribute("goodsPrice",goodsPrice);
			
		return "/order";
	}
	@GetMapping("/order")
	public String getOrder(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String goods_id = req.getParameter("goods_id");
		String cart_id = req.getParameter("sendOrder");
		String[] orderList = cart_id.split(",");
		ArrayList<GoodsDTO> cartItems = new ArrayList<>();
			
		System.out.println("cart_id : " + cart_id);
		System.out.println("orderList : " + orderList);
		System.out.println("goods_id : " + goods_id);
		System.out.println("id : " + id);
		if (goods_id != null) { // 상세페이지에서 온경우 제품정보를 모아서 처리
			cartItems = gdao.itemInfo(Integer.parseInt(goods_id));
			model.addAttribute("cartItems", cartItems);
			System.out.println("goodsPage");
			return "order";
				
		} else if (cart_id != null) { // 카트에서온경우 장바구니정보를 모아서 처리
			System.out.println("cartPage");
			for(int i = 0; i < orderList.length; i++) {
				System.out.println(orderList[i]);
				System.out.println("for진입");
				cartItems.add(gdao.cartOrder(Integer.parseInt(orderList[i])));
			}
			for(int i = 0; i < cartItems.size(); i++) {
				System.out.println(cartItems.get(i));
				System.out.println("fooor");
			}
			model.addAttribute("cartItems", cartItems);
			return "order";
			}    
		return "mypage";
	}
		
	@GetMapping("/orderEnd")
	public String getOrderEnd() {
		return "orderEnd";
	}

	@GetMapping("/itemScroll")
	@ResponseBody
	public String itemScroll(HttpServletRequest req) {
		String id = req.getParameter("id");
		String lastItem = req.getParameter("lastItem");
		int page = Integer.parseInt(req.getParameter("page")) * 16;
		int pageMax = page + 16;
		System.out.println("id : " + id);
		System.out.println("page : " + page);
		System.out.println("pagemax : " + pageMax);
			
		ArrayList<GoodsDTO> item = gdao.itemList(Integer.parseInt(id),page, pageMax);
		System.out.println(item);
			
		JSONArray ja = new JSONArray();
			for(int i=0; i < item.size(); i++) {
				JSONObject jo = new JSONObject();
				jo.put("name",item.get(i).name);
				jo.put("id",item.get(i).id);
				jo.put("img1",item.get(i).img1);
				jo.put("title",item.get(i).title);
				jo.put("price",item.get(i).price);
				ja.add(jo);
			}
		System.out.println("ja : " + ja);
		return ja.toJSONString();
	}
		  
	@GetMapping("/cart")
	public String getCart(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
			    
		String id = (String) session.getAttribute("id");
			    
		if (id != null) {
			ArrayList<GoodsDTO> cartItems = gdao.getCart(id);
			model.addAttribute("cartItems", cartItems);
			return "cart";
		}
		return "cart";
	}
			
	@PostMapping("/addCart")
	@ResponseBody
	public String addCart(HttpServletRequest req) {
		String user_id = req.getParameter("member_id");
		System.out.println("user_id : " + user_id);
		int member_id = gdao.getIdNum(user_id);
				
		String goods_id = req.getParameter("goods_id");
		String cnt = req.getParameter("cnt");
		int m = gdao.checkCart(member_id, Integer.parseInt(goods_id));
		System.out.println("member_id : " + member_id);
		System.out.println("goods_id : " + goods_id);
		System.out.println("cnt : " + cnt);
		if(m == 0) {
			int n = gdao.addCart(member_id, Integer.parseInt(goods_id), Integer.parseInt(cnt));
			System.out.println("n:" + n);
			return "" + n;
		} else {
			System.out.println("m:" + m);
			return ""+0;
		}
				
	}
			  
	@PostMapping("/delCart")
	@ResponseBody
	public String delCart(@RequestParam(value="checked[]") Integer[] cartValues) {
		int n = 0;
		for(int i = 0; i < cartValues.length; i++) {
			int value = cartValues[i];
			System.out.println("value: " + value);
			n = gdao.delCart(value);
		}
		return "" + n;
	}
			  
	@PostMapping("/getReview")
	@ResponseBody
	public String getRiview(HttpServletRequest req) {
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		ArrayList<ReviewDTO> review = rdao.reviewList(Integer.parseInt(id));
		System.out.println("review : " + review);
				
		JSONArray ja = new JSONArray();
		for(int i=0; i < review.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",review.get(i).id);
			jo.put("rating",review.get(i).rating);
			jo.put("user_id",review.get(i).user_id);
			jo.put("created",review.get(i).created);
			jo.put("content",review.get(i).content);
			ja.add(jo);
	}
		System.out.println("ja : " + ja);
		return ja.toJSONString();
	}	
			  
	@PostMapping("/updateCart")
	@ResponseBody
	public String updateCart(HttpServletRequest req) {
		String id = req.getParameter("id");
		String cnt = req.getParameter("cnt");
				  
		int n = gdao.updateCart(Integer.parseInt(id),Integer.parseInt(cnt));
				 
		return "" + n;
	}
	
	@PostMapping("/getQna")
	@ResponseBody
	public String getQna(HttpServletRequest req) {
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		ArrayList<ReviewDTO> qna = rdao.qnaList(Integer.parseInt(id));
		System.out.println("qna : " + qna);
				
		JSONArray ja = new JSONArray();
		for(int i=0; i < qna.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",qna.get(i).id);
			jo.put("member_id",qna.get(i).member_id);
			jo.put("content",qna.get(i).content);
			jo.put("qwriter",qna.get(i).qwriter);
			jo.put("qusdate",qna.get(i).qusdate);
			jo.put("answer",qna.get(i).answer);
			jo.put("awriter",qna.get(i).awriter);
			jo.put("ansdate",qna.get(i).ansdate);
			jo.put("state",qna.get(i).state);
			jo.put("name",qna.get(i).name);
			ja.add(jo);
		}
		System.out.println("ja : " + ja);
		return ja.toJSONString();
	}
			  
	@PostMapping("/setAnswer")
	@ResponseBody
	public String setAnswer(HttpServletRequest req) {
		String qwriter = req.getParameter("member_name");
		String member_id = req.getParameter("member_id");// 멤버id
		String id = req.getParameter("id");// 상품id
		String qna_id = req.getParameter("qna_id");
		String content = req.getParameter("content");
				
		System.out.println("id : " + id);
		System.out.println("qna_id : " + qna_id);
		System.out.println("content : " + content);
		System.out.println("qwriter : " + qwriter);
		int n = rdao.qnaSave(qwriter, Integer.parseInt(member_id), Integer.parseInt(id), Integer.parseInt(qna_id), content);
		int n2 = rdao.qnaUpdate(Integer.parseInt(qna_id));
		return "" + n;
	}

}