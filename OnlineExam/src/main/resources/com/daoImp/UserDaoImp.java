package com.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.UserDao;

import com.entity.User;
import com.mysql.cj.protocol.Resultset;

public class UserDaoImp implements UserDao{

	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	
	public UserDaoImp(Connection con) {
		this.con = con;
	}
	
	
	@Override
	public User getData(String id) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			String sql = "Select * from user where sid =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new User();
				user.setSid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setExam(rs.getString(7));
				user.setEid(rs.getInt(8));
				user.setExamstatus(rs.getString(9));
			
			}
			
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public boolean Register(User user) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "insert into user(name,email,mobile,password,address,exam,examid, examstatus) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getMobile());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getAddress());
			
			ps.setInt(7, user.getEid());
			ps.setString(8, user.getExamstatus());
			
			PreparedStatement ps1 = con.prepareStatement("select name from exam where eid = ?");
			ps1.setInt(1, user.getEid());
			
			rs = ps1.executeQuery();
			
			String exam = null;
			while(rs.next())
				exam = rs.getString(1);
			
			ps.setString(6, exam);
			
			int i = ps.executeUpdate();
			
			if(i>0) f= true;
			
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}


	@Override
	public int userId() {
		// TODO Auto-generated method stub
		int id = 0;
		try {
			PreparedStatement ps = con.prepareStatement("Select max(sid) from user");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				id = rs.getInt(1);
			
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return id;
	}


	@Override
	public List<User> allStudent() {
		// TODO Auto-generated method stub
		List<User> list = new ArrayList<User>();
		User user;
		try {
			String sql = "Select * from user";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new User();
				user.setSid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setExam(rs.getString(7));
				user.setExamstatus(rs.getString(9));
				
				list.add(user);
			}
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean updateDetail(User user) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			
			String sql = "update user set name = ?,email = ?,mobile = ?,password = ?,address = ?,exam = ?,examid = ? where sid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getMobile());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getAddress());
			
			PreparedStatement ps1 = con.prepareStatement("select name from exam where eid = ?");
			ps1.setInt(1, user.getEid());
			rs = ps1.executeQuery();
			
			String exam = null;
			while(rs.next())
				exam = rs.getString(1);
			
			ps.setString(6, exam);
			ps.setInt(7, user.getEid());
			ps.setInt(8, user.getSid());
			
			int i = ps.executeUpdate();
			
			if(i>0) f= true;
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public boolean DeleteStu(String sid) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			System.out.println(sid);
			String sql = "delete from user where sid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1,Integer.parseInt(sid) );
			
			int i = ps.executeUpdate();
			
			if(i>0) f= true;
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public void studentAttendence(String sid) {
		// TODO Auto-generated method stub
		String sql = "update user set examstatus = ? where sid = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "Present");
			ps.setString(2, sid);
			
			int i= ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	
}
