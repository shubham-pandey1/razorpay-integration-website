package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.QuestDaoImp;
import com.daoImp.UserDaoImp;
import com.db.Conpro;
import com.entity.Question;
import com.entity.User;

/**
 * Servlet implementation class UpdateQuest
 */
public class UpdateQuest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html");
		
		PrintWriter pw = response.getWriter();
		String quest,a,b,c,d,ans,eid,qid;
		quest = request.getParameter("question");
		a = request.getParameter("a");
		b = request.getParameter("b");
		c = request.getParameter("c");
		d = request.getParameter("d");
		ans = request.getParameter("option");
		eid = request.getParameter("eid");
		qid = request.getParameter("qid");
		
		System.out.println(eid);
		HttpSession sess = request.getSession();
		if(!ans.equalsIgnoreCase("---select---")) {
		
		Question question = new Question();
		question.setQuest(quest);
		question.setOptiona(a);
		question.setOptionb(b);
		question.setOptionc(c);
		question.setOptiond(d);
		question.setAnswer(ans);
		question.setQid(Integer.parseInt(qid));
		
		Connection con = null;
		
		con = Conpro.getCon();
		System.out.println(con);
		
		QuestDaoImp qdi = new QuestDaoImp(con);
		
		boolean f = qdi.editQuest(eid, question);
		
		if(f)
			sess.setAttribute("umsg", "Question updated successfully");
		
		else 
			sess.setAttribute("fumsg","There is an error occured....");
			
		response.sendRedirect("admin/AllQuest.jsp?eid="+eid);
		}
		
	}

}
