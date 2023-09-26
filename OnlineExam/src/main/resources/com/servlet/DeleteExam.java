package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.ExamDaoImp;
import com.db.Conpro;

/**
 * Servlet implementation class DeleteExam
 */
public class DeleteExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int eid = Integer.parseInt(request.getParameter("eid"));
		
		ExamDaoImp edi = new ExamDaoImp(Conpro.getCon());
		boolean st = edi.deleteExam(eid);
		
		HttpSession session = request.getSession();
		
		if(st) {
			session.setAttribute("umsg", "Exam Deleted Successfully");
		}
		else {
			session.setAttribute("fumsg", "There is some error occured...");
		}
		response.sendRedirect("admin/AllExam.jsp");
	}

}
