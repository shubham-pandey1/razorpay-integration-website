package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daoImp.UserDaoImp;
import com.db.Conpro;

/**
 * Servlet implementation class Attendence
 */
public class Attendence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Attendence() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		UserDaoImp udi = new UserDaoImp(Conpro.getCon());
		udi.studentAttendence(sid);
		response.sendRedirect("exam.jsp");
	}

}
