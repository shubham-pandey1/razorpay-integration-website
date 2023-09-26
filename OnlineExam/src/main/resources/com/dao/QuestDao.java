package com.dao;

import java.util.List;

import com.entity.Question;

public interface QuestDao {
	
	public int addQuest(Question question, int eid);
	
	public List<Question> allQuestion(String eid);
	
	public boolean deleteQuest(String qid, String eid);
	
	public boolean editQuest(String eid, Question quest);
	
	public Question getQuestion(String qid, String eid);
	
	public int noQuestion(String eid);
		
}
