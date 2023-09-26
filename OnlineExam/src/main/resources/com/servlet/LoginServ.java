package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.ExamDaoImp;
import com.daoImp.UserDaoImp;

import com.db.Conpro;
import com.entity.Exam;
import com.entity.User;

/**
 * Servlet implementation class LoginServ
 */
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			UserDaoImp dao = new UserDaoImp(Conpro.getCon());
			String id, pass,term,ustype;
			HttpSession sess = request.getSession();
			
			id = request.getParameter("id");
			pass = request.getParameter("pass");
			term = request.getParameter("term");
			ustype = request.getParameter("user");
			System.out.println(ustype);
			
			if(term != null && !ustype.equals("---Select---")) {
				User user = dao.getData(id);
				if(user != null && ustype.equalsIgnoreCase("Admin")) {
					if(user.getPassword() != null && user.getPassword().equals(pass)) {
						sess.setAttribute("admin", "(gMlQC8N?n:a1\"7!rL^s");
						response.sendRedirect("admin/home.jsp");
					}
					else {
						sess.setAttribute("iumsg", "Invalid user id or password");
						response.sendRedirect("index.jsp");
					}
				}
				else {
				if(user != null && user.getPassword() != null && user.getPassword().equals(pass)) {
					if(user.getExamstatus().equals("Absent")) {
					Exam exam = new ExamDaoImp(Conpro.getCon()).examById(user.getEid());
					sess.setAttribute("user", user);
					sess.setAttribute("exam", exam);
					
					response.sendRedirect("instruction.jsp");
				}
				else {
					sess.setAttribute("status", "You can only once attend the exam");
					response.sendRedirect("index.jsp");
				}
				}
				else {
					sess.setAttribute("iumsg", "Invalid user id or password");
					response.sendRedirect("index.jsp");
				}
				}
			}
			else {
				response.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
