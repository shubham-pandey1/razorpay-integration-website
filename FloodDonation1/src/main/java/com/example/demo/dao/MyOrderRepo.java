package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.MyOrder;

public interface MyOrderRepo extends JpaRepository<MyOrder, Long> {
	public MyOrder findByOrderId(String orderId); 
}
