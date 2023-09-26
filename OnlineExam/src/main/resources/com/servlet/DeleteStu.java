package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.UserDaoImp;
import com.db.Conpro;

/**
 * Servlet implementation class DeleteStu
 */
public class DeleteStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		 boolean f = new UserDaoImp(Conpro.getCon()).DeleteStu(sid);
		 
		 HttpSession sess = request.getSession();
		 
		 if(f) {
			 sess.setAttribute("dmsg", "Deleted Successfully");
		 }
		 else {
			 sess.setAttribute("fdmsg", "Error Occured");
		}
		 response.sendRedirect("admin/AllStudent.jsp");
	}

}
