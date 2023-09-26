package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.QuestDaoImp;
import com.daoImp.UserDaoImp;
import com.db.Conpro;

/**
 * Servlet implementation class DeleteQuest
 */
public class DeleteQuest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eid, qid;
		
		eid = request.getParameter("eid");
		qid = request.getParameter("qid");
		
		 boolean f = new QuestDaoImp(Conpro.getCon()).deleteQuest(qid,eid);
		 
		 HttpSession sess = request.getSession();
		 
		 if(f) {
			 sess.setAttribute("dmsg", "Deleted Successfully");
		 }
		 else {
			 sess.setAttribute("fdmsg", "Error Occured");
		}
		 response.sendRedirect("admin/AllQuest.jsp?eid="+eid);
	}

}
