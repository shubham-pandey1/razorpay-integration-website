package com.servlet;

import java.awt.Checkbox;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.*;
import com.daoImp.UserDaoImp;
import com.db.*;
import com.entity.*;

/**
 * Servlet implementation class RegisterServletj
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
			PrintWriter pw = response.getWriter();
			String name,phone,pass,email,address,exam,term;
			name = request.getParameter("name");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			pass = request.getParameter("pass");
			address = request.getParameter("address");
			exam = request.getParameter("exam");
			term = request.getParameter("term");	
			
			System.out.println(term);
			HttpSession sess = request.getSession();
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(pass);
			user.setMobile(phone);
			user.setAddress(address);
			user.setEid(Integer.parseInt(exam));
			user.setExamstatus("Absent");
			
			
			Connection con = null;
				
			
			con = Conpro.getCon();
			System.out.println(con);
			
			UserDaoImp udi = new UserDaoImp(con);
			
			
			
			if(term != null || !exam.equals("---Select---") ) {
				boolean pro = udi.Register(user);
				
			
			if(pro){
				int id = udi.userId();
				
				System.out.println(id);
				pw.println(id);
			}
			else {
				
				pw.println("fail");
			}
				
			}
			
			
	}
	
}
