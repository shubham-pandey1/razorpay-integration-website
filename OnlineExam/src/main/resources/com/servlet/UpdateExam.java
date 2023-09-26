package com.servlet;

import java.io.IOException;
import java.sql.Connection;

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
 * Servlet implementation class UpdateExam
 */
public class UpdateExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		
		String name,duration,eid;
		name = request.getParameter("name");
		duration = request.getParameter("duration");
		eid = request.getParameter("eid");
		
		HttpSession sess = request.getSession();
		
		Exam exam = new Exam();
		exam.setName(name);
		exam.setDuration(duration);
		exam.setEid(Integer.parseInt(eid));
		
		Connection con = null;
		
		con = Conpro.getCon();
		System.out.println(con);
		
		ExamDaoImp edi = new ExamDaoImp(con);
		
		boolean pro = edi.updateExam(exam);
		if(pro) {
			sess.setAttribute("umsg", "Details Updated Successfully ");
		}
		else {
			sess.setAttribute("fumsg","There is an error occured....");
		}
		response.sendRedirect("admin/AllExam.jsp");
	}

}
