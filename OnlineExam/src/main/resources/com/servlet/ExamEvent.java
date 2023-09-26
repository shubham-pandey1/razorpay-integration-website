package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuestDao;
import com.daoImp.ExamDaoImp;
import com.daoImp.QuestDaoImp;
import com.db.Conpro;
import com.entity.Answer;
import com.entity.Exam;
import com.entity.Question;
import com.entity.Result;
import com.entity.User;
import com.google.gson.Gson;
import com.mysql.cj.Session;

/**
 * Servlet implementation class ExamEvent
 */
public class ExamEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int n = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("start");
		PrintWriter pw = response.getWriter();
		HttpSession getsess = request.getSession();
		Exam exam = (Exam)getsess.getAttribute("exam");
		User user = (User)getsess.getAttribute("user");
		
		QuestDaoImp qdi = new QuestDaoImp(Conpro.getCon());
		List<Question> allquest = qdi.allQuestion(exam.getEid()+"");
		
		int len = allquest.size();
		
		if(n<0)
			n++;
		else if(n >= len)
			n--;
		
		Question quest = null;
		if(n>-1 && n<len)
		 quest = allquest.get(n);
		
		
		
		String qid,opt,by,status,data;
		
		data = request.getParameter("data");
		System.out.println(data);
		
		Gson gson = new Gson();
		
		qid = quest.getQid()+"";
		opt = request.getParameter("option");
		by = request.getParameter("by");
		
		status = false+"";
		
		if(opt != null && opt.equalsIgnoreCase(quest.getAnswer()))
			status = true+"";
		Answer ans = new Answer();
		
		ans.setUid(user.getSid());
		ans.setAnswer(opt);
		ans.setQid(Integer.parseInt(qid));
		ans.setStatus(status);
		
		ExamDaoImp edi = new ExamDaoImp(Conpro.getCon());
		boolean su;
		System.out.println(ans);
		su = edi.saveAnswer(ans, user.getEid()); 
		
		if(by.equals("submit")) {
			
			System.out.println("submit");
			Result temp,result;
			temp = edi.resultData(user.getSid(), exam.getEid());
			
			result = new Result();
			result.setCorrect(temp.getCorrect());
			result.setIncorrect(temp.getIncorrect());
			result.setSid(user.getSid());
			result.setEid(exam.getEid());
			result.setName(user.getName());
			result.setEmail(user.getEmail());
			result.setExam(exam.getName());
			result.setTotal(len);
			
			boolean f = edi.saveResult(result);
			
			if(f) {
				getsess.removeAttribute("user");
				getsess.removeAttribute("exam");
				pw.print("submit.jsp");
			}
			else {
				pw.print(f);
				
			}
		}
		
		else if(by.equals("next") && n<len) {
			++n;
			System.out.println(n);
			if(n<len) {
				quest = allquest.get(n);
			}
		}
		else if(by.equals("prev") && n>-1) {
			--n;
			System.out.println(n);
			if(n>-1)
				quest = allquest.get(n);
		}
		if(!by.equals("submit")) {
		quest.setQid(n+1);
		
		if(n<0 && n>= len) quest.setQuest(null);
		
		data = gson.toJson(quest);
		pw.print(data);
		
		System.out.println(data);
		System.out.println("end");
		}
	}
}
