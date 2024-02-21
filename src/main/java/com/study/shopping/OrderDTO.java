package com.study.shopping;

import lombok.Data;

@Data
public class OrderDTO {
	int id;
	String user_id;
	String title;
	int cnt;
	int sales;
	String delname;
	String deladress;
	String delmobile;
	String delreq;
	String delivery_name;
	String payment_name;
	String order_state_name;
	String created;
	int state;
}
