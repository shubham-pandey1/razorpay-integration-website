package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ExamReg
 */
public class ExamReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamReg() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		PrintWriter pw = response.getWriter();
		String name,duration;
		name = request.getParameter("name");
		duration = request.getParameter("duration");
		
		
		System.out.println(name);
		
		Exam exam = new Exam();
		
		exam.setName(name);
		exam.setDuration(duration);
		
		Connection con = null;
			
		
		con = Conpro.getCon();
		System.out.println(con);
		
		ExamDaoImp edi = new ExamDaoImp(con);
		
		int id = edi.examRegistration(exam);
		
		boolean su,at;
		su = edi.createTable("ExamQuest"+id);
		
		at = edi.createTable("ExamAnswer"+id);
		
		System.out.println(id);
		pw.println(id);
		
		HttpSession sess = request.getSession();
		sess.setAttribute("id", id+"");
	}

}
