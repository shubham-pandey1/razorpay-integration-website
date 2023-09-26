package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDao {
	public User getData(String id);
	public boolean Register(User user);
	
	public int userId();

	public List<User> allStudent();
	
	public boolean updateDetail(User user);

	public boolean DeleteStu(String sid);
	
	public void studentAttendence(String sid);
	
}
