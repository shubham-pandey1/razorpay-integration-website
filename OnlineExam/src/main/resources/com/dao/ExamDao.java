package com.dao;

import java.util.List;

import com.entity.AllExam;
import com.entity.Answer;
import com.entity.Exam;
import com.entity.Result;

public interface ExamDao {
	
	public int examRegistration(Exam exam);  
	
	public boolean createTable(String name);
	
	public List<AllExam> allExams();
	
	public List<Exam> examName();
	
	public boolean updateExam(Exam exam);
		
	public Exam examById(int eid);
	
	public boolean deleteExam(int eid);
	
	public List<Result> result();
	
	public List<Exam> exames();
	
	public boolean examAnswer(String name);
	
	public boolean saveAnswer(Answer ans, int eid);
	
	public Result resultData(int uid, int eid) ;
	
	public boolean saveResult(Result result);
	
}
