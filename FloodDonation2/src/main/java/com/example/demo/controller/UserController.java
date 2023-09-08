package com.example.demo.controller;

import java.io.DataOutput;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ObjectFactoryCreatingFactoryBean;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.MyOrder;
import com.example.demo.dao.MyOrderRepo;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

@Controller
public class UserController {

	@RequestMapping("/index")
	public String hello() {
		return "index";
	}
	
	@Autowired
	private MyOrderRepo myOrderRepo;
	
	@RequestMapping("/user/create_order")
	@ResponseBody
	public String createOrder(@RequestBody Map<String, Object> data)throws Exception {
		System.out.println("hello");
		System.out.println(data);
		int amt = Integer.parseInt(data.get("amount").toString());
		var client = new RazorpayClient("rzp_test_8YSQOMzpEtoQcs", "dldIr6JzE4HfSITG0z2yvYzh");
		JSONObject ob = new JSONObject();
		ob.put("amount", amt*100);
		ob.put("currency", "INR");
		ob.put("receipt", "txn_234525");
		
//		creating new order
		
		Order order = client.orders.create(ob);
		System.out.println(order);
		
		MyOrder myOrder = new MyOrder();
		
		myOrder.setAmount(order.get("amount")+"");
		myOrder.setOrderId(order.get("id"));
		myOrder.setPaymentId(order.get(null));
		myOrder.setName(data.get("name")+"");
		myOrder.setStatus("created");
		myOrder.setReceipt(order.get("receipt"));
		
		this.myOrderRepo.save(myOrder);
		
		return order.toString();
	}
	
	@RequestMapping("/update_order")
	public ResponseEntity<?> updateOrder(@RequestBody Map<String, Object> data){
		
		MyOrder myOrder = this.myOrderRepo.findByOrderId(data.get("order_id").toString());
		myOrder.setPaymentId(data.get("payment_id")+"");
		myOrder.setStatus(data.get("status")+"");
		
		this.myOrderRepo.save(myOrder);
		
		System.out.println(data);
		return ResponseEntity.ok(Map.of("msg","Updated"));
	}
}
