package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.UserDaoImp;
import com.db.Conpro;
import com.entity.User;

/**
 * Servlet implementation class UpdateStuDet
 */
public class UpdateStuDet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStuDet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		
		String name,phone,pass,email,address,examid,sid;
		name = request.getParameter("name");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		pass = request.getParameter("pass");
		address = request.getParameter("address");
		examid = request.getParameter("exam");
		sid = request.getParameter("sid");	
		
		
		HttpSession sess = request.getSession();
		
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(pass);
		user.setMobile(phone);
		user.setAddress(address);
		user.setEid(Integer.parseInt(examid));
		user.setSid(Integer.parseInt(sid));
		
		
		Connection con = null;
			
		
		con = Conpro.getCon();
		System.out.println(con);
		
		UserDaoImp udi = new UserDaoImp(con);
		
		
		
		
		boolean pro = udi.updateDetail(user);
		if(pro) {
			sess.setAttribute("umsg", "Details Updated Successfully ");
			
		}
		else {
			sess.setAttribute("fumsg","There is an error occured....");
		}
		response.sendRedirect("admin/AllStudent.jsp");
	}

}
